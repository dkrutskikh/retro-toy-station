// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppInfo {

/// The app name
 String get appName;/// The package name
 String get packageName;/// The package version
 Version get version;/// The build signature.
///
/// SHA-256 signing key signature (hex) on Android.
/// Empty string on all the other platforms.
 String get buildSignature;/// The installer store. Indicates through which store this application was installed.
 String? get installStore;/// The time when the application was installed.
 DateTime? get installTime;
/// Create a copy of AppInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppInfoCopyWith<AppInfo> get copyWith => _$AppInfoCopyWithImpl<AppInfo>(this as AppInfo, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppInfo&&(identical(other.appName, appName) || other.appName == appName)&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.version, version) || other.version == version)&&(identical(other.buildSignature, buildSignature) || other.buildSignature == buildSignature)&&(identical(other.installStore, installStore) || other.installStore == installStore)&&(identical(other.installTime, installTime) || other.installTime == installTime));
}


@override
int get hashCode => Object.hash(runtimeType,appName,packageName,version,buildSignature,installStore,installTime);

@override
String toString() {
  return 'AppInfo(appName: $appName, packageName: $packageName, version: $version, buildSignature: $buildSignature, installStore: $installStore, installTime: $installTime)';
}


}

/// @nodoc
abstract mixin class $AppInfoCopyWith<$Res>  {
  factory $AppInfoCopyWith(AppInfo value, $Res Function(AppInfo) _then) = _$AppInfoCopyWithImpl;
@useResult
$Res call({
 String appName, String packageName, Version version, String buildSignature, String? installStore, DateTime? installTime
});




}
/// @nodoc
class _$AppInfoCopyWithImpl<$Res>
    implements $AppInfoCopyWith<$Res> {
  _$AppInfoCopyWithImpl(this._self, this._then);

  final AppInfo _self;
  final $Res Function(AppInfo) _then;

/// Create a copy of AppInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? appName = null,Object? packageName = null,Object? version = null,Object? buildSignature = null,Object? installStore = freezed,Object? installTime = freezed,}) {
  return _then(_self.copyWith(
appName: null == appName ? _self.appName : appName // ignore: cast_nullable_to_non_nullable
as String,packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as Version,buildSignature: null == buildSignature ? _self.buildSignature : buildSignature // ignore: cast_nullable_to_non_nullable
as String,installStore: freezed == installStore ? _self.installStore : installStore // ignore: cast_nullable_to_non_nullable
as String?,installTime: freezed == installTime ? _self.installTime : installTime // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppInfo].
extension AppInfoPatterns on AppInfo {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppInfo() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppInfo value)  $default,){
final _that = this;
switch (_that) {
case _AppInfo():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppInfo value)?  $default,){
final _that = this;
switch (_that) {
case _AppInfo() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String appName,  String packageName,  Version version,  String buildSignature,  String? installStore,  DateTime? installTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppInfo() when $default != null:
return $default(_that.appName,_that.packageName,_that.version,_that.buildSignature,_that.installStore,_that.installTime);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String appName,  String packageName,  Version version,  String buildSignature,  String? installStore,  DateTime? installTime)  $default,) {final _that = this;
switch (_that) {
case _AppInfo():
return $default(_that.appName,_that.packageName,_that.version,_that.buildSignature,_that.installStore,_that.installTime);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String appName,  String packageName,  Version version,  String buildSignature,  String? installStore,  DateTime? installTime)?  $default,) {final _that = this;
switch (_that) {
case _AppInfo() when $default != null:
return $default(_that.appName,_that.packageName,_that.version,_that.buildSignature,_that.installStore,_that.installTime);case _:
  return null;

}
}

}

/// @nodoc


class _AppInfo implements AppInfo {
  const _AppInfo({required this.appName, required this.packageName, required this.version, required this.buildSignature, this.installStore, this.installTime});
  

/// The app name
@override final  String appName;
/// The package name
@override final  String packageName;
/// The package version
@override final  Version version;
/// The build signature.
///
/// SHA-256 signing key signature (hex) on Android.
/// Empty string on all the other platforms.
@override final  String buildSignature;
/// The installer store. Indicates through which store this application was installed.
@override final  String? installStore;
/// The time when the application was installed.
@override final  DateTime? installTime;

/// Create a copy of AppInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppInfoCopyWith<_AppInfo> get copyWith => __$AppInfoCopyWithImpl<_AppInfo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppInfo&&(identical(other.appName, appName) || other.appName == appName)&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.version, version) || other.version == version)&&(identical(other.buildSignature, buildSignature) || other.buildSignature == buildSignature)&&(identical(other.installStore, installStore) || other.installStore == installStore)&&(identical(other.installTime, installTime) || other.installTime == installTime));
}


@override
int get hashCode => Object.hash(runtimeType,appName,packageName,version,buildSignature,installStore,installTime);

@override
String toString() {
  return 'AppInfo(appName: $appName, packageName: $packageName, version: $version, buildSignature: $buildSignature, installStore: $installStore, installTime: $installTime)';
}


}

/// @nodoc
abstract mixin class _$AppInfoCopyWith<$Res> implements $AppInfoCopyWith<$Res> {
  factory _$AppInfoCopyWith(_AppInfo value, $Res Function(_AppInfo) _then) = __$AppInfoCopyWithImpl;
@override @useResult
$Res call({
 String appName, String packageName, Version version, String buildSignature, String? installStore, DateTime? installTime
});




}
/// @nodoc
class __$AppInfoCopyWithImpl<$Res>
    implements _$AppInfoCopyWith<$Res> {
  __$AppInfoCopyWithImpl(this._self, this._then);

  final _AppInfo _self;
  final $Res Function(_AppInfo) _then;

/// Create a copy of AppInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? appName = null,Object? packageName = null,Object? version = null,Object? buildSignature = null,Object? installStore = freezed,Object? installTime = freezed,}) {
  return _then(_AppInfo(
appName: null == appName ? _self.appName : appName // ignore: cast_nullable_to_non_nullable
as String,packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as Version,buildSignature: null == buildSignature ? _self.buildSignature : buildSignature // ignore: cast_nullable_to_non_nullable
as String,installStore: freezed == installStore ? _self.installStore : installStore // ignore: cast_nullable_to_non_nullable
as String?,installTime: freezed == installTime ? _self.installTime : installTime // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
