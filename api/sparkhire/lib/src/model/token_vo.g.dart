// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_vo.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TokenVO extends TokenVO {
  @override
  final String? accessToken;
  @override
  final int? expireTime;

  factory _$TokenVO([void Function(TokenVOBuilder)? updates]) =>
      (TokenVOBuilder()..update(updates))._build();

  _$TokenVO._({this.accessToken, this.expireTime}) : super._();
  @override
  TokenVO rebuild(void Function(TokenVOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TokenVOBuilder toBuilder() => TokenVOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TokenVO &&
        accessToken == other.accessToken &&
        expireTime == other.expireTime;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, accessToken.hashCode);
    _$hash = $jc(_$hash, expireTime.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TokenVO')
          ..add('accessToken', accessToken)
          ..add('expireTime', expireTime))
        .toString();
  }
}

class TokenVOBuilder implements Builder<TokenVO, TokenVOBuilder> {
  _$TokenVO? _$v;

  String? _accessToken;
  String? get accessToken => _$this._accessToken;
  set accessToken(String? accessToken) => _$this._accessToken = accessToken;

  int? _expireTime;
  int? get expireTime => _$this._expireTime;
  set expireTime(int? expireTime) => _$this._expireTime = expireTime;

  TokenVOBuilder() {
    TokenVO._defaults(this);
  }

  TokenVOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _accessToken = $v.accessToken;
      _expireTime = $v.expireTime;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TokenVO other) {
    _$v = other as _$TokenVO;
  }

  @override
  void update(void Function(TokenVOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TokenVO build() => _build();

  _$TokenVO _build() {
    final _$result = _$v ??
        _$TokenVO._(
          accessToken: accessToken,
          expireTime: expireTime,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
