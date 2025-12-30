class GeoDetailInfo {
  final int firstGeoLevelId;
  final int secondGeoLevelId;
  final int thirdGeoLevelId;
  final int forthGeoLevelId;

  final String? address;
  final double? latitude;
  final double? longitude;

  final String? firstGeoLevelName;
  final String? secondGeoLevelName;
  final String? thirdGeoLevelName;
  final String? forthGeoLevelName;

  GeoDetailInfo({
    required this.firstGeoLevelId,
    required this.secondGeoLevelId,
    required this.thirdGeoLevelId,
    required this.forthGeoLevelId,
    this.address,
    this.latitude,
    this.longitude,
    this.firstGeoLevelName,
    this.secondGeoLevelName,
    this.thirdGeoLevelName,
    this.forthGeoLevelName,
  });

  factory GeoDetailInfo.fromJson(Map<String, dynamic> json) {
    return GeoDetailInfo(
      firstGeoLevelId: json['firstGeoLevelId'],
      secondGeoLevelId: json['secondGeoLevelId'],
      thirdGeoLevelId: json['thirdGeoLevelId'],
      forthGeoLevelId: json['forthGeoLevelId'],
      address: json['address'],
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      firstGeoLevelName: json['firstGeoLevelName'],
      secondGeoLevelName: json['secondGeoLevelName'],
      thirdGeoLevelName: json['thirdGeoLevelName'],
      forthGeoLevelName: json['forthGeoLevelName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstGeoLevelId': firstGeoLevelId,
      'secondGeoLevelId': secondGeoLevelId,
      'thirdGeoLevelId': thirdGeoLevelId,
      'forthGeoLevelId': forthGeoLevelId,
      if (address != null) 'address': address,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (firstGeoLevelName != null) 'firstGeoLevelName': firstGeoLevelName,
      if (secondGeoLevelName != null) 'secondGeoLevelName': secondGeoLevelName,
      if (thirdGeoLevelName != null) 'thirdGeoLevelName': thirdGeoLevelName,
      if (forthGeoLevelName != null) 'forthGeoLevelName': forthGeoLevelName,
    };
  }
}
