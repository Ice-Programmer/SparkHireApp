import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spark_hire_app/layouts/home_layout.dart';
import 'package:spark_hire_app/model/candidate/get_current_candidate.dart';
import 'package:spark_hire_app/pages/analyze/analyze_page.dart';
import 'package:spark_hire_app/pages/favorite/favorite_page.dart';
import 'package:spark_hire_app/pages/job/job_home_page/job_home_page.dart';
import 'package:spark_hire_app/pages/login/login_page.dart';
import 'package:spark_hire_app/pages/login/mail_login_page.dart';
import 'package:spark_hire_app/pages/personal/basic_info/candidate_info_edit_page.dart';
import 'package:spark_hire_app/pages/personal/candidate_page.dart';
import 'package:spark_hire_app/pages/personal/career_exp/career_exp_edit_page.dart';
import 'package:spark_hire_app/pages/personal/contract_info/contract_edit_page.dart';
import 'package:spark_hire_app/pages/personal/education_exp/education_info_edit_page.dart';
import 'package:spark_hire_app/pages/personal/summary_info/summary_edit_page.dart';
import 'package:spark_hire_app/pages/personal/tag_info/tag_info_edit_page.dart';
import 'package:spark_hire_app/pages/personal/view_model/candidate_view_model.dart';
import 'package:spark_hire_app/pages/personal/view_model/career_exp_view_model.dart';
import 'package:spark_hire_app/pages/personal/view_model/education_exp_view_model.dart';
import 'package:spark_hire_app/pages/personal/view_model/tag_view_model.dart';
import 'package:spark_hire_app/pages/personal/view_model/user_view_model.dart';
import 'package:spark_hire_app/pages/personal/view_model/wish_career_view_model.dart';
import 'package:spark_hire_app/pages/personal/wish_career/wish_career_edit_page.dart';
import 'package:spark_hire_app/pages/register/profile/select_role_page.dart';
import 'package:spark_hire_app/pages/register/register_page.dart';
import 'package:spark_hire_app/pages/register/register_verification_page.dart';
import 'package:spark_hire_app/pages/schedule/schedule_page.dart';
import 'package:spark_hire_app/pages/search/search_page.dart';
import 'package:spark_hire_app/pages/select_page/career_selection_page.dart';
import 'package:spark_hire_app/pages/welcome/guidance_page.dart';
import 'package:spark_hire_app/pages/welcome/welcome_page.dart';
import 'package:spark_hire_app/utils/toast_util.dart';

final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'shell',
);

final GoRouter router = GoRouter(
  navigatorKey: ToastUtils.rootNavigatorKey,
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      name: '欢迎页',
      builder: (context, state) => const WelcomePage(),
    ),
    GoRoute(
      path: '/guidance',
      name: '引导页',
      builder: (context, state) => const GuidancePage(),
    ),
    GoRoute(
      path: '/login',
      name: "登录页面",
      builder: (context, state) => const LoginPage(),
      routes: [
        GoRoute(
          path: 'mail',
          name: "邮箱登录页面",
          builder: (context, state) => MailLoginPage(),
        ),
      ],
    ),
    GoRoute(
      path: '/register',
      name: "用户注册",
      builder: (context, state) => RegisterPage(),
      routes: [
        GoRoute(
          path: 'verification',
          name: "用户注册验证码页面",
          builder:
              (context, state) => RegisterVerificationPage(
                email: state.uri.queryParameters['email'] ?? "",
              ),
        ),
      ],
    ),
    GoRoute(
      path: '/user/role/switch',
      name: '身份选择',
      builder: (context, state) => const SelectRolePage(),
    ),
    GoRoute(
      path: '/career/selection',
      name: '职业选择',
      builder: (context, state) => JobSelectionPage(),
    ),
    GoRoute(
      path: '/analyze',
      name: "职业分析",
      builder: (context, state) => AnalyzePage(),
    ),

    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => HomeLayout(child: child),
      routes: [
        GoRoute(
          path: '/job',
          name: '主页',
          pageBuilder: (context, state) => NoTransitionPage(child: JobHomePage()),
        ),
        GoRoute(
          path: '/search',
          name: '搜索',
          builder: (context, state) => SearchPage(),
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
          routes: _getCandidateEditRoutes(),
        ),
      ],
    ),
  ],
);

List<GoRoute> _getCandidateEditRoutes() {
  return [
    GoRoute(
      path: 'contract/edit',
      parentNavigatorKey: ToastUtils.rootNavigatorKey,
      builder:
          (context, state) =>
              ContractEditPage(contractInfo: state.extra as ContractInfo),
    ),
    GoRoute(
      path: 'profile/edit',
      parentNavigatorKey: ToastUtils.rootNavigatorKey,
      builder:
          (context, state) =>
              SummaryEditPage(viewModel: state.extra as CandidateInfoViewModel),
    ),
    GoRoute(
      path: 'basic/edit',
      parentNavigatorKey: ToastUtils.rootNavigatorKey,
      builder: (context, state) {
        final (userVm, candidateVm) =
            state.extra as (UserViewModel, CandidateInfoViewModel);
        return CandidateInfoEditPage(
          userViewModel: userVm,
          candidateInfoViewModel: candidateVm,
        );
      },
    ),
    GoRoute(
      path: 'education/edit/:eduExpId',
      parentNavigatorKey: ToastUtils.rootNavigatorKey,
      builder:
          (context, state) => EducationInfoEditPage(
            viewModel: state.extra as EducationExpViewModel,
            educationExpId:
                int.tryParse(state.pathParameters['eduExpId'] ?? '0') ?? 0,
          ),
    ),
    GoRoute(
      path: 'career/exp/edit/:careerExpId',
      parentNavigatorKey: ToastUtils.rootNavigatorKey,
      builder:
          (context, state) => CareerExpEditPage(
            viewModel: state.extra as CareerExpViewModel,
            careerExpId:
                int.tryParse(state.pathParameters['careerExpId'] ?? '0') ?? 0,
          ),
    ),
    GoRoute(
      path: 'skill/tag/edit',
      parentNavigatorKey: ToastUtils.rootNavigatorKey,
      builder:
          (context, state) =>
              TagInfoEditPage(viewModel: state.extra as TagViewModel),
    ),
    GoRoute(
      path: 'wish/career/edit/:wishCareerId',
      parentNavigatorKey: ToastUtils.rootNavigatorKey,
      builder:
          (context, state) => WishCareerEditPage(
            viewModel: state.extra as WishCareerViewModel,
            wishCareerId:
                int.tryParse(state.pathParameters['wishCareerId'] ?? '0') ?? 0,
          ),
    ),
  ];
}
