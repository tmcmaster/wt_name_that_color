import 'package:wt_name_that_color/color_difference.dart';

import 'color_names_map.dart';

class NameThatColor {
  String findClosestColor(String inputHex) {
    String closestColorName = 'Unknown';
    double minDistance = double.infinity;

    // Iterate through the color map to find the closest color.
    ColorNames.map.forEach((hex, name) {
      double distance = ColorDifference.compare(inputHex, hex);
      if (distance < minDistance) {
        minDistance = distance;
        closestColorName = name;
      }
    });

    return closestColorName;
  }
}

Future<void> main(List<String> arguments) async {
  if (arguments.isEmpty) {
    print('Please provide a hex color value.');
    return;
  }
  final closestColorName = NameThatColor().findClosestColor(arguments[0]);

  print('Closest color name: $closestColorName');
}
