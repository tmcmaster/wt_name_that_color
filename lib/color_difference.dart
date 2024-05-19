import 'dart:math';

mixin ColorDifference {
  static double pythagorus(List<int> rgb1, List<int> rgb2) {
    return sqrt(pow(rgb1[0] - rgb2[0], 2) + pow(rgb1[1] - rgb2[1], 2) + pow(rgb1[2] - rgb2[2], 2));
  }

  static double percentageDifference(int int1, int int2) {
    return (int1 - int2).abs() / 256;
  }

  static double averagePercentage(List<int> rgb1, List<int> rgb2) {
    int diffRed = (rgb1[0] - rgb2[0]).abs();
    int diffGreen = (rgb1[1] - rgb2[1]).abs();
    int diffBlue = (rgb1[2] - rgb2[2]).abs();

    double pctDiffRed = diffRed / 256;
    double pctDiffGreen = diffGreen / 256;
    double pctDiffBlue = diffBlue / 256;

    return (pctDiffRed + pctDiffGreen + pctDiffBlue) / 3 * 100;
  }

  static List<int> hexToRgb(String hexString) {
    final hexNumberString = hexString.startsWith('#') ? hexString.substring(1) : hexString;
    return [
      int.parse(hexNumberString.substring(0, 2), radix: 16),
      int.parse(hexNumberString.substring(2, 4), radix: 16),
      int.parse(hexNumberString.substring(4, 6), radix: 16),
    ];
  }

  static double compare(String hex1, hex2) {
    final colorInts1 = hexToRgb(hex1);
    final colorInts2 = hexToRgb(hex2);
    return averagePercentage(colorInts1, colorInts2);
  }
}
