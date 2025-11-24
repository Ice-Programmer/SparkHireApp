// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_mail_login_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserMailLoginRequest extends UserMailLoginRequest {
  @override
  final String? email;
  @override
  final String? verifyCode;

  factory _$UserMailLoginRequest(
          [void Function(UserMailLoginRequestBuilder)? updates]) =>
      (UserMailLoginRequestBuilder()..update(updates))._build();

  _$UserMailLoginRequest._({this.email, this.verifyCode}) : super._();
  @override
  UserMailLoginRequest rebuild(
          void Function(UserMailLoginRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserMailLoginRequestBuilder toBuilder() =>
      UserMailLoginRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserMailLoginRequest &&
        email == other.email &&
        verifyCode == other.verifyCode;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, verifyCode.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserMailLoginRequest')
          ..add('email', email)
          ..add('verifyCode', verifyCode))
        .toString();
  }
}

class UserMailLoginRequestBuilder
    implements Builder<UserMailLoginRequest, UserMailLoginRequestBuilder> {
  _$UserMailLoginRequest? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _verifyCode;
  String? get verifyCode => _$this._verifyCode;
  set verifyCode(String? verifyCode) => _$this._verifyCode = verifyCode;

  UserMailLoginRequestBuilder() {
    UserMailLoginRequest._defaults(this);
  }

  UserMailLoginRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _verifyCode = $v.verifyCode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserMailLoginRequest other) {
    _$v = other as _$UserMailLoginRequest;
  }

  @override
  void update(void Function(UserMailLoginRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserMailLoginRequest build() => _build();

  _$UserMailLoginRequest _build() {
    final _$result = _$v ??
        _$UserMailLoginRequest._(
          email: email,
          verifyCode: verifyCode,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
