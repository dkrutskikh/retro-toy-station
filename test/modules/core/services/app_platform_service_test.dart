import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:retro_toy_station/modules/core/domain/app_platform.dart';
import 'package:retro_toy_station/modules/core/services/app_platform_service.dart';

void main() {
  group('$AppPlatformService', () {
    test('constructs with real target platform', () {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      expect(AppPlatformService().platform, equals(AppPlatform.android));

      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      expect(AppPlatformService().platform, equals(AppPlatform.iOS));

      debugDefaultTargetPlatformOverride = TargetPlatform.linux;
      expect(AppPlatformService().platform, equals(AppPlatform.linux));

      debugDefaultTargetPlatformOverride = TargetPlatform.macOS;
      expect(AppPlatformService().platform, equals(AppPlatform.macOS));

      debugDefaultTargetPlatformOverride = TargetPlatform.windows;
      expect(AppPlatformService().platform, equals(AppPlatform.windows));
    });

    test('throws on unsupported platforms', () {
      debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
      expect(() => AppPlatformService().platform, throwsA(isA<Exception>()));
    });
  });
}
