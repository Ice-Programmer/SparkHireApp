import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark_hire_app/model/company/company_info.dart';

class CompanyDescriptionContent extends StatelessWidget {
  final CompanyInfo companyInfo;
  const CompanyDescriptionContent({super.key, required this.companyInfo});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "公司介绍",
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),

        8.verticalSpace,

        Text(
          companyInfo.description,
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.grey[700],
            height: 1.8,
          ),
        ),
        40.verticalSpace,

        _buildSectionTitle("办公环境", trailing: "查看全部"),

        20.verticalSpace,

        _buildOfficeGallery(),
        100.verticalSpace, // 底部留白
      ],
    );
  }

  Widget _buildSectionTitle(String title, {String? trailing}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        if (trailing != null)
          Text(
            trailing,
            style: TextStyle(
              fontSize: 14.sp,
              color: const Color(0xFF2E1AAB),
              fontWeight: FontWeight.w600,
            ),
          ),
      ],
    );
  }

  Widget _buildOfficeGallery() {
    final List<String> images = ["img1", "img2", "img3", "img4"];
    return SizedBox(
      height: 80.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        separatorBuilder: (_, __) => 12.horizontalSpace,
        itemBuilder: (context, index) {
          return Container(
            width: 80.w,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12.r),
              image: const DecorationImage(
                image: NetworkImage(
                  "https://via.placeholder.com/150",
                ), // 请替换为真实图片
                fit: BoxFit.cover,
              ),
            ),
            child:
                index == 3
                    ? Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: const Text(
                        "8+",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                    : null,
          );
        },
      ),
    );
  }
}
