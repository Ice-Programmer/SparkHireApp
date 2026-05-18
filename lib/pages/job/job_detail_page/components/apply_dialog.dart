import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark_hire_app/components/custom_button.dart';

class ApplyDialog extends StatefulWidget {
  const ApplyDialog({super.key});

  @override
  State<ApplyDialog> createState() => _ApplyDialogState();
}

class _ApplyDialogState extends State<ApplyDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> scaleAnimation;
  late Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );

    fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FadeTransition(
      opacity: fadeAnimation,
      child: ScaleTransition(
        scale: scaleAnimation,
        child: Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          insetPadding: EdgeInsets.symmetric(horizontal: 28.w),
          child: Container(
            padding: EdgeInsets.fromLTRB(28.w, 28.h, 28.w, 24.h),
            decoration: BoxDecoration(
              color: theme.colorScheme.inverseSurface,
              borderRadius: BorderRadius.circular(38.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// 顶部动画 Icon
                SizedBox(
                  width: 150.w,
                  height: 150.w,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      /// 外圈
                      Container(
                        width: 128.w,
                        height: 128.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Theme.of(
                                context,
                              ).colorScheme.primary.withAlpha(150),
                              Theme.of(context).colorScheme.primary,
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(
                                context,
                              ).colorScheme.primary.withAlpha(110),
                              blurRadius: 30,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                      ),

                      /// 中间白色方块
                      Container(
                        width: 50.w,
                        height: 50.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Icon(
                          CupertinoIcons.checkmark,
                          color: Theme.of(context).colorScheme.primary,
                          size: 28.sp,
                        ),
                      ),

                      /// 小圆点装饰
                      ...List.generate(
                        10,
                        (index) => _FloatingDot(angle: (pi * 2 / 10) * index),
                      ),
                    ],
                  ),
                ),

                15.verticalSpace,

                /// 标题
                Text(
                  '投递成功!',
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.primary,
                    letterSpacing: 2,
                  ),
                ),

                20.verticalSpace,

                /// 描述
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Text(
                    '您的申请已成功提交。\n您可以在「我的申请」中追踪应聘进度。',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15.sp,
                      height: 1.7,
                      color: Theme.of(context).colorScheme.tertiary,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                30.verticalSpace,

                /// 主按钮
                CustomButton(
                  textColor: Theme.of(context).colorScheme.onPrimary,
                  btnWidth: double.infinity,
                  btnHeight: 54.h,
                  fontSize: 17.sp,
                  title: '前往 「我的申请」',
                  borderRadius: 18.r,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  onPressed: () {},
                ),

                15.verticalSpace,

                /// 取消按钮
                CustomButton(
                  textColor: Colors.black87,
                  btnWidth: double.infinity,
                  btnHeight: 54.h,
                  fontSize: 17.sp,
                  backgroundColor: Theme.of(
                    context,
                  ).colorScheme.primary.withAlpha(20),
                  isShadow: false,
                  title: '取消',
                  fontWeight: FontWeight.w400,
                  borderRadius: 18.r,
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FloatingDot extends StatelessWidget {
  final double angle;

  const _FloatingDot({required this.angle});

  @override
  Widget build(BuildContext context) {
    final radius = 68.w;

    final dx = cos(angle) * radius;
    final dy = sin(angle) * radius;

    final randomSize = [4.w, 5.w, 6.w, 8.w][angle.toInt().abs() % 4];

    return Transform.translate(
      offset: Offset(dx, dy),
      child: Container(
        width: randomSize,
        height: randomSize,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withAlpha(160),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
