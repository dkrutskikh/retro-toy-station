import '../../core/domain/app_platform.dart';
import 'hms_gms_availability.dart';

HmsGmsAvailability makeHmsGmsAvailability() => const HmsGmsAvailabilityWeb();

/// {@macro HmsGmsAvailability}
class HmsGmsAvailabilityWeb implements HmsGmsAvailability {
  @override
  bool get isGmsAvailable => false;

  /// {@macro HmsGmsAvailability}
  const HmsGmsAvailabilityWeb();

  @override
  Future<void> init(AppPlatform platform) async {}
}
