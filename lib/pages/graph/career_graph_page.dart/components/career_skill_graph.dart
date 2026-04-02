import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark_hire_app/pages/graph/career_graph_page.dart/components/decorator_demo.dart';

class CareerSkillGraph extends StatefulWidget {
  const CareerSkillGraph({super.key});

  @override
  State<CareerSkillGraph> createState() => _CareerSkillGraphState();
}

class _CareerSkillGraphState extends State<CareerSkillGraph> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 技能图谱
        Text(
          "技能图谱",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
        ),

        //
        SizedBox(height: 400.h, child: const GraphDemo()),
      ],
    );
  }
}
