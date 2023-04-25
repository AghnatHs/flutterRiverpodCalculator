import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = StateProvider<String>((ref) => 'DeepOrange');
final themeBrightnessProvider = StateProvider<Brightness>((ref) => Brightness.light);

final themeImplementProvider = Provider<MaterialColor>((ref) {
  final theme = ref.watch(themeProvider);
  switch (theme) {
    case 'DeepOrange':
      return Colors.deepOrange;
    case 'Cyan':
      return Colors.cyan;
    case 'Amber':
      return Colors.amber;
    case 'Purple':
      return Colors.purple;
    default:
      return Colors.blueGrey;
  }
});
