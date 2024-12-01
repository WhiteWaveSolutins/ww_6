import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gaimon/gaimon.dart';
import 'package:scan_doc/domain/di/get_it_services.dart';
import 'package:scan_doc/ui/resurses/colors.dart';
import 'package:scan_doc/ui/resurses/text.dart';
import 'package:scan_doc/ui/widgets/buttons/simple_button.dart';
import 'package:scan_doc/ui/widgets/gradient_text.dart';
import 'package:url_launcher/url_launcher.dart';

class OnboardingWidget extends StatelessWidget {
  final int index;
  final int maxIndex;
  final String buttonText;
  final Widget image;
  final String subtitle;
  final String? subtitleTapper;
  final Function()? tapperOnTap;
  final String title;
  final Function() onTapButton;

  const OnboardingWidget({
    super.key,
    this.buttonText = 'Continue',
    required this.onTapButton,
    required this.title,
    this.subtitleTapper,
    required this.image,
    this.tapperOnTap,
    required this.subtitle,
    required this.maxIndex,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              image,
              Container(
                width: double.infinity,
                height: 150,
                decoration:  BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      AppColors.black.withOpacity(0.9),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration:  BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.transparent,
                AppColors.black.withOpacity(0.9),
              ],
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              GradientText.primary(
                title,
                textAlign: TextAlign.center,
                style: AppText.prompt.copyWith(
                  fontSize: 40,
                ),
              ),
              const SizedBox(height: 16),
              Column(
                children: [
                  Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: AppText.text2bold.copyWith(
                      color: AppColors.white.withOpacity(0.5),
                    ),
                  ),
                  if (subtitleTapper != null)
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      minSize: 1,
                      onPressed: tapperOnTap,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                          border: Border(
                            bottom: BorderSide(
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ),
                        child: Text(
                          subtitleTapper!,
                          textAlign: TextAlign.center,
                          style: AppText.text2bold.copyWith(
                            color: AppColors.white.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < maxIndex; i++) ...[
                    if (i == index)
                      Container(
                        width: 20,
                        height: 5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: AppColors.white,
                        ),
                      )
                    else
                      Container(
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.white.withOpacity(0.3),
                        ),
                      ),
                    if (i != maxIndex - 1) const SizedBox(width: 5),
                  ],
                ],
              ),
              const SizedBox(height: 16),
              BottomOnboarding(
                buttonText: buttonText,
                onTapButton: onTapButton,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BottomOnboarding extends StatelessWidget {
  final String buttonText;
  final Function() onTapButton;

  const BottomOnboarding({
    super.key,
    required this.onTapButton,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SimpleButton(
          title: buttonText,
          onPressed: (){
            Gaimon.selection();
            onTapButton();
          },
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CupertinoButton(
                padding: EdgeInsets.zero,
                minSize: 1,
                onPressed: () => launchUrl(
                  Uri.parse(getItService.configService.termsLink),
                  mode: LaunchMode.inAppWebView,
                ),
                child: Text(
                  'Terms of Use',
                  style: AppText.text2bold.copyWith(
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
              ),
              CupertinoButton(
                padding: EdgeInsets.zero,
                minSize: 1,
                onPressed: () => launchUrl(
                  Uri.parse(getItService.configService.privacyLink),
                  mode: LaunchMode.inAppWebView,
                ),
                child: Text(
                  'Privacy Policy',
                  style: AppText.text2bold.copyWith(
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
              ),
              //TODO: HIDE PREMIUM
              //CupertinoButton(
              //  padding: EdgeInsets.zero,
              //  minSize: 1,
              //  onPressed: () {},
              //  child: Text(
              //    'Restore',
              //    style: AppText.text2bold.copyWith(
              //      color: Colors.white.withOpacity(0.5),
              //    ),
              //  ),
              //),
            ],
          ),
        ),
      ],
    );
  }
}
