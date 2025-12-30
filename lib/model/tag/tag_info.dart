class TagInfo {
  final int id;
  final String tagName;

  TagInfo({required this.id, required this.tagName});

  factory TagInfo.fromJson(Map<String, dynamic> json) {
    return TagInfo(id: json['id'], tagName: json['tagName']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'tagName': tagName};
  }
}
