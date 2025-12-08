import 'package:google_api_availability/google_api_availability.dart';

import '../../core/domain/app_platform.dart';
import '../../core/services/logger_mixin.dart';
import 'hms_gms_availability.dart';

HmsGmsAvailability makeHmsGmsAvailability() => HmsGmsAvailabilityIO();

/// {@macro HmsGmsAvailability}
///
/// On Android OS, checks the availability of Google Mobile Services.
/// On other platforms, assumes that GMS is not available.
class HmsGmsAvailabilityIO with LoggerMixin implements HmsGmsAvailability {
  @override
  bool get isGmsAvailable => _isGmsAvailable;

  var _isGmsAvailable = false;

  /// {@macro HmsGmsAvailability}
  HmsGmsAvailabilityIO();

  @override
  Future<void> init(AppPlatform platform) async {
    if (platform != AppPlatform.android) return;

    try {
      // Check the availability of GMS on the device.
      final gmsAvailability = await GoogleApiAvailability.instance.checkGooglePlayServicesAvailability();

      _isGmsAvailable = gmsAvailability == GooglePlayServicesAvailability.success;

      // To check the availability of HMS, you can use the package https://pub.dev/packages/huawei_hmsavailability
    } on Object catch (error, stackTrace) {
      logger.warning('Failed to check HMS/GMS availability', error, stackTrace);
    }
  }
}
