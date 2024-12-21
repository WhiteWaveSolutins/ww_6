import 'package:flutter/material.dart';
import 'package:gaimon/gaimon.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:scan_doc/domain/di/get_it_services.dart';
import 'package:scan_doc/ui/resurses/images.dart';
import 'package:scan_doc/ui/screens/onboarding/widgets/onboarding_widget.dart';
import 'package:scan_doc/ui/widgets/image_back.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int page = 0;
  int onboardingCount = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ImageBack(
        image: AppImages.mainBack,
        child: SafeArea(
          child: page == 0
              ? OnboardingWidget(
                  index: 0,
                  maxIndex: 4,
                  image: Image.asset(
                    AppImages.onboarding1,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  title: 'PDF SCANNER',
                  subtitle: 'Scan your documents and convert them to a PDF',
                  onTapButton: () {
                    setState(() => page = 1);
                  },
                )
              : page == 1
                  ? OnboardingWidget(
                      index: 1,
                      maxIndex: 4,
                      image: Image.asset(
                        AppImages.onboarding2,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      title: 'We value\nyour feedback',
                      subtitle: 'That\'s what helps us improve our work',
                      onTapButton: () async {
                        await InAppReview.instance.requestReview();
                        setState(() => page = 2);
                      })
                  : page == 2
                      ? OnboardingWidget(
                          index: 2,
                          maxIndex: 4,
                          image: Image.asset(
                            AppImages.onboarding3,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          title: 'Editing\ndocuments',
                          subtitle:
                              'Change filters, add text and captions and more',
                          onTapButton: () {
                            getItService.navigatorService.onMain();
                            return;
                            //TODO: HIDE PREMIUM
                            //setState(() => page = 3);
                          },
                        )
                      : OnboardingWidget(
                          index: 3,
                          maxIndex: 4,
                          image: Image.asset(
                            AppImages.onboarding4,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          title: 'Unlimited access',
                          subtitle: 'Try 3 days free, Then \$4.99/week',
                          subtitleTapper: 'Or proceed with limited version',
                          buttonText: 'Try free & subscribe',
                          tapperOnTap: () {
                            Gaimon.selection();
                            getItService.navigatorService.onMain();
                          },
                          onTapButton:
                              getItService.navigatorService.onGetPremium,
                        ),
        ),
      ),
    );
  }
}
