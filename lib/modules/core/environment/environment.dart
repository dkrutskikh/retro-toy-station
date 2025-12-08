import 'package:flutter/foundation.dart';

import '../services/shared_preferences_helper.dart';
import 'models/config.dart';

const _proxyKey = 'PROXY_KEY';
const _accessibilityKey = 'ACCESSIBILITY_KEY';

class Environment implements Listenable {
  static Environment? _instance;

  final ValueNotifier<Config> _config;
  final SharedPreferencesHelper _sharedPreferencesHelper;
  final _listeners = <VoidCallback>[];

  Config get config => _config.value;

  set config(Config c) {
    _config.value = c;
  }

  Environment._inst({required Config config, @visibleForTesting SharedPreferencesHelper? sharedHelper})
    : _config = ValueNotifier(config),
      _sharedPreferencesHelper = sharedHelper ?? SharedPreferencesHelper();

  @override
  void addListener(VoidCallback listener) {
    _listeners.add(listener);

    _config.addListener(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    _config.removeListener(listener);

    _listeners.remove(listener);
  }

  static Environment instance() {
    final instance = _instance;
    if (instance != null) {
      return instance;
    }

    throw Exception('Environment not initialized.');
  }

  static void init({required Config config, @visibleForTesting SharedPreferencesHelper? sharedPreferencesHelper}) {
    _instance = Environment._inst(
      config: config.copyWith.debugOptions(debugShowCheckedModeBanner: kDebugMode, showAccessibilityTools: kDebugMode),
      sharedHelper: sharedPreferencesHelper,
    );
  }

  Future<Config> restoreConfig() async {
    final proxy = _sharedPreferencesHelper
        .read<String>(_proxyKey)
        .then(
          (value) => value != null && value.isNotEmpty ? config = config.copyWith.debugOptions(proxyUrl: value) : null,
        );

    final accessibility = _sharedPreferencesHelper
        .read<bool>(_accessibilityKey)
        .then((value) => config = config.copyWith.debugOptions(showAccessibilityTools: value ?? false));

    await Future.wait([proxy, accessibility]);

    return _config.value;
  }

  Future<void> saveConfig() => Future.wait<void>([
    _sharedPreferencesHelper.write(key: _proxyKey, value: config.debugOptions.proxyUrl ?? ''),
    _sharedPreferencesHelper.write(key: _accessibilityKey, value: config.debugOptions.showAccessibilityTools),
  ]);
}
