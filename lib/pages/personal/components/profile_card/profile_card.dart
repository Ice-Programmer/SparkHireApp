import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:remixicon/remixicon.dart';
import 'package:spark_hire_app/components/custom_divider.dart';

class ProfileCard extends StatelessWidget {
  final String title;
  final List<Widget>? childList;
  const ProfileCard({super.key, required this.title, this.childList});

  Widget buildEditButton(BuildContext context) {
    if (childList?.isEmpty ?? true) {
      return IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.add_rounded,
          color: Theme.of(context).colorScheme.primary,
          size: 26.sp,
        ),
      );
    }
    return IconButton(
      onPressed: () {},
      icon: Icon(
        RemixIcons.edit_line,
        color: Theme.of(context).colorScheme.primary,
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
    return Card(
      child: Padding(
        padding: EdgeInsets.all(14.w),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.person_rounded,
                  color: Theme.of(context).colorScheme.primary,
                  size: 30.sp,
                ),

                16.horizontalSpace,

                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18.sp,
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
