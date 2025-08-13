import 'dart:math' show Random;
import 'dart:ui';

final class HelperFunctions {
  static Color generateLightRandomColor() {
    final Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(36) + 220,
      random.nextInt(36) + 220,
      random.nextInt(36) + 220,
    );
  }
}
