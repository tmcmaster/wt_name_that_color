import 'package:collection/collection.dart';

extension StringExtensions on String {
  String capitalize() =>
      this.isEmpty ? this : '${this[0].toUpperCase()}${this.substring(1).toLowerCase()}';

  String toCamelCase() => this.split(RegExp(r'\s+')).mapIndexed(
        (i, p) {
          return i == 0 ? p.toLowerCase() : p.capitalize();
        },
      ).join('');
}
