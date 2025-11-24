// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_code_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VerifyCodeRequest extends VerifyCodeRequest {
  @override
  final String? email;

  factory _$VerifyCodeRequest(
          [void Function(VerifyCodeRequestBuilder)? updates]) =>
      (VerifyCodeRequestBuilder()..update(updates))._build();

  _$VerifyCodeRequest._({this.email}) : super._();
  @override
  VerifyCodeRequest rebuild(void Function(VerifyCodeRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VerifyCodeRequestBuilder toBuilder() =>
      VerifyCodeRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VerifyCodeRequest && email == other.email;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VerifyCodeRequest')
          ..add('email', email))
        .toString();
  }
}

class VerifyCodeRequestBuilder
    implements Builder<VerifyCodeRequest, VerifyCodeRequestBuilder> {
  _$VerifyCodeRequest? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  VerifyCodeRequestBuilder() {
    VerifyCodeRequest._defaults(this);
  }

  VerifyCodeRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VerifyCodeRequest other) {
    _$v = other as _$VerifyCodeRequest;
  }

  @override
  void update(void Function(VerifyCodeRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VerifyCodeRequest build() => _build();

  _$VerifyCodeRequest _build() {
    final _$result = _$v ??
        _$VerifyCodeRequest._(
          email: email,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
