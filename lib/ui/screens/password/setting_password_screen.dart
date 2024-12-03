import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:scan_doc/data/services/shared_preferences_service.dart';
import 'package:scan_doc/domain/di/get_it_services.dart';
import 'package:scan_doc/ui/resurses/colors.dart';
import 'package:scan_doc/ui/resurses/images.dart';
import 'package:scan_doc/ui/resurses/text.dart';
import 'package:scan_doc/ui/screens/password/info_password_screen.dart';
import 'package:scan_doc/ui/widgets/image_back.dart';

class SettingPasswordScreen extends StatelessWidget {
  const SettingPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ImageBack(
      image: AppImages.mainBack,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitlePassword(),
                const SizedBox(height: 24),
                GestureDetector(
                  onTap: () {
                    SharedPreferencesService.removePassword();
                    getItService.navigatorService.onFirst();
                  },
                  child: Text(
                    'Disable passcode',
                    style: AppText.text16.copyWith(
                      color: AppColors.red,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Divider(height: 0, color: Colors.white),
                const SizedBox(height: 24),
                GestureDetector(
                  onTap: () async {
                    await SharedPreferencesService.removePassword();
                    getItService.navigatorService.onFirst();
                    getItService.navigatorService.onInfoPassword(
                      onOpen: getItService.navigatorService.onSettingPassword,
                    );
                  },
                  child: Text(
                    'Change passcode',
                    style: AppText.text16,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Once the password is set, there will be a lock when you open this folder.',
                  style: AppText.text2bold.copyWith(
                    color: Colors.white.withOpacity(.3),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Important: if you forget the passcode, you will have to reinstall the application, all content will be lost.',
                  style: AppText.text2bold.copyWith(
                    color: Colors.white.withOpacity(.3),
                  ),
                ),
                const SizedBox(height: 24),
                const Divider(height: 0, color: Colors.white),
                const SizedBox(height: 24),
                const _FaceId(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FaceId extends StatefulWidget {
  const _FaceId({super.key});

  @override
  State<_FaceId> createState() => _FaceIdState();
}

class _FaceIdState extends State<_FaceId> {
  bool show = false;
  bool useFaceId = false;

  @override
  void initState() {
    super.initState();
    load();
  }

  void load() async {
    final auth = LocalAuthentication();
    final availableBiometrics = await auth.getAvailableBiometrics();
    if (availableBiometrics.contains(BiometricType.face)) {
      final status = await SharedPreferencesService.getFaceId();
      useFaceId = status;
      show = true;
      if (mounted) setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!show) return const SizedBox();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Unlock by Face ID',
          style: AppText.text16,
        ),
        CupertinoSwitch(
          activeColor: AppColors.primaryGrad1,
          trackColor: AppColors.white.withOpacity(0.2),
          onChanged: (_) {
            setState(() => useFaceId = !useFaceId);
            SharedPreferencesService.switchFaceId(status: useFaceId);
          },
          value: useFaceId,
        ),
      ],
    );
  }
}
