import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class CustomPinput extends StatefulWidget {
  final double width;
  final double height;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onCompleted;

  const CustomPinput({
    super.key,
    this.width = 48,
    this.height = 48,
    this.validator,
    this.onCompleted,
  });

  @override
  State<CustomPinput> createState() => _CustomPinputState();
}

class _CustomPinputState extends State<CustomPinput> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: widget.width,
      height: widget.height,
      textStyle: TextStyle(
        fontSize: 20,
        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.fromBorderSide(
          BorderSide(
            color: Theme.of(context).dividerColor.withValues(alpha: 0.5),
            width: 1,
          ),
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.fromBorderSide(
        BorderSide(color: Theme.of(context).colorScheme.primary, width: 2),
      ),
    );

    final errorPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.fromBorderSide(
        BorderSide(color: Theme.of(context).colorScheme.onError, width: 2),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        border: Border.fromBorderSide(
          const BorderSide(color: Color.fromRGBO(220, 220, 220, 1), width: 1),
        ),
      ),
    );

    return SizedBox(
      width: double.infinity,
      child: Pinput(
        length: 6,
        controller: pinController,
        focusNode: focusNode,
        obscureText: false,
        keyboardType: TextInputType.number,
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: focusedPinTheme,
        errorPinTheme: errorPinTheme,
        submittedPinTheme: submittedPinTheme,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
        showCursor: false,
        onCompleted: (pin) {
          widget.onCompleted!(pin);
        },
        validator: widget.validator,
        errorBuilder: (context, errorText) => const SizedBox.shrink(),
      ),
    );
  }
}
