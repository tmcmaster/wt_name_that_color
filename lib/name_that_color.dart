import 'dart:math';

import 'color_names_map.dart';

class NameThatColor {
// Function to convert hex color to RGB.
  List<int> hexToRgb(String hex) {
    if (hex.startsWith('#')) {
      hex = hex.substring(1);
    }
    return [
      int.parse(hex.substring(0, 2), radix: 16),
      int.parse(hex.substring(2, 4), radix: 16),
      int.parse(hex.substring(4, 6), radix: 16),
    ];
  }

// Function to calculate the Euclidean distance between two colors.
  double colorDistance(List<int> rgb1, List<int> rgb2) {
    return sqrt(pow(rgb1[0] - rgb2[0], 2) + pow(rgb1[1] - rgb2[1], 2) + pow(rgb1[2] - rgb2[2], 2));
  }

  double colorDistance2(List<int> rgb1, List<int> rgb2) {
    int diffRed = rgb1[0] - rgb2[0];
    int diffGreen = rgb1[1] - rgb2[1];
    int diffBlue = rgb1[2] - rgb2[2];

    double pctDiffRed = diffRed / 255;
    double pctDiffGreen = diffGreen / 255;
    double pctDiffBlue = diffBlue / 255;

    return (pctDiffRed + pctDiffGreen + pctDiffBlue) / 3 * 100;
  }

  String findClosestColor(String inputHex) {
    return hexToSName(parseHex(inputHex));
  }

  String parseHex(String hexString) {
    String inputHex = hexString;
    if (inputHex.startsWith('#')) {
      inputHex = inputHex.substring(1);
    }
    return inputHex;
  }

  String hexToSName(String inputHex) {
    // Convert input hex color to RGB.
    List<int> inputRgb = hexToRgb(inputHex);

    String closestColorName = 'Unknown';
    double minDistance = double.infinity;

    // Iterate through the color map to find the closest color.
    ColorNames.map.forEach((hex, name) {
      List<int> colorRgb = hexToRgb(hex);
      double distance = colorDistance(inputRgb, colorRgb);

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

  final nameThatColor = NameThatColor();

  final inputHex = nameThatColor.parseHex(arguments[0]);
  final closestColorName = NameThatColor().findClosestColor(inputHex);

  print('Closest color name: $closestColorName');
}
