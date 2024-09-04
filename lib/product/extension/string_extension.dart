// ignore_for_file: no_leading_underscores_for_local_identifiers

extension ColorStringExtension on String? {
  int get colorValue {
    var _newColor = this?.replaceFirst('#', '0xff') ?? '';
    return int.tryParse(_newColor) ?? 0;
  }
}
