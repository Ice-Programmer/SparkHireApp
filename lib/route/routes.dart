import 'package:go_router/go_router.dart';
import 'package:spark_hire_app/pages/login/login_page.dart';
import 'package:spark_hire_app/pages/login/mail_login_page.dart';
import 'package:spark_hire_app/pages/login/password_login_page.dart';
import 'package:spark_hire_app/pages/welcome/guidance_page.dart';
import 'package:spark_hire_app/utils/toast_util.dart';

final GoRouter router = GoRouter(
  navigatorKey: ToastUtils.rootNavigatorKey,
  routes: [
    GoRoute(
      path: '/', // 根路径
      name: '欢迎页',
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
      path: '/login/password',
      name: "密码登录页面",
      pageBuilder:
          (context, state) =>
              const NoTransitionPage(child: PasswordLoginPage()),
    ),
    GoRoute(
      path: '/login/mail',
      name: "邮箱登录页面",
      pageBuilder:
          (context, state) => const NoTransitionPage(child: MailLoginPage()),
    ),
  ],
);
