// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'industry_detail.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$IndustryDetail extends IndustryDetail {
  @override
  final int? id;
  @override
  final String? name;

  factory _$IndustryDetail([void Function(IndustryDetailBuilder)? updates]) =>
      (IndustryDetailBuilder()..update(updates))._build();

  _$IndustryDetail._({this.id, this.name}) : super._();
  @override
  IndustryDetail rebuild(void Function(IndustryDetailBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IndustryDetailBuilder toBuilder() => IndustryDetailBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is IndustryDetail && id == other.id && name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'IndustryDetail')
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class IndustryDetailBuilder
    implements Builder<IndustryDetail, IndustryDetailBuilder> {
  _$IndustryDetail? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  IndustryDetailBuilder() {
    IndustryDetail._defaults(this);
  }

  IndustryDetailBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(IndustryDetail other) {
    _$v = other as _$IndustryDetail;
  }

  @override
  void update(void Function(IndustryDetailBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  IndustryDetail build() => _build();

  _$IndustryDetail _build() {
    final _$result = _$v ??
        _$IndustryDetail._(
          id: id,
          name: name,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
