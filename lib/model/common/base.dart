// lib/model/base.dart
class Base {
  final String logId;
  final String caller;
  final String addr;
  final String client;
  final Map<String, String>? extra;

  const Base({
    required this.logId,
    required this.caller,
    required this.addr,
    required this.client,
    this.extra,
  });

  factory Base.fromJson(Map<String, dynamic> json) {
    return Base(
      logId: json['logId'] as String,
      caller: json['caller'] as String,
      addr: json['addr'] as String,
      client: json['client'] as String,
      extra:
          json['extra'] == null
              ? null
              : Map<String, String>.from(json['extra']),
    );
  }

  Map<String, dynamic> toJson() => {
    'logId': logId,
    'caller': caller,
    'addr': addr,
    'client': client,
    if (extra != null) 'extra': extra,
  };
}
