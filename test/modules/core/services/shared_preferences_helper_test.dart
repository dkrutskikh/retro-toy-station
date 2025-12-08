import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:retro_toy_station/modules/core/services/shared_preferences_helper.dart';

import '../../../mocks/shared_preferences_async_mock.dart';

void main() {
  group('$SharedPreferencesHelper', () {
    late SharedPreferencesAsyncMock sharedPreferencesAsyncMock;

    setUp(() {
      sharedPreferencesAsyncMock = SharedPreferencesAsyncMock();
    });

    test('read returns stored data if match types otherwise default value', () async {
      when(() => sharedPreferencesAsyncMock.getBool(any())).thenAnswer((_) async => null);
      when(() => sharedPreferencesAsyncMock.getInt(any())).thenAnswer((_) async => null);
      when(() => sharedPreferencesAsyncMock.getDouble(any())).thenAnswer((_) async => null);
      when(() => sharedPreferencesAsyncMock.getString(any())).thenAnswer((_) async => null);
      when(() => sharedPreferencesAsyncMock.getStringList(any())).thenAnswer((_) async => null);

      when(() => sharedPreferencesAsyncMock.getBool('test_bool_key')).thenAnswer((_) async => true);
      when(() => sharedPreferencesAsyncMock.getInt('test_int_key')).thenAnswer((_) async => 2);
      when(() => sharedPreferencesAsyncMock.getDouble('test_double_key')).thenAnswer((_) async => 3.0);
      when(() => sharedPreferencesAsyncMock.getString('test_string_key')).thenAnswer((_) async => '1');
      when(() => sharedPreferencesAsyncMock.getStringList('test_string_list_key')).thenAnswer((_) async => ['4', '5']);

      final helper = SharedPreferencesHelper(sharedPreferencesAsyncMock);

      expect(await helper.read<bool>('test_bool_key'), isTrue);
      expect(await helper.read<bool>('test_int_key'), isNull);
      expect(await helper.read<bool>('test_double_key'), isNull);
      expect(await helper.read<bool>('test_string_key'), isNull);
      expect(await helper.read<bool>('test_string_list_key'), isNull);

      expect(await helper.read<int>('test_bool_key'), isNull);
      expect(await helper.read<int>('test_int_key'), equals(2));
      expect(await helper.read<int>('test_double_key'), isNull);
      expect(await helper.read<int>('test_string_key'), isNull);
      expect(await helper.read<int>('test_string_list_key'), isNull);

      expect(await helper.read<double>('test_bool_key'), isNull);
      expect(await helper.read<double>('test_int_key'), isNull);
      expect(await helper.read<double>('test_double_key'), equals(3.0));
      expect(await helper.read<double>('test_string_key'), isNull);
      expect(await helper.read<double>('test_string_list_key'), isNull);

      expect(await helper.read<String>('test_bool_key'), isNull);
      expect(await helper.read<String>('test_int_key'), isNull);
      expect(await helper.read<String>('test_double_key'), isNull);
      expect(await helper.read<String>('test_string_key'), equals('1'));
      expect(await helper.read<String>('test_string_list_key'), isNull);

      expect(await helper.read<List<String>>('test_bool_key'), isNull);
      expect(await helper.read<List<String>>('test_int_key'), isNull);
      expect(await helper.read<List<String>>('test_double_key'), isNull);
      expect(await helper.read<List<String>>('test_string_key'), isNull);
      expect(await helper.read<List<String>>('test_string_list_key'), equals(['4', '5']));

      expect(() async => helper.read<Set<String>>('test_string_set_key'), throwsA(isA<Exception>()));
    });

    group('write calls', () {
      test('setBool for stored bool data', () async {
        when(() => sharedPreferencesAsyncMock.setBool(any(), any())).thenAnswer((_) async {});

        await SharedPreferencesHelper(sharedPreferencesAsyncMock).write(key: 'test_bool', value: true);

        verify(() => sharedPreferencesAsyncMock.setBool('test_bool', true)).called(1);
      });

      test('setInt for stored int data', () async {
        when(() => sharedPreferencesAsyncMock.setInt(any(), any())).thenAnswer((_) async {});

        await SharedPreferencesHelper(sharedPreferencesAsyncMock).write(key: 'test_int', value: 1);

        verify(() => sharedPreferencesAsyncMock.setInt('test_int', 1)).called(1);
      });

      test('setDouble for stored double data', () async {
        when(() => sharedPreferencesAsyncMock.setDouble(any(), any())).thenAnswer((_) async {});

        await SharedPreferencesHelper(sharedPreferencesAsyncMock).write(key: 'test_double', value: 2.0);

        verify(() => sharedPreferencesAsyncMock.setDouble('test_double', 2.0)).called(1);
      });

      test('setString for stored string data', () async {
        when(() => sharedPreferencesAsyncMock.setString(any(), any())).thenAnswer((_) async {});

        await SharedPreferencesHelper(sharedPreferencesAsyncMock).write(key: 'test_string', value: 'text');

        verify(() => sharedPreferencesAsyncMock.setString('test_string', 'text')).called(1);
      });

      test('setStringList for stored string list data', () async {
        when(() => sharedPreferencesAsyncMock.setStringList(any(), any())).thenAnswer((_) async {});

        await SharedPreferencesHelper(sharedPreferencesAsyncMock).write(key: 'test_string_list', value: ['text']);

        verify(() => sharedPreferencesAsyncMock.setStringList('test_string_list', ['text'])).called(1);
      });

      test('throws for stored unsupported type data', () async {
        expect(
          () => SharedPreferencesHelper(sharedPreferencesAsyncMock).write(key: 'test_string_set', value: {'text'}),
          throwsA(isA<Exception>()),
        );
      });
    });

    test('delete calls remove for passed key', () async {
      when(() => sharedPreferencesAsyncMock.remove(any())).thenAnswer((_) async => {});

      await SharedPreferencesHelper(sharedPreferencesAsyncMock).delete('test_key');

      verify(() => sharedPreferencesAsyncMock.remove('test_key')).called(1);
    });

    test('allKeys returns all stored records keys', () async {
      when(
        () => sharedPreferencesAsyncMock.getKeys(),
      ).thenAnswer((_) async => {'test_string_key', 'test_int_key', 'test_double_key'});

      final helper = SharedPreferencesHelper(sharedPreferencesAsyncMock);

      expect(await helper.allKeys(), equals(['test_string_key', 'test_int_key', 'test_double_key']));
    });

    test('deleteAll removes all data', () async {
      when(() => sharedPreferencesAsyncMock.clear()).thenAnswer((_) async => {});

      await SharedPreferencesHelper(sharedPreferencesAsyncMock).deleteAll();

      verify(sharedPreferencesAsyncMock.clear).called(1);
    });

    test('containsKey returns true if preferences have record with required key', () async {
      when(() => sharedPreferencesAsyncMock.containsKey(any())).thenAnswer((_) async => false);
      when(() => sharedPreferencesAsyncMock.containsKey('test_string_key')).thenAnswer((_) async => true);

      final helper = SharedPreferencesHelper(sharedPreferencesAsyncMock);

      expect(await helper.containsKey('test_string_key'), isTrue);
      expect(await helper.containsKey(''), isFalse);
    });
  });
}
