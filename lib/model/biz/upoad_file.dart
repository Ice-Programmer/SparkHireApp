import 'dart:convert';
import 'dart:typed_data';

import 'package:spark_hire_app/model/common/base.dart';
import 'package:spark_hire_app/model/common/base_response.dart';

enum FileType { companyAvatar, userAvatar, unknown }

extension FileTypeExt on FileType {
  static FileType fromInt(int value) {
    switch (value) {
      case 1:
        return FileType.companyAvatar;
      case 2:
        return FileType.userAvatar;
      default:
        return FileType.unknown;
    }
  }

  int get value {
    switch (this) {
      case FileType.companyAvatar:
        return 1;
      case FileType.userAvatar:
        return 2;
      case FileType.unknown:
        return 0;
    }
  }
}

class UploadFileRequest {
  final String filename;
  final FileType fileType;
  final Uint8List file;
  final Base? base;

  UploadFileRequest({
    required this.filename,
    required this.fileType,
    required this.file,
    this.base,
  });

  Map<String, dynamic> toJson() => {
    "filename": filename,
    "file": base64Encode(file),
    "fileType": fileType.value,
    if (base != null) "base": base!.toJson(),
  };
}

class UploadFileReponse {
  final String fileLink;
  final BaseResp baseResp;

  UploadFileReponse({required this.fileLink, required this.baseResp});

  bool get success => baseResp.success;

  factory UploadFileReponse.fromJson(Map<String, dynamic> json) {
    return UploadFileReponse(
      fileLink: json['fileLink'],
      baseResp: BaseResp.fromJson(json['BaseResp']),
    );
  }
}
