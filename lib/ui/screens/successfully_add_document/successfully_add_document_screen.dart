import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:scan_doc/data/models/document.dart';
import 'package:scan_doc/domain/di/get_it_services.dart';
import 'package:scan_doc/ui/resurses/colors.dart';
import 'package:scan_doc/ui/resurses/icons.dart';
import 'package:scan_doc/ui/resurses/images.dart';
import 'package:scan_doc/ui/resurses/text.dart';
import 'package:scan_doc/ui/state_manager/folder/state.dart';
import 'package:scan_doc/ui/state_manager/store.dart';
import 'package:scan_doc/ui/widgets/buttons/close_button.dart';
import 'package:scan_doc/ui/widgets/buttons/simple_button.dart';
import 'package:scan_doc/ui/widgets/gradient_text.dart';
import 'package:scan_doc/ui/widgets/image_back.dart';
import 'package:scan_doc/ui/widgets/modal/add_document_in_folder_modal.dart';
import 'package:scan_doc/ui/widgets/svg_icon.dart';
import 'package:share_plus/share_plus.dart';

class SuccessfullyAddDocumentScreen extends StatefulWidget {
  final Document document;

  const SuccessfullyAddDocumentScreen({
    super.key,
    required this.document,
  });

  @override
  State<SuccessfullyAddDocumentScreen> createState() => _SuccessfullyAddDocumentScreenState();
}

class _SuccessfullyAddDocumentScreenState extends State<SuccessfullyAddDocumentScreen> {
  List<int> folderIds = [];

  @override
  Widget build(BuildContext context) {
    return ImageBack(
      image: AppImages.mainBack,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    AppCloseButton(padding: 22),
                  ],
                ),
              ),
              SizedBox(
                height: 230,
                child: CarouselSlider(
                  items: [
                    for (var path in widget.document.paths)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            width: 168,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.memory(
                              File(path).readAsBytesSync(),
                            ),
                          ),
                        ),
                      ),
                  ],
                  options: CarouselOptions(
                    height: double.infinity,
                    initialPage: 0,
                    viewportFraction: 0.4,
                    enableInfiniteScroll: false,
                    onPageChanged: (index, _) {},
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Text(
                      widget.document.name,
                      style: AppText.text16,
                    ),
                    const SizedBox(height: 24),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            AppColors.primaryGrad1,
                            AppColors.primaryGrad2,
                          ],
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    GradientText.primary(
                      'Files saved successfully',
                      style: AppText.prompt.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Want to add them to a folder?',
                      style: AppText.text2bold.copyWith(
                        color: Colors.white.withOpacity(.3),
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
              if (folderIds.isEmpty)
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      constraints: BoxConstraints(
                        minHeight: 100,
                        maxHeight: MediaQuery.of(context).size.height - 100,
                      ),
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) => AddDocumentInFolderModal(
                        document: widget.document,
                        onReturnFolders: (v) => setState(() => folderIds = v),
                      ),
                    );
                  },
                  child: const SvgIcon(
                    icon: AppIcons.folder,
                    size: 50,
                  ),
                )
              else
                StoreConnector<AppState, FolderListState>(
                  converter: (store) => store.state.folderListState,
                  builder: (context, state) {
                    final folders = state.folders.where((e) => folderIds.contains(e.id)).toList();
                    return SizedBox(
                      height: 100,
                      child: CarouselSlider(
                        items: [
                          for (var folder in folders)
                            Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Column(
                                  children: [
                                    Image.asset(
                                      folder.image,
                                      height: 70,
                                    ),
                                    const SizedBox(height: 4),
                                    SizedBox(
                                      width: 100,
                                      child: Text(
                                        folder.name,
                                        maxLines: 1,
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        style: AppText.small,
                                      ),
                                    ),
                                  ],
                                ),
                                CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    getItService.documentUseCase.deleteFolderDocument(
                                      documentId: widget.document.id,
                                      folderId: folder.id,
                                    );
                                    folders.remove(folder);
                                    setState(() {});
                                  },
                                  child: const Icon(
                                    CupertinoIcons.clear_circled_solid,
                                    color: AppColors.red,
                                    size: 16,
                                  ),
                                ),
                              ],
                            ),
                        ],
                        options: CarouselOptions(
                          height: double.infinity,
                          initialPage: 0,
                          viewportFraction: 0.35,
                          enableInfiniteScroll: false,
                          onPageChanged: (index, _) {},
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    );
                  },
                ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    if (false)
                      Expanded(
                        child: SimpleButton(
                          title: 'Download',
                          icon: AppIcons.file,
                          onPressed: () {},
                        ),
                      ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: SimpleButton(
                        color: Colors.white.withOpacity(.1),
                        title: 'Share',
                        icon: AppIcons.returnI,
                        onPressed: () {
                          Share.shareXFiles(
                            widget.document.paths.map((e) => XFile(e)).toList(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
