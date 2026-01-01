import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum JobStatus {
  avaliable,
  withInMonth,
  openOpportunity,
  notInterested,
  unknown,
}

extension JobStatusExt on JobStatus {
  static JobStatus fromInt(int value) {
    switch (value) {
      case 1:
        return JobStatus.avaliable;
      case 2:
        return JobStatus.withInMonth;
      case 3:
        return JobStatus.openOpportunity;
      case 4:
        return JobStatus.notInterested;
      default:
        return JobStatus.unknown;
    }
  }

  int get value {
    switch (this) {
      case JobStatus.avaliable:
        return 1;
      case JobStatus.withInMonth:
        return 2;
      case JobStatus.openOpportunity:
        return 3;
      case JobStatus.notInterested:
        return 4;
      case JobStatus.unknown:
        return 0;
    }
  }

  String get stringValue {
    switch (this) {
      case JobStatus.avaliable:
        return "目前可随时到岗";
      case JobStatus.withInMonth:
        return "可在一个月内到岗";
      case JobStatus.openOpportunity:
        return "愿意了解合适机会";
      case JobStatus.notInterested:
        return "暂不考虑新的机会";
      default:
        return "未知求职状态";
    }
  }

  String getMultiLanguageString(BuildContext context) {
    switch (this) {
      case JobStatus.avaliable:
        return AppLocalizations.of(context)!.statusAvailable;
      case JobStatus.withInMonth:
        return AppLocalizations.of(context)!.statusInMonth;
      case JobStatus.openOpportunity:
        return AppLocalizations.of(context)!.statusOpen;
      case JobStatus.notInterested:
        return AppLocalizations.of(context)!.statusNotInterested;
      default:
        return AppLocalizations.of(context)!.statusUnknown;
    }
  }

  Color get color {
    switch (this) {
      case JobStatus.avaliable:
        return Colors.green;
      case JobStatus.withInMonth:
        return Colors.blue;
      case JobStatus.openOpportunity:
        return Colors.orange;
      case JobStatus.notInterested:
        return Colors.grey;
      default:
        return Colors.blueGrey;
    }
  }
}
