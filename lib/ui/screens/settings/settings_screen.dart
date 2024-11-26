import 'package:flutter/material.dart';
import 'package:scan_doc/ui/resurses/colors.dart';
import 'package:scan_doc/ui/resurses/images.dart';
import 'package:scan_doc/ui/resurses/text.dart';
import 'package:scan_doc/ui/widgets/image_back.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ImageBack(
      image: AppImages.mainBack,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'Settings',
            style: AppText.h2,
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              _Box(
                items: [
                  _Item(
                    title: 'Password',
                    icon: AppImages.password,
                    onTap: () {},
                  ),
                ],
              ),
              SizedBox(height: 8),
              _Box(
                items: [
                  _Item(
                    title: 'About us',
                    icon: AppImages.about,
                    onTap: () {},
                  ),
                  _Item(
                    title: 'Terms of Use',
                    icon: AppImages.terms,
                    onTap: () {},
                  ),
                  _Item(
                    title: 'Privacy Policye',
                    icon: AppImages.privacy,
                    onTap: () {},
                  ),
                ],
              ),
              SizedBox(height: 8),
              _Box(
                items: [
                  _Item(
                    title: 'Version',
                    icon: AppImages.version,
                    onTap: () {},
                  ),
                  _Item(
                    title: 'Support',
                    icon: AppImages.support,
                    onTap: () {},
                  ),
                  _Item(
                    title: 'Rate use',
                    icon: AppImages.rate,
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Box extends StatelessWidget {
  final List<Widget> items;

  const _Box({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          for (int i = 0; i < items.length; i++) ...[
            items[i],
            if (i != items.length - 1)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Divider(
                  height: 0,
                  color: AppColors.white.withOpacity(0.5),
                ),
              ),
          ],
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final String icon;
  final String title;
  final Function() onTap;

  const _Item({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      child: Row(
        children: [
          Image.asset(
            icon,
            width: 29,
            height: 29,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: AppText.text16,
            ),
          ),
          const SizedBox(width: 16),
          const Icon(
            Icons.keyboard_arrow_right,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
