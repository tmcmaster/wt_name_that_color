import 'package:test/test.dart';
import 'package:wt_name_that_color/color_difference.dart';

void main() {
  group('Color Difference', () {
    test('hexToRgb', () {
      expect(ColorDifference.hexToRgb('#000000'), equals([0, 0, 0]));
      expect(ColorDifference.hexToRgb('#FFFFFF'), equals([255, 255, 255]));
      expect(ColorDifference.hexToRgb('#00FF00'), equals([0, 255, 0]));
    });
    test('percentageDifference', () {
      expect(ColorDifference.percentageDifference(1, 2), equals(1 / 256));
      expect(ColorDifference.percentageDifference(1, 4), equals(3 / 256));
      expect(ColorDifference.percentageDifference(0, 255), equals(255 / 256));
    });
    test('averagePercentage', () {
      expect(ColorDifference.compare('#000000', '#000000'), equals(0.0));
      expect(ColorDifference.compare('#FFFFFF', '#000000'), equals(255 / 256 * 100));
      expect(ColorDifference.compare('#FFFFFF', '#7F7F7F'), equals(50.0));
    });
  });
}
