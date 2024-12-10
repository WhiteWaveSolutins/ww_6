import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:scan_doc/data/services/shared_preferences_service.dart';
import 'package:scan_doc/ui/resurses/icons.dart';
import 'package:scan_doc/ui/resurses/images.dart';
import 'package:scan_doc/ui/resurses/text.dart';
import 'package:scan_doc/ui/screens/password/info_password_screen.dart';
import 'package:scan_doc/ui/screens/password/widgets/pin_code.dart';
import 'package:scan_doc/ui/widgets/image_back.dart';
import 'package:scan_doc/ui/widgets/svg_icon.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_darwin/local_auth_darwin.dart';

class PasswordScreen extends StatefulWidget {
  final Function() onOpen;
  final String? password;
  final String? title;

  const PasswordScreen({
    super.key,
    required this.onOpen,
    this.password,
    this.title,
  });

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  bool faceIdHave = false;

  @override
  void initState() {
    super.initState();
    if (widget.title != null) load();
  }

  void load() async {
    final auth = LocalAuthentication();
    final availableBiometrics = await auth.getAvailableBiometrics();
    if (availableBiometrics.contains(BiometricType.face)) {
      final status = await SharedPreferencesService.getFaceId();
      faceIdHave = status;
      if (mounted) setState(() {});
      authorization();
    }
  }

  void authorization() async {
    final auth = LocalAuthentication();
    try {
      final bool didAuthenticate = await auth.authenticate(
        localizedReason: 'Please authenticate',
        authMessages: const <AuthMessages>[
          AndroidAuthMessages(
            signInTitle: 'Oops! Biometric authentication required!',
            cancelButton: 'No thanks',
          ),
          IOSAuthMessages(
            cancelButton: 'No thanks',
          ),
        ],
      );
      if (didAuthenticate) widget.onOpen();
    } catch (_) {}
  }

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
              children: [
                const TitlePassword(),
                const SizedBox(height: 130),
                Text(
                  widget.title ??
                      (widget.password == null ? 'Keep the passcode' : 'Repeat the passcode'),
                  style: AppText.text16,
                ),
                const SizedBox(height: 40),
                PinCode(
                  onSubmit: widget.onOpen,
                  password: widget.password,
                ),
                if (widget.title != null && faceIdHave) ...[
                  const SizedBox(height: 40),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: authorization,
                    child: const SvgIcon(
                      icon: AppIcons.faceId,
                      size: 40,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
