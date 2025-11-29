// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_mail_register_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserMailRegisterRequest extends UserMailRegisterRequest {
  @override
  final String email;
  @override
  final String verifyCode;

  factory _$UserMailRegisterRequest(
          [void Function(UserMailRegisterRequestBuilder)? updates]) =>
      (UserMailRegisterRequestBuilder()..update(updates))._build();

  _$UserMailRegisterRequest._({required this.email, required this.verifyCode})
      : super._();
  @override
  UserMailRegisterRequest rebuild(
          void Function(UserMailRegisterRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserMailRegisterRequestBuilder toBuilder() =>
      UserMailRegisterRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserMailRegisterRequest &&
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
    return (newBuiltValueToStringHelper(r'UserMailRegisterRequest')
          ..add('email', email)
          ..add('verifyCode', verifyCode))
        .toString();
  }
}

class UserMailRegisterRequestBuilder
    implements
        Builder<UserMailRegisterRequest, UserMailRegisterRequestBuilder> {
  _$UserMailRegisterRequest? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _verifyCode;
  String? get verifyCode => _$this._verifyCode;
  set verifyCode(String? verifyCode) => _$this._verifyCode = verifyCode;

  UserMailRegisterRequestBuilder() {
    UserMailRegisterRequest._defaults(this);
  }

  UserMailRegisterRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _verifyCode = $v.verifyCode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserMailRegisterRequest other) {
    _$v = other as _$UserMailRegisterRequest;
  }

  @override
  void update(void Function(UserMailRegisterRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserMailRegisterRequest build() => _build();

  _$UserMailRegisterRequest _build() {
    final _$result = _$v ??
        _$UserMailRegisterRequest._(
          email: BuiltValueNullFieldError.checkNotNull(
              email, r'UserMailRegisterRequest', 'email'),
          verifyCode: BuiltValueNullFieldError.checkNotNull(
              verifyCode, r'UserMailRegisterRequest', 'verifyCode'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
