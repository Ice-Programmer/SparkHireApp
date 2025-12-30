import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:spark_hire_app/components/custom_button.dart';
import 'package:spark_hire_app/components/custom_input.dart';
import 'package:spark_hire_app/components/keyboard_wrapper.dart';
import 'package:spark_hire_app/http/business_exception.dart';
import 'package:spark_hire_app/model/biz/send_verify_code.dart';
import 'package:spark_hire_app/service/biz_service.dart';
import 'package:spark_hire_app/utils/toast_util.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isSending = false;
  final BizService _bizService = BizService();
  String _email = '';

  void _sendVerificationCode() async {
    setState(() {
      _isSending = true;
    });
    try {
      final _ = await _bizService.sendVerifyCode(
        SendVerifyCodeRequest(email: _email),
      );

      if (!mounted) return;

      context.push('/register/verification?email=$_email');
    } on BusinessException catch (e) {
      ToastUtils.showErrorMsg(e.message);
    } on Exception catch (e) {
      ToastUtils.showErrorMsg('网络异常，请稍后重试');
    } finally {
      setState(() {
        _isSending = false;
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
                  context.go('/login/mail');
                },
                child: Icon(Icons.arrow_back, size: 26.sp),
              ),

              18.verticalSpace,

              Text(
                AppLocalizations.of(context)!.registerYourAccount,
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

              Text(
                AppLocalizations.of(context)!.emailText,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),

              10.verticalSpace,

              CustomInput(
                height: 60.h,
                backgroundColor: Theme.of(context).colorScheme.inverseSurface,
                hintText: AppLocalizations.of(context)!.mailPlaceholder,
                inputType: TextInputType.emailAddress,
                onChanged: (value) {
                  setState(() {
                    _email = value.trim();
                  });
                },
              ),

              30.verticalSpace,

              CustomButton(
                onPressed: _sendVerificationCode,
                title: AppLocalizations.of(context)!.nextStep,
                textColor: Theme.of(context).colorScheme.onPrimary,
                btnWidth: double.infinity,
                btnHeight: 55.w,
                fontSize: 18.sp,
                borderRadius: 12.w,
                backgroundColor: Theme.of(context).colorScheme.primary,
                isShadow: false,
                disableSplash: true,
                disable: _email.isEmpty || _isSending,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
