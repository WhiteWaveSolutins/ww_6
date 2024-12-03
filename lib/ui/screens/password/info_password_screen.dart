import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scan_doc/data/services/shared_preferences_service.dart';
import 'package:scan_doc/domain/di/get_it_services.dart';
import 'package:scan_doc/ui/resurses/images.dart';
import 'package:scan_doc/ui/resurses/text.dart';
import 'package:scan_doc/ui/widgets/buttons/close_button.dart';
import 'package:scan_doc/ui/widgets/buttons/simple_button.dart';
import 'package:scan_doc/ui/widgets/image_back.dart';

class InfoPasswordScreen extends StatefulWidget {
  final Function() onOpen;

  const InfoPasswordScreen({
    super.key,
    required this.onOpen,
  });

  @override
  State<InfoPasswordScreen> createState() => _InfoPasswordScreenState();
}

class _InfoPasswordScreenState extends State<InfoPasswordScreen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getPassword();
  }

  void getPassword() async {
    final password = await SharedPreferencesService.getPassword();
    if (password != null) {
      getItService.navigatorService.onPassword(
        onOpen: widget.onOpen,
        title: 'Enter the passcode',
      );
    }
    if (mounted) setState(() => isLoading = false);
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
                const SizedBox(height: 32),
                if (isLoading)
                  const Center(
                    child: CupertinoActivityIndicator(color: Colors.white),
                  )
                else ...[
                  Text(
                    'Once the password is set, there will be a lock when you open this folder.',
                    style: AppText.text2bold.copyWith(
                      color: Colors.white.withOpacity(.3),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Important: if you forget the passcode, you will have to reinstall the application, all content will be lost.',
                    style: AppText.text2bold.copyWith(
                      color: Colors.white.withOpacity(.3),
                    ),
                  ),
                  const Spacer(),
                  SimpleButton(
                    title: 'Enable passcode',
                    onPressed: () => getItService.navigatorService.onPassword(
                      onOpen: widget.onOpen,
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

class TitlePassword extends StatelessWidget {
  const TitlePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const Row(
          children: [
            AppCloseButton(
              padding: 22,
              margin: false,
            ),
          ],
        ),
        Text(
          'Password code',
          style: AppText.text16,
        ),
      ],
    );
  }
}
