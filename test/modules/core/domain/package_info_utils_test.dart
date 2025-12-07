import 'package:flutter_test/flutter_test.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:retro_toy_station/modules/core/domain/package_info_utils.dart';

void main() {
  test('appInfoAdapter returns correct value', () {
    final packageInfo = PackageInfo(
      appName: 'Retro Toy Station',
      packageName: 'packageName',
      version: '1.0.1-thunk',
      buildNumber: '1',
      buildSignature: 'buildSignature',
      installerStore: 'Private Store',
      installTime: DateTime(2025, 12, 7, 20, 33),
    );

    final result = appInfoAdapter(packageInfo);

    expect(result.appName, equals('Retro Toy Station'));
    expect(result.packageName, equals('packageName'));
    expect(result.version, equals(Version.parse('1.0.1-thunk+1')));
    expect(result.buildSignature, equals('buildSignature'));
    expect(result.installStore, equals('Private Store'));
    expect(result.installTime, equals(DateTime(2025, 12, 7, 20, 33)));
  });

  test('getVersionString returns correct value', () {
    expect(getVersionString('1.0.1', ''), equals('1.0.1'));
    expect(getVersionString('1.0.1-thunk', ''), equals('1.0.1-thunk'));
    expect(getVersionString('1.0.1-thunk', '4'), equals('1.0.1-thunk+4'));
  });
}
