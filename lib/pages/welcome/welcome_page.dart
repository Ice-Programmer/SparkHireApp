import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen(duration: const Duration(seconds: 3));
  }

  void _navigateToNextScreen({required Duration duration}) {
    Future.delayed(duration, () {
      if (mounted) {
        context.go('/guidance');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final ringColor = Colors.white.withValues(alpha: 0.05);

    return Scaffold(
      backgroundColor: const Color(0xFF302DAD),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 260.h,
            child: Container(
              width: 240.w,
              height: 240.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: ringColor, width: 40.w),
              ),
            ),
          ),

          Positioned(
            bottom: -280.h,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 550.w,
                height: 500.h,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: ringColor, width: 50.w),
                  borderRadius: BorderRadius.circular(180.r),
                ),
              ),
            ),
          ),

          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(height: 160.h),
                  Text(
                    AppLocalizations.of(context)!.appName,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontSize: 38.sp,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    AppLocalizations.of(context)!.appSlogan,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
