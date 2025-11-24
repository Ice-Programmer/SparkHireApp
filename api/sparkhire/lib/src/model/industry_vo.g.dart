// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'industry_vo.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$IndustryVO extends IndustryVO {
  @override
  final String? industryType;
  @override
  final BuiltList<IndustryDetail>? industryDetails;

  factory _$IndustryVO([void Function(IndustryVOBuilder)? updates]) =>
      (IndustryVOBuilder()..update(updates))._build();

  _$IndustryVO._({this.industryType, this.industryDetails}) : super._();
  @override
  IndustryVO rebuild(void Function(IndustryVOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IndustryVOBuilder toBuilder() => IndustryVOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is IndustryVO &&
        industryType == other.industryType &&
        industryDetails == other.industryDetails;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, industryType.hashCode);
    _$hash = $jc(_$hash, industryDetails.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'IndustryVO')
          ..add('industryType', industryType)
          ..add('industryDetails', industryDetails))
        .toString();
  }
}

class IndustryVOBuilder implements Builder<IndustryVO, IndustryVOBuilder> {
  _$IndustryVO? _$v;

  String? _industryType;
  String? get industryType => _$this._industryType;
  set industryType(String? industryType) => _$this._industryType = industryType;

  ListBuilder<IndustryDetail>? _industryDetails;
  ListBuilder<IndustryDetail> get industryDetails =>
      _$this._industryDetails ??= ListBuilder<IndustryDetail>();
  set industryDetails(ListBuilder<IndustryDetail>? industryDetails) =>
      _$this._industryDetails = industryDetails;

  IndustryVOBuilder() {
    IndustryVO._defaults(this);
  }

  IndustryVOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _industryType = $v.industryType;
      _industryDetails = $v.industryDetails?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(IndustryVO other) {
    _$v = other as _$IndustryVO;
  }

  @override
  void update(void Function(IndustryVOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  IndustryVO build() => _build();

  _$IndustryVO _build() {
    _$IndustryVO _$result;
    try {
      _$result = _$v ??
          _$IndustryVO._(
            industryType: industryType,
            industryDetails: _industryDetails?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'industryDetails';
        _industryDetails?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'IndustryVO', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
