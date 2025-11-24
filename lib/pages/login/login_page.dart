import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:spark_hire_app/common/assets.dart';
import 'package:spark_hire_app/components/custom_button.dart';
import 'package:spark_hire_app/pages/login/components/other_login_button.dart';
import 'package:spark_hire_app/pages/login/components/register_line.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(
          top: 200.h,
          bottom: 60.h,
          left: 28.w,
          right: 28.w,
        ),

        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildWelcomeWidget(context),
              _buildLoginButtonList(context),
              const RegisterLine(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeWidget(BuildContext context) {
    return Column(
      children: [
        Text(
          AppLocalizations.of(context)!.appName,
          style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.bold),
        ),
        4.verticalSpace,
        Text(
          AppLocalizations.of(context)!.loginWelcomeText,
          style: TextStyle(
            fontSize: 14.sp,
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.5),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButtonList(BuildContext context) {
    return Column(
      children: [
        OtherLoginButton(
          context: context,
          text: AppLocalizations.of(context)!.mailLoginText,
          iconText: Assets.assetsImageLoginMail,
        ),

        20.verticalSpace,

        OtherLoginButton(
          context: context,
          text: AppLocalizations.of(context)!.googleLoginText,
          iconText: Assets.assetsImageLoginGoogle,
        ),

        20.verticalSpace,

        OtherLoginButton(
          context: context,
          text: AppLocalizations.of(context)!.wechatLoginText,
          iconText: Assets.assetsImageLoginWechat,
        ),

        20.verticalSpace,

        OtherLoginButton(
          context: context,
          text: AppLocalizations.of(context)!.appleLoginText,
          iconText: Assets.assetsImageLoginApple,
        ),

        28.verticalSpace,

        CustomButton(
          onPressed: () => {context.go("/login/password")},
          title: AppLocalizations.of(context)!.loginText,
          textColor: Theme.of(context).colorScheme.onPrimary,
          btnWidth: double.infinity,
          btnHeight: 60.w,
          fontSize: 18.sp,
          borderRadius: 12.w,
          backgroundColor: Theme.of(context).colorScheme.primary,
          isShadow: false,
          disableSplash: true,
        ),

        80.verticalSpace,
      ],
    );
  }
}
