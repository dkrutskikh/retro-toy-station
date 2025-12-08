import 'package:logging/logging.dart';

/// Creates a [Logger]. The name is determined by the class it is mixed into.
mixin LoggerMixin {
  Logger get logger => Logger(runtimeType.toString());
}
