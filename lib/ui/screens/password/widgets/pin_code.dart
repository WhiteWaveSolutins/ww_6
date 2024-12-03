import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:scan_doc/data/services/shared_preferences_service.dart';
import 'package:scan_doc/domain/di/get_it_services.dart';
import 'package:scan_doc/ui/resurses/colors.dart';

class PinCode extends StatefulWidget {
  final Function(String)? onChange;
  final void Function() onSubmit;
  final String? password;

  const PinCode({
    super.key,
    this.onChange,
    required this.onSubmit,
    this.password,
  });

  @override
  State<PinCode> createState() => _PinCodeState();
}

class _PinCodeState extends State<PinCode> {
  final focusNode = FocusNode();
  bool isError = false;
  final controller = TextEditingController();

  PinTheme theme({
    bool fill = false,
    Color color = Colors.white,
  }) {
    return PinTheme(
      width: 20,
      height: 20,
      textStyle: const TextStyle(color: Colors.transparent),
      decoration: BoxDecoration(
        color: fill ? color : Colors.transparent,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: color,
        ),
      ),
    );
  }

  @override
  void dispose() {
    focusNode.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Pinput(
      autofocus: true,
      length: 6,
      forceErrorState: isError,
      controller: controller,
      focusNode: focusNode,
      showCursor: false,
      separatorBuilder: (index) => const SizedBox(width: 20),
      defaultPinTheme: theme(fill: true),
      followingPinTheme: theme(),
      focusedPinTheme: theme(),
      errorPinTheme: theme(
        color: AppColors.red,
        fill: true,
      ),
      onChanged: (v) {
        if (isError) setState(() => isError = false);
      },
      onCompleted: (value) async {
        if (widget.password != null) {
          if (widget.password == value) {
            SharedPreferencesService.setPassword(password: value);
            widget.onSubmit();
            return;
          }
        } else {
          final password = await SharedPreferencesService.getPassword();
          if (password == null) {
            getItService.navigatorService.onPassword(
              onOpen: widget.onSubmit,
              password: value,
            );
            return;
          } else if (password == value) {
            widget.onSubmit();
            return;
          }
        }
        controller.clear();
        setState(() => isError = true);
      },
    );
  }
}
