// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_basic_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserBasicInfo extends UserBasicInfo {
  @override
  final int? id;
  @override
  final String? username;
  @override
  final String? userAvatar;
  @override
  final String? email;
  @override
  final String? role;

  factory _$UserBasicInfo([void Function(UserBasicInfoBuilder)? updates]) =>
      (UserBasicInfoBuilder()..update(updates))._build();

  _$UserBasicInfo._(
      {this.id, this.username, this.userAvatar, this.email, this.role})
      : super._();
  @override
  UserBasicInfo rebuild(void Function(UserBasicInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserBasicInfoBuilder toBuilder() => UserBasicInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserBasicInfo &&
        id == other.id &&
        username == other.username &&
        userAvatar == other.userAvatar &&
        email == other.email &&
        role == other.role;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, username.hashCode);
    _$hash = $jc(_$hash, userAvatar.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, role.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserBasicInfo')
          ..add('id', id)
          ..add('username', username)
          ..add('userAvatar', userAvatar)
          ..add('email', email)
          ..add('role', role))
        .toString();
  }
}

class UserBasicInfoBuilder
    implements Builder<UserBasicInfo, UserBasicInfoBuilder> {
  _$UserBasicInfo? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _userAvatar;
  String? get userAvatar => _$this._userAvatar;
  set userAvatar(String? userAvatar) => _$this._userAvatar = userAvatar;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _role;
  String? get role => _$this._role;
  set role(String? role) => _$this._role = role;

  UserBasicInfoBuilder() {
    UserBasicInfo._defaults(this);
  }

  UserBasicInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _username = $v.username;
      _userAvatar = $v.userAvatar;
      _email = $v.email;
      _role = $v.role;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserBasicInfo other) {
    _$v = other as _$UserBasicInfo;
  }

  @override
  void update(void Function(UserBasicInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserBasicInfo build() => _build();

  _$UserBasicInfo _build() {
    final _$result = _$v ??
        _$UserBasicInfo._(
          id: id,
          username: username,
          userAvatar: userAvatar,
          email: email,
          role: role,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
