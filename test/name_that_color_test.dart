import 'package:test/test.dart';
import 'package:wt_name_that_color/color_names_map.dart';
import 'package:wt_name_that_color/name_that_color.dart';

void main() {
  group('NameThatColor', () {
    final nameThatColor = NameThatColor(ColorNames.map);

    test('SmokeTest', () {
      expect(nameThatColor.findClosestColor('#FFFFFF'), equals('White'));
      expect(nameThatColor.findClosestColor('#456664'), equals('Deep Space Sparkle'));
    });

    test('Test Known', () {
      expect(nameThatColor.findClosestColor('#456664'), equals('Deep Space Sparkle'));
      expect(nameThatColor.findClosestColor('#FFFFFF'), equals('White'));
      expect(nameThatColor.findClosestColor('#000000'), equals('Black'));
      expect(nameThatColor.findClosestColor('#008696'), equals('Dark Cyan'));
      expect(nameThatColor.findClosestColor('#232323'), equals('Raisin Black'));
      expect(nameThatColor.findClosestColor('#24F129'), equals('Neon Green'));
    });
  });
}
