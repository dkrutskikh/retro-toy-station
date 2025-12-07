import 'package:flutter/foundation.dart';

import '../domain/app_platform.dart';

class AppPlatformService {
  final AppPlatform platform;
  final AppPlatform? pwaPlatform;

  AppPlatformService()
    : platform = kIsWeb ? AppPlatform.pwa : _currentPlatform(),
      pwaPlatform = kIsWeb ? _currentPlatform() : null;
}

AppPlatform _currentPlatform() => switch (defaultTargetPlatform) {
  TargetPlatform.android => AppPlatform.android,
  TargetPlatform.iOS => AppPlatform.iOS,
  TargetPlatform.linux => AppPlatform.linux,
  TargetPlatform.macOS => AppPlatform.macOS,
  TargetPlatform.windows => AppPlatform.windows,
  _ => throw Exception('$defaultTargetPlatform not supported'),
};
