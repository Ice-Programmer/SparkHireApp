// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'major_vo.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MajorVO extends MajorVO {
  @override
  final int? id;
  @override
  final String? majorName;

  factory _$MajorVO([void Function(MajorVOBuilder)? updates]) =>
      (MajorVOBuilder()..update(updates))._build();

  _$MajorVO._({this.id, this.majorName}) : super._();
  @override
  MajorVO rebuild(void Function(MajorVOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MajorVOBuilder toBuilder() => MajorVOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MajorVO && id == other.id && majorName == other.majorName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, majorName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MajorVO')
          ..add('id', id)
          ..add('majorName', majorName))
        .toString();
  }
}

class MajorVOBuilder implements Builder<MajorVO, MajorVOBuilder> {
  _$MajorVO? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _majorName;
  String? get majorName => _$this._majorName;
  set majorName(String? majorName) => _$this._majorName = majorName;

  MajorVOBuilder() {
    MajorVO._defaults(this);
  }

  MajorVOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _majorName = $v.majorName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MajorVO other) {
    _$v = other as _$MajorVO;
  }

  @override
  void update(void Function(MajorVOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MajorVO build() => _build();

  _$MajorVO _build() {
    final _$result = _$v ??
        _$MajorVO._(
          id: id,
          majorName: majorName,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
