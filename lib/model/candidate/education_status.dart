import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark_hire_app/components/custom_tag.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum EducationStatus {
  bachelor,
  master,
  doctor,
  juniorCollege,
  highSchool,
  belowHighSchool,
  unknown,
}

extension EducationStatusExt on EducationStatus {
  static EducationStatus fromInt(int value) {
    switch (value) {
      case 1:
        return EducationStatus.bachelor;
      case 2:
        return EducationStatus.master;
      case 3:
        return EducationStatus.doctor;
      case 4:
        return EducationStatus.juniorCollege;
      case 5:
        return EducationStatus.highSchool;
      case 6:
        return EducationStatus.belowHighSchool;
      default:
        return EducationStatus.unknown;
    }
  }

  bool get isEmpty => this == EducationStatus.unknown;

  int get value {
    switch (this) {
      case EducationStatus.bachelor:
        return 1;
      case EducationStatus.master:
        return 2;
      case EducationStatus.doctor:
        return 3;
      case EducationStatus.juniorCollege:
        return 4;
      case EducationStatus.highSchool:
        return 5;
      case EducationStatus.belowHighSchool:
        return 6;
      case EducationStatus.unknown:
        return 0;
    }
  }
  String text(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    switch (this) {
      case EducationStatus.bachelor:
        return l10n.bachelorText;
      case EducationStatus.master:
        return l10n.masterText;
      case EducationStatus.doctor:
        return l10n.doctorText;
      case EducationStatus.juniorCollege:
        return l10n.juniorCollegeText;
      case EducationStatus.highSchool:
        return l10n.highSchoolText;
      case EducationStatus.belowHighSchool:
        return l10n.belowHighSchoolText;
      case EducationStatus.unknown:
        return l10n.unknownText;
    }
  }
}

extension EducationStatusUIExt on EducationStatus {
  CustomTag tag(BuildContext context) {
    return CustomTag(
      color: color,
      fontSize: 11.sp,
      text: text(context),
    );
  }

  Color get color {
    switch (this) {
      case EducationStatus.doctor:
        return Colors.deepPurpleAccent;
      case EducationStatus.master:
        return Colors.blueAccent;
      case EducationStatus.bachelor:
        return Colors.cyan;
      case EducationStatus.juniorCollege:
        return Colors.teal;
      case EducationStatus.highSchool:
        return Colors.orangeAccent;
      case EducationStatus.belowHighSchool:
        return Colors.grey;
      case EducationStatus.unknown:
        return Colors.grey;
    }
  }
}
