import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum InterviewStatus {
  pending(1),
  process(2),
  finished(3),
  cancel(4),
  unknown(0);

  const InterviewStatus(this.value);
  final int value;

  static InterviewStatus fromInt(int value) {
    return InterviewStatus.values.firstWhere(
      (type) => type.value == value,
      orElse: () => InterviewStatus.unknown,
    );
  }

  String getLocalizedName(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return switch (this) {
      InterviewStatus.pending => l10n.notStart,
      InterviewStatus.process => l10n.process,
      InterviewStatus.finished => l10n.completed,
      InterviewStatus.cancel => l10n.cancelText,
      InterviewStatus.unknown => l10n.statusUnknown,
    };
  }
}
