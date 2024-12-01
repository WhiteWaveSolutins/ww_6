import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gaimon/gaimon.dart';
import 'package:scan_doc/ui/resurses/colors.dart';
import 'package:scan_doc/ui/resurses/text.dart';
import 'package:scan_doc/ui/widgets/toast/app_toast.dart';

class RenameModal extends StatefulWidget {
  final String name;
  final Function(String) onRename;

  const RenameModal({
    super.key,
    required this.name,
    required this.onRename,
  });

  @override
  State<RenameModal> createState() => _RenameModalState();
}

class _RenameModalState extends State<RenameModal> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.text = widget.name;
  }

  void onRename() {
    Gaimon.selection();
    if (controller.text.isEmpty) {
      showAppToast('Enter name document');
      return;
    }
    //TODO:Если уже есть такое имя
    widget.onRename(controller.text);
    Navigator.of(context).pop();
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
                'Edit Title',
                style: AppText.text2bold,
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    TextField(
                      controller: controller,
                      style: AppText.text16,
                      decoration: const InputDecoration(
                        hintText: 'Name document',
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CupertinoButton(
                          onPressed: onRename,
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: const LinearGradient(
                                colors: [
                                  AppColors.primaryGrad1,
                                  AppColors.primaryGrad2,
                                ],
                              ),
                            ),
                            child: const Icon(
                              CupertinoIcons.checkmark_alt,
                              color: Colors.white,
                            ),
                          ),
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
