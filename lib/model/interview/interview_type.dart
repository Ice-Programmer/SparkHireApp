import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum InterviewType {
  video(1),
  onsite(2),
  phone(3),
  unknown(0);

  const InterviewType(this.value);
  final int value;

  static InterviewType fromInt(int value) {
    return InterviewType.values.firstWhere(
      (type) => type.value == value,
      orElse: () => InterviewType.unknown,
    );
  }

  String getLocalizedName(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return switch (this) {
      InterviewType.video => l10n.videoInterview,
      InterviewType.onsite => l10n.onsiteInterview,
      InterviewType.phone => l10n.phoneInterview,
      InterviewType.unknown => l10n.statusUnknown,
    };
  }
}
