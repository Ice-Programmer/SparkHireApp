class MajorInfo {
  final int id;
  final String majorName;

  MajorInfo({required this.id, required this.majorName});

  factory MajorInfo.fromJson(Map<String, dynamic> json) {
    return MajorInfo(id: json["id"], majorName: json["majorName"]);
  }
}
