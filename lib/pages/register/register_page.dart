import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:spark_hire_app/components/custom_button.dart';
import 'package:spark_hire_app/components/custom_input.dart';
import 'package:spark_hire_app/components/keyboard_wrapper.dart';
import 'package:spark_hire_app/http/http_constant.dart';
import 'package:spark_hire_app/providers/api_provider.dart';
import 'package:spark_hire_app/utils/toast_util.dart';
import 'package:sparkhire_api/sparkhire_api.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isSending = false;
  final VerifyCodeRequestBuilder _verifyCodeRequestBuilder =
      VerifyCodeRequestBuilder();

  void _sendVerificationCode() async {
    setState(() {
      _isSending = true;
    });
    VerifyCodeRequest verifyCodeRequest = _verifyCodeRequestBuilder.build();
    final apiProvider = Provider.of<ApiProvider>(context, listen: false);
    try {
      final result = await apiProvider.api.getBizControllerApi().sendVerifyCode(
        verifyCodeRequest: verifyCodeRequest,
      );
      if (!mounted) return;
      if (result.data?.code == HttpConstant.successCode) {
        context.push(
          '/register/verification?email=${_verifyCodeRequestBuilder.email}',
        );
      } else {
        ToastUtils.showErrorMsg(
          result.data?.message ?? AppLocalizations.of(context)!.unknownMessage,
        );
      }
    } catch (e) {
      ToastUtils.showErrorMsg(e.toString());
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
                    _verifyCodeRequestBuilder.email = value;
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
                disable:
                    _verifyCodeRequestBuilder.email?.isEmpty == true ||
                    _isSending,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
