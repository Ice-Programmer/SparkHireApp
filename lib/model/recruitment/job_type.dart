import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum JobType { internship, partTime, fullTime, unknown }

extension JobTypeExt on JobType {
  static JobType fromInt(int value) {
    switch (value) {
      case 1:
        return JobType.internship;
      case 2:
        return JobType.partTime;
      case 3:
        return JobType.fullTime;
      default:
        return JobType.unknown;
    }
  }

  int get value {
    switch (this) {
      case JobType.internship:
        return 1;
      case JobType.partTime:
        return 2;
      case JobType.fullTime:
        return 3;
      case JobType.unknown:
        return 0;
    }
  }

  String getMultiLanguageString(BuildContext context) {
    switch (this) {
      case JobType.internship:
        return AppLocalizations.of(context)!.internship;
      case JobType.partTime:
        return AppLocalizations.of(context)!.partTimeText;
      case JobType.fullTime:
        return AppLocalizations.of(context)!.fullTimeText;
      default:
        return AppLocalizations.of(context)!.statusUnknown;
    }
  }
}
