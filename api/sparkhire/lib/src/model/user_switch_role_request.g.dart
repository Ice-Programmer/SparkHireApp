// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_switch_role_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserSwitchRoleRequest extends UserSwitchRoleRequest {
  @override
  final String? role;

  factory _$UserSwitchRoleRequest(
          [void Function(UserSwitchRoleRequestBuilder)? updates]) =>
      (UserSwitchRoleRequestBuilder()..update(updates))._build();

  _$UserSwitchRoleRequest._({this.role}) : super._();
  @override
  UserSwitchRoleRequest rebuild(
          void Function(UserSwitchRoleRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserSwitchRoleRequestBuilder toBuilder() =>
      UserSwitchRoleRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserSwitchRoleRequest && role == other.role;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, role.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserSwitchRoleRequest')
          ..add('role', role))
        .toString();
  }
}

class UserSwitchRoleRequestBuilder
    implements Builder<UserSwitchRoleRequest, UserSwitchRoleRequestBuilder> {
  _$UserSwitchRoleRequest? _$v;

  String? _role;
  String? get role => _$this._role;
  set role(String? role) => _$this._role = role;

  UserSwitchRoleRequestBuilder() {
    UserSwitchRoleRequest._defaults(this);
  }

  UserSwitchRoleRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _role = $v.role;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserSwitchRoleRequest other) {
    _$v = other as _$UserSwitchRoleRequest;
  }

  @override
  void update(void Function(UserSwitchRoleRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserSwitchRoleRequest build() => _build();

  _$UserSwitchRoleRequest _build() {
    final _$result = _$v ??
        _$UserSwitchRoleRequest._(
          role: role,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
