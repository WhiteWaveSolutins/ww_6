import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gaimon/gaimon.dart';
import 'package:scan_doc/data/models/folder.dart';
import 'package:scan_doc/data/services/shared_preferences_service.dart';
import 'package:scan_doc/domain/di/get_it_services.dart';
import 'package:scan_doc/ui/resurses/colors.dart';
import 'package:scan_doc/ui/resurses/text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:scan_doc/ui/widgets/toast/app_toast.dart';

class AddFolderModal extends StatefulWidget {
  final Folder? folder;
  final Function(Folder)? setFolder;

  const AddFolderModal({
    super.key,
    this.folder,
    this.setFolder,
  });

  @override
  State<AddFolderModal> createState() => _AddFolderModalState();
}

class _AddFolderModalState extends State<AddFolderModal> {
  int folder = 1;
  bool usePassword = false;
  final nameController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    if (widget.folder != null) {
      folder = widget.folder!.imageIndex;
      nameController.text = widget.folder!.name;
      usePassword = widget.folder!.havePassword;
    }
  }

  void save() async {
    if (nameController.text.isEmpty) {
      showAppToast('Enter name');
      return;
    }
    setState(() => isLoading = true);
    late Folder? newFolder;
    newFolder = null;
    if (widget.folder != null) {
      newFolder = await getItService.folderUseCase.editFolder(
        name: nameController.text,
        image: folder,
        havePassword: usePassword,
        folderId: widget.folder!.id,
      );
    } else {
      newFolder = await getItService.folderUseCase.addFolder(
        name: nameController.text,
        image: folder,
        havePassword: usePassword,
      );
    }

    setState(() => isLoading = false);
    if (newFolder != null) {
      Gaimon.success();
      widget.setFolder?.call(newFolder);
      Navigator.of(context).pop();
    } else {
      Gaimon.error();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AppColors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 8),
              Container(
                width: 80,
                height: 6,
                decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                widget.folder == null ? 'New folder' : 'Edit folder',
                style: AppText.text2bold,
              ),
              const SizedBox(height: 24),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.white.withOpacity(0.2),
                    ),
                  ),
                  CarouselSlider(
                    items: [
                      for (int i = 0; i < 9; i++)
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              width: 150,
                              height: 150,
                              padding: const EdgeInsets.all(25),
                              child: Image.asset(
                                'assets/images/folders/folder${i + 1}.png',
                                width: 100,
                                height: 100,
                              ),
                            ),
                            //TODO: HIDE PREMIUM
                            //if (i > 2)
                            //  const SvgIcon(
                            //    icon: AppIcons.pro,
                            //    size: 50,
                            //  ),
                          ],
                        ),
                    ],
                    options: CarouselOptions(
                      height: 150,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.4,
                      initialPage: folder - 1,
                      enableInfiniteScroll: false,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      onPageChanged: (index, _) {
                        Gaimon.selection();
                        folder = index + 1;
                      },
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    TextField(
                      controller: nameController,
                      style: AppText.text16,
                      decoration: const InputDecoration(
                        hintText: 'Name',
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 40,
                                top: 5,
                              ),
                              child: Text(
                                'Use password to open',
                                style: AppText.text3,
                              ),
                            ),
                            //TODO: HIDE PREMIUM
                            //const Positioned(
                            //  right: 0,
                            //  child: Padding(
                            //    padding: EdgeInsets.only(bottom: 5),
                            //    child: SvgIcon(
                            //      icon: AppIcons.pro,
                            //      size: 50,
                            //    ),
                            //  ),
                            //),
                          ],
                        ),
                        CupertinoSwitch(
                          activeColor: AppColors.primaryGrad1,
                          trackColor: AppColors.white.withOpacity(0.2),
                          onChanged: (_) async {
                            if (!usePassword) {
                              final password = await SharedPreferencesService.getPassword();
                              if (password == null) {
                                getItService.navigatorService.onInfoPassword(
                                  onOpen: () {
                                    setState(() => usePassword = true);
                                    Navigator.of(context).pop();
                                  },
                                );
                                return;
                              }
                            }
                            setState(() => usePassword = !usePassword);
                          },
                          value: usePassword,
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            CupertinoButton(
                              onPressed: () {
                                if (isLoading) return;
                                Gaimon.selection();
                                save();
                              },
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  //TODO: HIDE PREMIUM
                                  //border: Border.all(
                                  //  color: AppColors.primaryGrad1,
                                  //),
                                  //color: AppColors.white.withOpacity(.1),
                                  gradient: const LinearGradient(
                                    colors: [
                                      AppColors.primaryGrad1,
                                      AppColors.primaryGrad2,
                                    ],
                                  ),
                                ),
                                child: isLoading
                                    ? const Center(
                                        child: CupertinoActivityIndicator(
                                          color: Colors.white,
                                          radius: 10,
                                        ),
                                      )
                                    : const Icon(
                                        CupertinoIcons.checkmark_alt,
                                        color: Colors.white,
                                      ),
                              ),
                            ),
                            //TODO: HIDE PREMIUM
                            //const SvgIcon(
                            //  icon: AppIcons.pro,
                            //  size: 50,
                            //),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
        SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
      ],
    );
  }
}
