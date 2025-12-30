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
}

