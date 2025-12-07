import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

import '../main.dart';
import '../modules/core/domain/package_info_repository.dart';

Future<void> runApplication() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kDebugMode) {
    //  Logger.root.level = Level.ALL; // defaults to Level.INFO
    Logger.root.onRecord.listen((record) {
      debugPrint('${record.level.name}: ${record.time}: ${record.loggerName}: ${record.message}');
    });
  }

  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  await PackageInfoRepository.init();

  runApp(const MyApp());
}
