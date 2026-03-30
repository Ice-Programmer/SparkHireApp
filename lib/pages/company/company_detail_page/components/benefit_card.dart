import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark_hire_app/components/custom_divider.dart';
import 'package:spark_hire_app/model/company/benefit.dart';
import 'package:spark_hire_app/theme/semantic_theme.dart';

class BenefitCard extends StatefulWidget {
  final BenefitInfo benefitInfo;

  const BenefitCard({super.key, required this.benefitInfo});

  @override
  State<BenefitCard> createState() => _BenefitCardState();
}

class _BenefitCardState extends State<BenefitCard> {
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16.sp),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.6),
          width: 0.3,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 福利 title
          _buildBenefitCardTitle(),

          // 卡片内部内容
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            alignment: Alignment.topCenter,
            child: _buildBenefitDetailContent(widget.benefitInfo.itemList),
          ),
        ],
      ),
    );
  }

  /// 福利 title
  Widget _buildBenefitCardTitle() {
    return InkWell(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 13.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 福利 title
            Text(
              widget.benefitInfo.title,
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
            ),

            // 展开按钮
            AnimatedRotation(
              turns: _isExpanded ? 0 : 0.5,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: Icon(
                Icons.expand_less_rounded,
                color: Theme.of(context).colorScheme.primary,
                size: 26.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 具体 benefit item 内容
  Widget _buildBenefitDetailContent(List<BenefitDetail> itemList) {
    if (!_isExpanded) {
      return SizedBox.shrink();
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // 分割线
        CustomDivider(
          height: 1,
          thickness: 0.5,
          color: Theme.of(context).colorScheme.outline,
          horizontalGap: 16.w,
        ),

        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
          child: ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.benefitInfo.itemList.length,
            separatorBuilder: (context, index) => 10.verticalSpace,
            itemBuilder: (context, index) {
              return _buildListItem(widget.benefitInfo.itemList[index].title);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildListItem(String title) {
    return Row(
      children: [
        Icon(
          Icons.check_rounded,
          color: Theme.of(context).semantic.success,
          size: 22.sp,
        ),

        16.horizontalSpace,

        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 13.sp,
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
        ),
      ],
    );
  }
}
