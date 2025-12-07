import 'package:flutter_test/flutter_test.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:retro_toy_station/modules/core/domain/models/app_info.dart';
import 'package:retro_toy_station/modules/core/domain/package_info_repository.dart';

void main() {
  group('$PackageInfoRepository', () {
    test('throws exception when repository is not initialized', () {
      const repo = PackageInfoRepository();

      expect(() => repo.info, throwsA(const TypeMatcher<AssertionError>()));
    });

    test('initializes', () async {
      var count = 0;

      Future<AppInfo> getInfo() async {
        count++;

        return _infoStub;
      }

      expect(count, isZero);
      await PackageInfoRepository.init(getInfo);
      expect(const PackageInfoRepository().info, isNotNull);
      expect(count, equals(1));
    });
  });
}

final _infoStub = AppInfo(
  appName: 'appName',
  packageName: 'packageName',
  version: Version(1, 0, 1),
  buildSignature: 'buildSignature',
  installStore: 'installStore',
  installTime: DateTime(2025, 12, 7, 20, 33),
);
