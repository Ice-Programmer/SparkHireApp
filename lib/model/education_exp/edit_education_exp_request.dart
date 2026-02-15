class EditEducationExpRequest {
  final int id;
  final int schoolId;
  final int beginYear;
  final int endYear;
  final int majorId;
  final String activity;

  EditEducationExpRequest({
    required this.id,
    required this.schoolId,
    required this.beginYear,
    required this.endYear,
    required this.majorId,
    required this.activity,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "schoolId": schoolId,
      "beginYear": beginYear,
      "endYear": endYear,
      "majorId": majorId,
      "activity": activity,
    };
  }
}
