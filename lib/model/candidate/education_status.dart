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
}