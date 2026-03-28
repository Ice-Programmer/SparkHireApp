import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark_hire_app/components/custom_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:spark_hire_app/model/user/user_favor.dart';
import 'package:spark_hire_app/service/user_service.dart';
import 'package:spark_hire_app/utils/toast_util.dart';

class CompanyFollowButton extends StatefulWidget {
  final int companyId;
  final bool hasFavor;
  final double btnWidth;

  const CompanyFollowButton({
    super.key,
    required this.companyId,
    required this.hasFavor,
    required this.btnWidth,
  });

  @override
  State<CompanyFollowButton> createState() => _CompanyFollowButtonState();
}

class _CompanyFollowButtonState extends State<CompanyFollowButton> {
  late bool _isFollowed = widget.hasFavor;
  bool _isLoading = false;
  final UserService _userService = UserService();

  Future<void> _toggleFollow() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    try {
      if (_isFollowed) {
        // 取消关注
        await _userService.userCancelFavor(
          UserCancelFavorRequest(
            targetId: widget.companyId,
            targetType: TargetType.company,
          ),
        );
      } else {
        // 关注
        await _userService.userFavor(
          UserFavorRequest(
            targetId: widget.companyId,
            targetType: TargetType.company,
          ),
        );
      }

      setState(() {
        _isFollowed = !_isFollowed;
      });
    } catch (e) {
      ToastUtils.showErrorMsg("操作失败: $e");
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context)!;

    final String btnText = _isFollowed ? '已关注' : localizations.followText;
    final Color bgColor = _isFollowed ? Colors.grey.shade300 : Colors.white;
    final Color textColor =
        _isFollowed ? Colors.grey.shade700 : theme.colorScheme.primary;

    if (_isLoading) {
      return SizedBox(
        width: widget.btnWidth,
        height: 44.h,
        child: const Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
      );
    }

    return CustomButton(
      onPressed: _toggleFollow,
      textColor: textColor,
      btnWidth: widget.btnWidth,
      btnHeight: 44.h,
      fontSize: 14.sp,
      fontWeight: FontWeight.bold,
      title: btnText,
      isShadow: false,
      backgroundColor: bgColor,
    );
  }
}
