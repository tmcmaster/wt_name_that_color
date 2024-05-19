import 'dart:convert';
import 'dart:io';
import 'dart:math';

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

Future<void> main(List<String> arguments) async {
  if (arguments.isEmpty) {
    print('Please provide a hex color value.');
    return;
  }

  String inputHex = arguments[0];
  if (inputHex.startsWith('#')) {
    inputHex = inputHex.substring(1);
  }

  // Convert input hex color to RGB.
  List<int> inputRgb = hexToRgb(inputHex);

  // Read the color map from the JSON file.
  final file = File('name_that_colour.json');
  if (!file.existsSync()) {
    print('The file name_that_colour.json does not exist.');
    return;
  }

  final contents = await file.readAsString();
  final Map<String, dynamic> colorMapDynamic = json.decode(contents) as Map<String, dynamic>;
  final Map<String, String> colorMap =
      colorMapDynamic.map((key, value) => MapEntry(key, value as String));

  String closestColorName = 'Unknown';
  double minDistance = double.infinity;

  // Iterate through the color map to find the closest color.
  colorMap.forEach((hex, name) {
    List<int> colorRgb = hexToRgb(hex);
    double distance = colorDistance(inputRgb, colorRgb);

    if (distance < minDistance) {
      minDistance = distance;
      closestColorName = name;
    }
  });

  print('Closest color name: $closestColorName');
}
