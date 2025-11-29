import 'package:go_router/go_router.dart';
import 'package:spark_hire_app/pages/login/login_page.dart';
import 'package:spark_hire_app/pages/login/mail_login_page.dart';
import 'package:spark_hire_app/pages/register/register_page.dart';
import 'package:spark_hire_app/pages/register/register_verification_page.dart';
import 'package:spark_hire_app/pages/welcome/guidance_page.dart';
import 'package:spark_hire_app/pages/welcome/welcome_page.dart';
import 'package:spark_hire_app/utils/toast_util.dart';

final GoRouter router = GoRouter(
  navigatorKey: ToastUtils.rootNavigatorKey,
  routes: [
    GoRoute(
      path: '/', // 根路径
      name: '欢迎页',
      pageBuilder:
          (context, state) => const NoTransitionPage(child: WelcomePage()),
    ),
    GoRoute(
      path: '/guidance',
      name: '引导页',
      pageBuilder:
          (context, state) => const NoTransitionPage(child: GuidancePage()),
    ),
    GoRoute(
      path: '/login',
      name: "登录页面",
      pageBuilder:
          (context, state) => const NoTransitionPage(child: LoginPage()),
    ),
    GoRoute(
      path: '/login/mail',
      name: "邮箱登录页面",
      pageBuilder: (context, state) => NoTransitionPage(child: MailLoginPage()),
    ),
    GoRoute(
      path: '/register',
      name: "用户注册",
      builder: (context, state) => RegisterPage(),
    ),
    GoRoute(
      path: '/register/verification',
      name: "用户注册验证码页面",
      builder: (context, state) {
        final email = state.uri.queryParameters['email'];
        return RegisterVerificationPage(email: email ?? "");
      },
    ),
  ],
);
