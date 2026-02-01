import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:remixicon/remixicon.dart';
import 'package:spark_hire_app/components/custom_divider.dart';

class ProfileCard extends StatelessWidget {
  final String title;
  final List<Widget>? childList;
  final VoidCallback? onEdit;
  final VoidCallback? onCreate;
  final IconData iconData;
  final bool allCreate;

  const ProfileCard({
    super.key,
    required this.title,
    this.childList,
    this.onEdit,
    this.onCreate,
    required this.iconData,
    this.allCreate = false,
  });

  Widget buildEditButton(BuildContext context) {
    if (allCreate || childList!.isEmpty) {
      return InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onCreate,
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: Icon(
            Icons.add_rounded,
            size: 24.sp,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      );
    }
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onEdit,
      child: Padding(
        padding: EdgeInsets.all(4.w),
        child: Icon(
          RemixIcons.edit_line,
          size: 20.sp,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }

  Widget _buildCardChind(BuildContext context) {
    if (childList == null) {
      return SizedBox.shrink();
    }

    return Column(children: [CustomDivider(thickness: 0.3), ...childList!]);
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22.r),
        side: BorderSide(
          color: Theme.of(context).dividerColor.withValues(alpha: 0.1),
          width: 1.5,
        ),
      ),
      color: isDarkMode ? Theme.of(context).colorScheme.inverseSurface : null,
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  iconData,
                  color: Theme.of(context).colorScheme.primary,
                  size: 22.sp,
                ),

                10.horizontalSpace,

                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Spacer(),

                buildEditButton(context),
              ],
            ),

            _buildCardChind(context),
          ],
        ),
      ),
    );
  }
}
