import 'package:test/test.dart';
import 'package:wt_name_that_color/string_extension.dart';

void main() {
  group('StringExtension', () {
    test('capitalize', () {
      expect("aaa".capitalize(), equals("Aaa"));
      expect("Aaa".capitalize(), equals("Aaa"));
      expect("AAA".capitalize(), equals("Aaa"));
      expect("AAA ".capitalize(), equals("Aaa "));
      expect("AAA aaA".capitalize(), equals("Aaa aaa"));
      expect("".capitalize(), equals(""));
    });
    test('toCamelCase', () {
      expect("".toCamelCase(), equals(""));
      expect("Aaa".toCamelCase(), equals("aaa"));
      expect("Aaa ".toCamelCase(), equals("aaa"));
      expect("Aaa ".toCamelCase(), equals("aaa"));
      expect("Aaa bbb".toCamelCase(), equals("aaaBbb"));
      expect("Aaa     bbb".toCamelCase(), equals("aaaBbb"));
      expect("Aaa     bbb   ".toCamelCase(), equals("aaaBbb"));
      expect("Aaa Bbb Ccc".toCamelCase(), equals("aaaBbbCcc"));
    });
  });
}
