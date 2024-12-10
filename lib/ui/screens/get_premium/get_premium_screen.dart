import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gaimon/gaimon.dart';
import 'package:scan_doc/ui/resurses/colors.dart';
import 'package:scan_doc/ui/resurses/icons.dart';
import 'package:scan_doc/ui/resurses/images.dart';
import 'package:scan_doc/ui/resurses/text.dart';
import 'package:scan_doc/ui/screens/onboarding/widgets/onboarding_widget.dart';
import 'package:scan_doc/ui/widgets/buttons/close_button.dart';
import 'package:scan_doc/ui/widgets/image_back.dart';
import 'package:scan_doc/ui/widgets/svg_icon.dart';

class Paywall {
  final String name;
  final double summa;
  final String icon;

  Paywall({
    required this.name,
    required this.summa,
    required this.icon,
  });
}

class GetPremiumScreen extends StatefulWidget {
  const GetPremiumScreen({super.key});

  @override
  State<GetPremiumScreen> createState() => _GetPremiumScreenState();
}

class _GetPremiumScreenState extends State<GetPremiumScreen> {
  late Paywall selectedPaywall;

  final items = [
    'No adds',
    'Pass protected folders',
    'All editing options',
    'Custom folders',
  ];

  final paywalls = [
    Paywall(name: 'Weekly', summa: 4.99, icon: AppImages.crow),
    Paywall(name: 'Monthly', summa: 19.99, icon: AppImages.fire),
    Paywall(name: 'Yearly', summa: 190.99, icon: AppImages.mo),
  ];

  @override
  void initState() {
    super.initState();
    selectedPaywall = paywalls.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ImageBack(
        image: AppImages.backPro,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const AppCloseButton(),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'SCANNING',
                  style: AppText.prompt.copyWith(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primaryGrad1,
                        AppColors.primaryGrad2,
                      ],
                    ),
                  ),
                  child: Text(
                    'PRO',
                    style: AppText.prompt.copyWith(
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                'Unlock new Features!',
                style: AppText.prompt.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white.withOpacity(.3),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (var item in items) _Item(title: item),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  const SizedBox(width: 16),
                  for (var paywall in paywalls) ...[
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: selectedPaywall == paywall
                                  ? AppColors.primaryGrad1
                                  : Colors.transparent,
                              width: 4,
                            ),
                          ),
                          child: _Block(
                            paywall: paywall,
                            onTap: () => setState(() => selectedPaywall = paywall),
                          ),
                        ),
                        if (selectedPaywall == paywall)
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: const LinearGradient(
                                colors: [
                                  AppColors.primaryGrad1,
                                  AppColors.primaryGrad2,
                                ],
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 37,
                            ),
                            child: Text(
                              '3 Days Free',
                              style: AppText.text2bold,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(width: 8),
                  ],
                  const SizedBox(width: 8),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: BottomOnboarding(
                buttonText: 'Subscripe',
                onTapButton: () {},
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class _Block extends StatelessWidget {
  final Paywall paywall;
  final Function() onTap;

  const _Block({
    super.key,
    required this.paywall,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        Gaimon.selection();
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.black.withOpacity(.1),
        ),
        width: 200,
        child: Column(
          children: [
            const SizedBox(height: 30),
            Image.asset(
              paywall.icon,
              height: 50,
            ),
            const SizedBox(height: 20),
            Text(
              '${paywall.summa}\$',
              style: AppText.prompt.copyWith(
                fontSize: 40,
              ),
            ),
            Text(
              paywall.name,
              style: AppText.prompt.copyWith(
                fontSize: 18,
                color: Colors.white.withOpacity(0.3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final String title;

  const _Item({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 4,
        bottom: 4,
        right: 14,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.white.withOpacity(.1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SvgIcon(
            icon: AppIcons.pro,
            size: 30,
          ),
          const SizedBox(width: 4),
          Text(
            title,
            style: AppText.text16,
          ),
        ],
      ),
    );
  }
}
