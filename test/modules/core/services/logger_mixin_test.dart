import 'package:flutter_test/flutter_test.dart';
import 'package:retro_toy_station/modules/core/services/logger_mixin.dart';

class _TestClass with LoggerMixin {}

void main() {
  test('LoggerMixin returns logger with name as class type', () {
    final testObject = _TestClass();

    expect(testObject.logger.name, equals('_TestClass'));
  });
}
