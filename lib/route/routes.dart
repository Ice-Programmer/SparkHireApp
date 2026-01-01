import 'package:go_router/go_router.dart';
import 'package:spark_hire_app/layouts/home_layout.dart';
import 'package:spark_hire_app/model/candidate/get_current_candidate.dart';
import 'package:spark_hire_app/pages/favorite/favorite_page.dart';
import 'package:spark_hire_app/pages/job/job_page.dart';
import 'package:spark_hire_app/pages/login/login_page.dart';
import 'package:spark_hire_app/pages/login/mail_login_page.dart';
import 'package:spark_hire_app/pages/personal/basic_info/candidate_info_edit_page.dart';
import 'package:spark_hire_app/pages/personal/candidate_info_vm.dart';
import 'package:spark_hire_app/pages/personal/candidate_page.dart';
import 'package:spark_hire_app/pages/personal/contract_info/contract_edit_page.dart';
import 'package:spark_hire_app/pages/personal/summary_info/summary_edit_page.dart';
import 'package:spark_hire_app/pages/register/profile/select_role_page.dart';
import 'package:spark_hire_app/pages/register/register_page.dart';
import 'package:spark_hire_app/pages/register/register_verification_page.dart';
import 'package:spark_hire_app/pages/schedule/schedule_page.dart';
import 'package:spark_hire_app/pages/search/search_page.dart';
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
    GoRoute(
      path: '/user/role/switch',
      name: '身份选择',
      pageBuilder:
          (context, state) => const NoTransitionPage(child: SelectRolePage()),
    ),
    ShellRoute(
      pageBuilder:
          (context, state, child) =>
              NoTransitionPage(child: HomeLayout(child: child)),
      routes: <GoRoute>[
        GoRoute(
          path: '/job',
          name: '主页',
          pageBuilder: (context, state) => NoTransitionPage(child: JobPage()),
        ),
        GoRoute(
          path: '/search',
          name: '搜索',
          pageBuilder:
              (context, state) => NoTransitionPage(child: SearchPage()),
        ),
        GoRoute(
          path: '/schedule',
          name: '日程',
          pageBuilder:
              (context, state) => NoTransitionPage(child: SchedulePage()),
        ),
        GoRoute(
          path: '/favorite',
          name: '收藏',
          pageBuilder:
              (context, state) => NoTransitionPage(child: FavoritePage()),
        ),
        GoRoute(
          path: '/personal',
          name: '我的',
          pageBuilder:
              (context, state) => NoTransitionPage(child: CandidatePage()),
        ),
      ],
    ),
    GoRoute(
      path: '/personal/contract/edit',
      name: '个人联系信息编辑',
      builder: (context, state) {
        final contractInfo = state.extra as ContractInfo;
        return ContractEditPage(contractInfo: contractInfo);
      },
    ),
    GoRoute(
      path: '/personal/profile/edit',
      name: '个人简介编辑',
      builder: (context, state) {
        final viewModel = state.extra as CandidateViewModel;
        return SummaryEditPage(viewModel: viewModel);
      },
    ),
    GoRoute(
      path: '/personal/basic/edit',
      name: '个人基础信息编辑',
      builder: (context, state) {
        final viewModel = state.extra as CandidateViewModel;
        return CandidateInfoEditPage(viewModel: viewModel);
      },
    ),
  ],
);
