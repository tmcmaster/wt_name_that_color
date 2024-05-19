import 'package:collection/collection.dart';
import 'package:wt_name_that_color/color_difference.dart';
import 'package:wt_name_that_color/string_extension.dart';

class ColorListGenerator {
  static void printColorDefinitions(Map<String, String> colorNamesMap) {
    final result = colorNamesMap.entries
        .toList()
        .sorted(
          (a, b) => colorComparator(a.key, b.key),
        )
        .map(
      (e) {
        final name = e.value.toCamelCase();
        final hex = '0xFF${e.key.substring(1)}';
        return 'static const $name = Color($hex);';
      },
    ).join('\n');
    print(result);
  }

  static int colorComparator(String color1, String color2) {
    int avgDist1 = (ColorDifference.compare('#000000', color1) * 1000).toInt();
    int avgDist2 = (ColorDifference.compare('#000000', color2) * 1000).toInt();
    return avgDist1 - avgDist2;
  }
}
