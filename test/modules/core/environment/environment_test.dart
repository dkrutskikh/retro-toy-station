import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:retro_toy_station/modules/core/environment/environment.dart';
import 'package:retro_toy_station/modules/core/environment/models/config.dart';
import 'package:retro_toy_station/modules/core/environment/models/debug_options.dart';

import '../../../mocks/shared_preferences_helper_mock.dart';

void main() {
  group('$Environment', () {
    late SharedPreferencesHelperMock sharedPreferencesHelperMock;

    setUp(() {
      sharedPreferencesHelperMock = SharedPreferencesHelperMock();
    });

    test('instance throws exception for before initialization calls', () {
      expect(Environment.instance, throwsException);

      Environment.init(config: _configStub, sharedPreferencesHelper: sharedPreferencesHelperMock);

      expect(Environment.instance(), isNotNull);

      expect(Environment.instance().config.debugOptions.debugShowCheckedModeBanner, isTrue);
      expect(Environment.instance().config.debugOptions.showAccessibilityTools, isTrue);
    });

    test('calls listeners after config change', () {
      var configChangesCount = 0;

      void countIncrementor() => ++configChangesCount;

      Environment.init(config: _configStub, sharedPreferencesHelper: sharedPreferencesHelperMock);

      expect(Environment.instance().config.debugOptions.debugShowCheckedModeBanner, isTrue);
      expect(Environment.instance().config.debugOptions.showAccessibilityTools, isTrue);

      Environment.instance().config = _configStub.copyWith.debugOptions(timeDilation: 4);

      Environment.instance().addListener(countIncrementor);

      Environment.instance().config = _configStub.copyWith.debugOptions(timeDilation: 5);

      Environment.instance().config = _configStub.copyWith.debugOptions(timeDilation: 6);

      Environment.instance().removeListener(countIncrementor);

      Environment.instance().config = _configStub.copyWith.debugOptions(timeDilation: 7);

      expect(configChangesCount, equals(2));
    });

    test('saveConfig serializes all data in shared preferences', () async {
      Environment.init(
        config: _configStub.copyWith(debugOptions: const DebugOptions(proxyUrl: 'proxy')),
        sharedPreferencesHelper: sharedPreferencesHelperMock,
      );

      when(
        () => sharedPreferencesHelperMock.write(
          key: any(named: 'key'),
          value: any(named: 'value'),
        ),
      ).thenAnswer((_) async => {});

      await Environment.instance().saveConfig();

      verify(() => sharedPreferencesHelperMock.write(key: 'PROXY_KEY', value: 'proxy')).called(1);
      verify(() => sharedPreferencesHelperMock.write(key: 'ACCESSIBILITY_KEY', value: true)).called(1);
    });

    test('restoreConfig deserializes all data from shared preferences', () async {
      Environment.init(config: _configStub, sharedPreferencesHelper: sharedPreferencesHelperMock);

      expect(Environment.instance().config.debugOptions.proxyUrl, isNull);

      when(() => sharedPreferencesHelperMock.read<String>('PROXY_KEY')).thenAnswer((_) async => 'restoredProxyUrl');
      when(() => sharedPreferencesHelperMock.read<bool>('ACCESSIBILITY_KEY')).thenAnswer((_) async => false);

      await Environment.instance().restoreConfig();

      expect(Environment.instance().config.debugOptions.proxyUrl, equals('restoredProxyUrl'));
      expect(Environment.instance().config.debugOptions.showAccessibilityTools, isFalse);
    });
  });
}

const _configStub = Config();
