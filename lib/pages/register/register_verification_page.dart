import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:spark_hire_app/components/custom_button.dart';
import 'package:spark_hire_app/components/custom_pinput.dart';
import 'package:spark_hire_app/components/keyboard_wrapper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:spark_hire_app/http/business_exception.dart';
import 'package:spark_hire_app/model/biz/send_verify_code.dart';
import 'package:spark_hire_app/model/user/register_user.dart';
import 'package:spark_hire_app/service/biz_service.dart';
import 'package:spark_hire_app/service/user_service.dart';
import 'package:spark_hire_app/utils/toast_util.dart';

class RegisterVerificationPage extends StatefulWidget {
  final String email;
  const RegisterVerificationPage({super.key, required this.email});

  @override
  State<RegisterVerificationPage> createState() =>
      _RegisterVerificationPageState();
}

class _RegisterVerificationPageState extends State<RegisterVerificationPage> {
  final BizService _bizService = BizService();
  final UserService _userService = UserService();

  bool _isSending = false;
  String _email = "";
  String _verifyCode = "";

  bool _isRegister = false;
  int _countdown = 60;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    _timer?.cancel();
    setState(() {
      _countdown = 60;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown == 0) {
        timer.cancel();
      } else {
        setState(() {
          _countdown--;
        });
      }
    });
  }

  void _resendCode() async {
    setState(() {
      _isSending = true;
    });
    try {
      final _ = await _bizService.sendVerifyCode(
        SendVerifyCodeRequest(email: _email),
      );
      if (!mounted) return;
    } on BusinessException catch (e) {
      ToastUtils.showErrorMsg(e.message);
    } on Exception {
      ToastUtils.showErrorMsg('网络异常，请稍后重试');
    } finally {
      setState(() {
        _isSending = false;
      });
    }
    _startCountdown();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _registerUser() async {
    setState(() {
      _isRegister = true;
    });

    try {
      // final result = await apiProvider.api
      //     .getUserControllerApi()
      //     .userRegisterByMail(
      //       userMailRegisterRequest: _registerRequestBuilder.build(),
      //     );
      final result = await _userService.registerUser(
        RegisterUserRequest(email: _email, verifyCode: _verifyCode),
      );
      if (!mounted) return;
      if (result.success) {
        ToastUtils.showInfoMsg(
          AppLocalizations.of(context)!.registerSuccessMsg,
        );
        context.go('/');
      }
    } on BusinessException catch (e) {
      ToastUtils.showErrorMsg(e.message);
    } on Exception {
      ToastUtils.showErrorMsg('网络异常，请稍后重试');
    } finally {
      setState(() {
        _isRegister = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissWrapper(
      child: Scaffold(
        body: SafeArea(
          minimum: EdgeInsets.symmetric(vertical: 0.h, horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: Icon(Icons.arrow_back, size: 26.sp),
              ),

              18.verticalSpace,

              Text(
                AppLocalizations.of(context)!.verificationLoginPlaceholder,
                style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.bold),
              ),

              15.verticalSpace,

              Text(
                AppLocalizations.of(context)!.registerWelcomeText,
                style: TextStyle(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.55),
                ),
              ),

              30.verticalSpace,

              CustomPinput(
                width: 60.w,
                height: 60.w,
                onCompleted: (value) {
                  setState(() {
                    _email = widget.email;
                    _verifyCode = value;
                  });
                },
              ),

              20.verticalSpace,

              _buildFetchVerification(),

              20.verticalSpace,

              CustomButton(
                onPressed: _registerUser,
                title: AppLocalizations.of(context)!.registerName,
                textColor: Theme.of(context).colorScheme.onPrimary,
                btnWidth: double.infinity,
                btnHeight: 55.w,
                fontSize: 18.sp,
                borderRadius: 12.w,
                backgroundColor: Theme.of(context).colorScheme.primary,
                isShadow: false,
                disableSplash: true,
                disable: _email.length != 6 || _isRegister,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFetchVerification() {
    return Center(
      child:
          _countdown > 0
              ? Text(
                '$_countdown ${AppLocalizations.of(context)!.verificationAgainText}',
                style: TextStyle(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.55),
                ),
              )
              : GestureDetector(
                onTap: _isSending ? null : _resendCode,
                child:
                    _isSending
                        ? SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                        : Text(
                          AppLocalizations.of(context)!.fetchVerificationCode,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
              ),
    );
  }
}
