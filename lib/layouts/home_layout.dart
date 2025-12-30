import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spark_hire_app/http/business_exception.dart';
import 'package:spark_hire_app/model/user/fetch_current_user.dart';
import 'package:spark_hire_app/service/user_service.dart';
import 'package:spark_hire_app/utils/toast_util.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class HomeLayout extends StatefulWidget {
  final Widget child;
  const HomeLayout({super.key, required this.child});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  final UserService _userService = UserService();
  int _index = 0;
  final List<String> tabRoutes = ["/job", "/search", "/favorite", "/personal"];

  @override
  void initState() {
    super.initState();
    _getCurrentLoginUser();
  }

  void _getCurrentLoginUser() async {
    try {
      final result = await _userService.fetchCurrentUser(
        FetchCurrentUserRequest(),
      );
      if (!mounted) return;
      if (result.basicInfo.role == UserRole.visitor) {
        context.go('/user/role/switch');
      }
    } on BusinessException catch (e) {
      ToastUtils.showErrorMsg(e.message);
    } on Exception {
      ToastUtils.showErrorMsg('网络异常，请稍后重试');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
      ),
      extendBody: true,
      backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
      bottomNavigationBar: _getBottomNavigator(context),
      body: widget.child,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).colorScheme.surface,
        shape: const CircleBorder(),
        child: Icon(Icons.calendar_month_rounded, color: Colors.black),
      ),
    );
  }

  Widget _getBottomNavigator(BuildContext context) {
    return StylishBottomBar(
      currentIndex: _index,
      hasNotch: true,
      fabLocation: StylishBarFabLocation.center,
      notchStyle: NotchStyle.circle,

      onTap: (index) {
        setState(() {
          _index = index;
        });
        context.go(tabRoutes[_index]);
      },
      backgroundColor: Theme.of(context).colorScheme.surface,
      option: AnimatedBarOptions(iconStyle: IconStyle.animated),
      items: [
        buildItem(index: 0, icon: Icons.home_rounded, title: '首页'),
        buildItem(index: 1, icon: Icons.group_work_rounded, title: '论坛'),
        buildItem(index: 2, icon: Icons.bookmark_outline_rounded, title: '收藏'),
        buildItem(index: 3, icon: Icons.person_rounded, title: '我的'),
      ],
    );
  }

  BottomBarItem buildItem({
    required int index,
    required IconData icon,
    required String title,
  }) {
    return BottomBarItem(
      icon: Icon(icon),
      title: Text(title),
      selectedColor: Theme.of(context).colorScheme.primary,
      unSelectedColor: Color(0xFFA4ACB9),
    );
  }
}
