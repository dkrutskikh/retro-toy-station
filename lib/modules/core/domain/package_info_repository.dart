import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'models/app_info.dart';
import 'package_info_utils.dart';

class PackageInfoRepository {
  static AppInfo? _packageInfo;

  AppInfo get info {
    assert(_packageInfo != null, '$PackageInfoRepository is not initialized');

    return _packageInfo!;
  }

  const PackageInfoRepository();

  static Future<void> init([@visibleForTesting AsyncValueGetter<AppInfo> getPackageInfo = _getAppInfoDefault]) async {
    _packageInfo = await getPackageInfo();
  }
}

Future<AppInfo> _getAppInfoDefault() async {
  final result = await PackageInfo.fromPlatform();

  return appInfoAdapter(result);
}
