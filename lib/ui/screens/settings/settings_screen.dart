import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_info/flutter_app_info.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:gaimon/gaimon.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:scan_doc/domain/di/get_it_services.dart';
import 'package:scan_doc/ui/resurses/colors.dart';
import 'package:scan_doc/ui/resurses/icons.dart';
import 'package:scan_doc/ui/resurses/images.dart';
import 'package:scan_doc/ui/resurses/text.dart';
import 'package:scan_doc/ui/widgets/buttons/simple_button.dart';
import 'package:scan_doc/ui/widgets/image_back.dart';
import 'package:scan_doc/ui/widgets/svg_icon.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _configService = getItService.configService;
  @override
  Widget build(BuildContext context) {
    final version = AppInfo.of(context).package.version;
    return ImageBack(
      image: AppImages.mainBack,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'Settings',
            style: AppText.h2.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    _SettingsGroup(
                      items: [
                        AnimatedSettingsTile(
                          title: 'Password',
                          icon: AppImages.password,
                          onTap: () =>
                              getItService.navigatorService.onInfoPassword(
                            onOpen:
                                getItService.navigatorService.onSettingPassword,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    _SettingsGroup(
                      items: [
                        AnimatedSettingsTile(
                          title: 'Terms of Use',
                          icon: AppImages.terms,
                          onTap: () => launchUrlString(_configService.termsLink),
                        ),
                        AnimatedSettingsTile(
                          title: 'Privacy Policy',
                          icon: AppImages.privacy,
                         onTap: () => launchUrlString(_configService.privacyLink),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    _SettingsGroup(
                      items: [
                        AnimatedSettingsTile(
                          title: 'Version',
                          icon: AppImages.version,
                          onTap: () {},
                          trailing: Text(
                            '${version.major}.${version.minor}.${version.patch}',
                            style: AppText.text16.copyWith(
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                        ),
                        AnimatedSettingsTile(
                          title: 'Support',
                          icon: AppImages.support,
                          onTap: () => FlutterEmailSender.send(Email(
                            recipients: ['CharlotteMitchell2048C@outlook.com'], 
                            body: 'Thank you for your feedback!', 
                            subject: 'Support of "PDFScanSmart"'
                          )),
                        ),
                        AnimatedSettingsTile(
                          title: 'Rate us',
                          icon: AppImages.rate,
                          onTap: () => InAppReview.instance.requestReview(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingsGroup extends StatelessWidget {
  final List<Widget> items;

  const _SettingsGroup({
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            color: CupertinoColors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.white.withOpacity(0.1),
              width: 0.5,
            ),
          ),
          child: Column(
            children: [
              for (int i = 0; i < items.length; i++) ...[
                items[i],
                if (i != items.length - 1)
                  Padding(
                    padding: const EdgeInsets.only(left: 54),
                    child: Divider(
                      height: 0.5,
                      color: Colors.white.withOpacity(0.1),
                    ),
                  ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedSettingsTile extends StatefulWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;
  final Widget? trailing;

  const AnimatedSettingsTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.trailing,
  });

  @override
  State<AnimatedSettingsTile> createState() => _AnimatedSettingsTileState();
}

class _AnimatedSettingsTileState extends State<AnimatedSettingsTile>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _rotateAnimation = Tween<double>(
      begin: 0.0,
      end: 0.1,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) {
        _controller.reverse();
        Gaimon.selection();
        widget.onTap();
      },
      onTapCancel: () => _controller.reverse(),
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        child: Row(
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.scale(
                  scale: _scaleAnimation.value,
                  child: Transform.rotate(
                    angle: _rotateAnimation.value,
                    child: child,
                  ),
                );
              },
              child: Image.asset(
                widget.icon,
                width: 26,
                height: 26,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                widget.title,
                style: AppText.text16.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            if (widget.trailing != null) ...[
              const SizedBox(width: 8),
              widget.trailing!,
            ],
            const SizedBox(width: 4),
            Icon(
              CupertinoIcons.chevron_right,
              color: Colors.white.withOpacity(0.5),
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class _Premium extends StatelessWidget {
  const _Premium();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 20,
            right: 10,
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: const Color(0xFF1e1a25).withOpacity(0.8),
            border: Border.all(
              color: AppColors.primaryGrad1,
              width: 0.5,
            ),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 0),
                blurRadius: 20,
                spreadRadius: 0,
                color: AppColors.primaryGrad1.withOpacity(.3),
              ),
            ],
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Column(
              children: [
                Text(
                  'Unlock new Features!',
                  style: AppText.text16.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 72),
                  child: SimpleButton(
                    onPressed: getItService.navigatorService.onGetPremium,
                    title: 'Get Premium',
                  ),
                ),
              ],
            ),
          ),
        ),
        const SvgIcon(
          icon: AppIcons.pro,
          size: 50,
        ),
      ],
    );
  }
}
