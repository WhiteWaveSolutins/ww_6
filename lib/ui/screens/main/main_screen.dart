import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:scan_doc/ui/resurses/icons.dart';
import 'package:scan_doc/ui/resurses/images.dart';
import 'package:scan_doc/ui/resurses/text.dart';
import 'package:scan_doc/ui/state_manager/store.dart';
import 'package:scan_doc/ui/widgets/image_back.dart';
import 'package:scan_doc/ui/widgets/modal/add_folder_modal.dart';
import 'package:scan_doc/ui/widgets/svg_icon.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late Store<AppState> _store;

  @override
  void initState() {
    super.initState();
    _store = StoreProvider.of<AppState>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return ImageBack(
      image: AppImages.mainBack,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'Documents',
            style: AppText.h2,
          ),
          actions: [
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  constraints: BoxConstraints(
                    minHeight: 100,
                    maxHeight: MediaQuery.of(context).size.height - 100,
                  ),
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) => const AddFolderModal(),
                );
              },
              icon: const SvgIcon(
                icon: AppIcons.folder,
                size: 26,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.zero,
          physics: const BouncingScrollPhysics(),
          child: Column(),
        ),
      ),
    );
  }
}
