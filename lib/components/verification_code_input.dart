import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class VerificationCodeInput extends StatefulWidget {
  final double height;
  final double borderRadius;
  final String? hintText;
  final double horizontalPadding;
  final double fontSize;
  final Color? backgroundColor;
  final Color? borderColor;
  final ValueChanged<String>? onChanged;
  final bool disable;

  final Future<bool> Function()? onSendCode;
  final String sendButtonText;
  final int countdownSeconds;
  final Color buttonColor;
  final Color disableColor;

  const VerificationCodeInput({
    super.key,
    required this.height,
    this.borderRadius = 12,
    this.hintText = "请输入验证码",
    this.horizontalPadding = 16,
    this.fontSize = 16,
    this.backgroundColor,
    this.borderColor,
    this.onChanged,
    this.onSendCode,
    this.sendButtonText = "获取验证码",
    this.countdownSeconds = 60,
    this.buttonColor = const Color(0xFF3D30A2),
    this.disableColor = Colors.grey,
    this.disable = false,
  });

  @override
  State<VerificationCodeInput> createState() => _VerificationCodeInputState();
}

class _VerificationCodeInputState extends State<VerificationCodeInput> {
  Timer? _timer;
  int _currentSeconds = 0;
  bool _isCounting = false;
  bool _isSending = false;

  @override
  void initState() {
    super.initState();
    _currentSeconds = widget.countdownSeconds;
  }

  @override
  void dispose() {
    _cancelTimer();
    super.dispose();
  }

  void _startTimer() {
    _cancelTimer();
    setState(() {
      _isCounting = true;
      _currentSeconds = widget.countdownSeconds;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_currentSeconds < 1) {
        _cancelTimer();
        if (mounted) {
          setState(() {
            _isCounting = false;
            _currentSeconds = widget.countdownSeconds;
          });
        }
      } else {
        if (mounted) {
          setState(() {
            _currentSeconds--;
          });
        }
      }
    });
  }

  void _cancelTimer() {
    _timer?.cancel();
    _timer = null;
  }

  Future<void> _handleSendTap() async {
    if (_isCounting || _isSending || widget.onSendCode == null) return;

    setState(() {
      _isSending = true;
    });

    try {
      bool success = await widget.onSendCode!();

      if (mounted) {
        setState(() {
          _isSending = false;
        });
        if (success) {
          _startTimer();
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isSending = false;
        });
      }
    }
  }

  Widget _buildSendCodeButton() {
    bool isDisabled = _isCounting || _isSending;
    Widget buttonChild;

    if (_isSending) {
      final indicatorSize = widget.fontSize * 1.1;
      buttonChild = SizedBox(
        width: indicatorSize,
        height: indicatorSize,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(widget.disableColor),
        ),
      );
    } else {
      String text;
      Color textColor;

      if (_isCounting) {
        text =
            "${_currentSeconds}s ${AppLocalizations.of(context)!.verificationWaitText}";
        textColor = widget.disableColor;
      } else {
        text = widget.sendButtonText;
        textColor = widget.buttonColor;
      }

      buttonChild = Text(
        text,
        style: TextStyle(
          fontSize: widget.fontSize * 0.9,
          fontWeight: FontWeight.bold,
          color: widget.disable ? textColor.withValues(alpha: 0.4) : textColor,
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.only(right: widget.horizontalPadding / 2),
      child: TextButton(
        onPressed: isDisabled || widget.disable ? null : _handleSendTap,
        style: TextButton.styleFrom(
          minimumSize: Size.zero,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          splashFactory: NoSplash.splashFactory,
        ),
        child: buttonChild,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: widget.height,
      decoration: BoxDecoration(
        color:
            widget.backgroundColor ?? Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      child: TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.number,
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(
          fontSize: widget.fontSize,
          color: Colors.black,
          height: 1.0,
        ),
        decoration: InputDecoration(
          isDense: true,
          isCollapsed: true,
          contentPadding: EdgeInsets.only(
            left: widget.horizontalPadding,
            right: 0,
            top: (widget.height - widget.fontSize) / 2,
            bottom: (widget.height - widget.fontSize) / 2,
          ),
          border: InputBorder.none,
          hintText: widget.hintText,
          hintStyle: TextStyle(fontSize: widget.fontSize, color: Colors.grey),
          errorStyle: const TextStyle(height: 0, fontSize: 0),
          suffixIcon: _buildSendCodeButton(),
          suffixIconConstraints: const BoxConstraints(
            minWidth: 0,
            minHeight: 0,
          ),
        ),
        onChanged: (value) {
          widget.onChanged?.call(value);
        },
      ),
    );
  }
}
