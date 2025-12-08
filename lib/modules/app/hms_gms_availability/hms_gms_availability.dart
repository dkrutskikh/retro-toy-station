import '../../core/domain/app_platform.dart';
import 'hms_gms_availability_io.dart' if (dart.library.js_interop) 'hms_gms_availability_web.dart';

/// {@template HmsGmsAvailability}
/// Checks the availability of HMS and GMS services.
/// {@endtemplate}
abstract interface class HmsGmsAvailability {
  bool get isGmsAvailable;

  /// {@macro HmsGmsAvailability}
  factory HmsGmsAvailability() => makeHmsGmsAvailability();

  Future<void> init(AppPlatform platform);
}
