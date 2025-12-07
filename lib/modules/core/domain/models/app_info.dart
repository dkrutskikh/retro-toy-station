import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pub_semver/pub_semver.dart';

part 'app_info.freezed.dart';

@freezed
abstract class AppInfo with _$AppInfo {
  const factory AppInfo({
    /// The app name
    required String appName,

    /// The package name
    required String packageName,

    /// The package version
    required Version version,

    /// The build signature.
    ///
    /// SHA-256 signing key signature (hex) on Android.
    /// Empty string on all the other platforms.
    required String buildSignature,

    /// The installer store. Indicates through which store this application was installed.
    String? installStore,

    /// The time when the application was installed.
    DateTime? installTime,
  }) = _AppInfo;
}
