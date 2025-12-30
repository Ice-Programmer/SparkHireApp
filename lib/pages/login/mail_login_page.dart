import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:spark_hire_app/common/assets.dart';
import 'package:spark_hire_app/components/custom_button.dart';
import 'package:spark_hire_app/components/custom_divider.dart';
import 'package:spark_hire_app/components/custom_input.dart';
import 'package:spark_hire_app/components/keyboard_wrapper.dart';
import 'package:spark_hire_app/components/verification_code_input.dart';
import 'package:spark_hire_app/http/business_exception.dart';
import 'package:spark_hire_app/model/biz/send_verify_code.dart';
import 'package:spark_hire_app/model/user/user_mail_login.dart';
import 'package:spark_hire_app/pages/login/components/register_line.dart';
import 'package:spark_hire_app/service/biz_service.dart';
import 'package:spark_hire_app/service/user_service.dart';
import 'package:spark_hire_app/utils/log_util.dart';
import 'package:spark_hire_app/utils/store_util.dart';
import 'package:spark_hire_app/utils/toast_util.dart';

class MailLoginPage extends StatefulWidget {
  const MailLoginPage({super.key});

  @override
  State<MailLoginPage> createState() => _MailLoginPageState();
}

class _MailLoginPageState extends State<MailLoginPage> {
  final UserService _userService = UserService();
  final BizService _bizService = BizService();

  String _email = "";
  String _verifyCode = "";

  void _onLogin() async {
    try {
      final result = await _userService.userMailLogin(
        UserMailLoginRequest(email: _email, verifyCode: _verifyCode),
      );
      if (!mounted) return;

      final accessToken = result.accessToken;
      StoreUtil.saveToken(accessToken);
      context.go('/home');
    } on BusinessException catch (e) {
      ToastUtils.showErrorMsg(e.message);
    } on Exception {
      ToastUtils.showErrorMsg('网络异常，请稍后重试');
    }
  }

  Future<bool> _sendVerificationCode() async {
    try {
      final result = await _bizService.sendVerifyCode(
        SendVerifyCodeRequest(email: _email),
      );
      if (!mounted) return false;
      LogUtils.logger(result.toString());

      return true;
    } on BusinessException catch (e) {
      ToastUtils.showErrorMsg(e.message);
    } on Exception {
      ToastUtils.showErrorMsg('网络异常，请稍后重试');
    } 
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissWrapper(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: 28.w, vertical: 80.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildPasswordWelcomeLine(context),
              _buildLoginForm(context),
              10.verticalSpace,
              const RegisterLine(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordWelcomeLine(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${AppLocalizations.of(context)!.loginWelcomeLine} 👋",
          style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w700),
        ),
        10.verticalSpace,
        Text(
          AppLocalizations.of(context)!.loginWelcomeSubline,
          style: TextStyle(
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.5),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.emailText,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
        ),

        8.verticalSpace,

        CustomInput(
          height: 60.h,
          backgroundColor: Theme.of(context).colorScheme.inverseSurface,
          hintText: AppLocalizations.of(context)!.mailPlaceholder,
          inputType: TextInputType.emailAddress,
          onChanged: (value) {
            setState(() {
              _email = value;
            });
          },
        ),

        22.verticalSpace,

        Text(
          AppLocalizations.of(context)!.verificationCodeText,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
        ),

        8.verticalSpace,

        VerificationCodeInput(
          height: 60.h,
          buttonColor: Theme.of(context).colorScheme.primary,
          backgroundColor: Theme.of(context).colorScheme.inverseSurface,
          borderColor: Colors.grey.shade300,
          hintText: AppLocalizations.of(context)!.verificationLoginPlaceholder,
          sendButtonText: AppLocalizations.of(context)!.fetchVerificationCode,
          onSendCode: _sendVerificationCode,
          disable: _email.isEmpty,
          onChanged: (value) {
            setState(() {
              _verifyCode = value;
            });
          },
        ),

        40.verticalSpace,

        CustomButton(
          onPressed: _onLogin,
          title: AppLocalizations.of(context)!.login,
          textColor: Theme.of(context).colorScheme.onPrimary,
          btnWidth: double.infinity,
          btnHeight: 50.w,
          fontSize: 18.sp,
          borderRadius: 12.w,
          backgroundColor: Theme.of(context).colorScheme.primary,
          isShadow: false,
          disableSplash: true,
          disable: _email.isEmpty || _verifyCode.isEmpty,
        ),

        ..._buildOtherLoginButtonList(context),
      ],
    );
  }

  List<Widget> _buildOtherLoginButtonList(BuildContext context) {
    return [
      24.verticalSpace,

      CustomDivider(text: AppLocalizations.of(context)!.otherLoginText),

      24.verticalSpace,

      _buildOtherLoginButton(
        context: context,
        text: AppLocalizations.of(context)!.phoneLoginText,
        iconText: Assets.assetsImageLoginPhone,
        onPressed: () => context.go('/login/password'),
      ),

      20.verticalSpace,

      _buildOtherLoginButton(
        context: context,
        text: AppLocalizations.of(context)!.wechatLoginText,
        iconText: Assets.assetsImageLoginWechat,
        onPressed: () {},
      ),
    ];
  }

  Widget _buildOtherLoginButton({
    required BuildContext context,
    required String text,
    required String iconText,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 50.w,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.2),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 24.w,
              height: 24.w,
              child: SvgPicture.asset(iconText, fit: BoxFit.contain),
            ),

            20.horizontalSpace,

            Text(
              text,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
