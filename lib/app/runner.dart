import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

import '../main.dart';
import '../modules/app/hms_gms_availability/hms_gms_availability.dart';
import '../modules/core/domain/app_platform.dart';
import '../modules/core/domain/package_info_repository.dart';
import '../modules/core/environment/environment.dart';
import '../modules/core/environment/models/config.dart';
import '../modules/core/services/app_platform_service.dart';

Future<void> runApplication(Config config) async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kDebugMode) {
    //  Logger.root.level = Level.ALL; // defaults to Level.INFO
    Logger.root.onRecord.listen((record) {
      debugPrint('${record.level.name}: ${record.time}: ${record.loggerName}: ${record.message}');
    });
  }

  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  await PackageInfoRepository.init();

  final platform = AppPlatformService().platform;

  await _initAppConfig(platform, config);

  final hmsGmsAvailability = HmsGmsAvailability();
  await hmsGmsAvailability.init(platform);

  runApp(const MyApp());
}

Future<void> _initAppConfig(AppPlatform platform, Config config) async {
  Environment.init(config: config);

  final restoredConfig = await Environment.instance().restoreConfig();

  // Update the config to correctly determine environment-dependent things based on Config.host.
  Environment.instance().config = restoredConfig;
}
