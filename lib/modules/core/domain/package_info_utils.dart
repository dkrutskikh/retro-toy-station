import 'package:package_info_plus/package_info_plus.dart';
import 'package:pub_semver/pub_semver.dart';

import 'models/app_info.dart';

AppInfo appInfoAdapter(PackageInfo packageInfo) => AppInfo(
  appName: packageInfo.appName,
  packageName: packageInfo.packageName,
  version: Version.parse(getVersionString(packageInfo.version, packageInfo.buildNumber)),
  buildSignature: packageInfo.buildSignature,
  installStore: packageInfo.installerStore,
  installTime: packageInfo.installTime,
);

String getVersionString(String version, String buildNumber) {
  var result = version;
  if (buildNumber.isNotEmpty) {
    result += '+$buildNumber';
  }

  return result;
}
