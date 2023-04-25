import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../expression_providers.dart';
import '../theme_providers.dart';
import '../display_widgets.dart';

//BASE SCREEN
class CalculatorScreen extends ConsumerWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          DropdownButton(
              elevation: 0,
              value: ref.watch(themeProvider),
              items: const [
                DropdownMenuItem(value: 'DeepOrange', child: Text('DeepOrange')),
                DropdownMenuItem(value: 'Cyan', child: Text('Cyan')),
                DropdownMenuItem(value: 'Amber', child: Text('Amber')),
                DropdownMenuItem(value: 'Purple', child: Text('Purple')),
              ],
              onChanged: (String? value) {
                value = ref.read(themeProvider.notifier).update((state) => value!);
              }),
          DropdownButton(
              elevation: 0,
              value: ref.watch(themeBrightnessProvider),
              items: const [
                DropdownMenuItem(value: Brightness.light, child: Text('Light')),
                DropdownMenuItem(value: Brightness.dark, child: Text('Dark')),
              ],
              onChanged: (Brightness? value) {
                value = ref.read(themeBrightnessProvider.notifier).update((state) => value!);
              })
        ],
        title: const Text('CALCULATOR'),
        elevation: 0,
      ),
      body: Column(children: const [
        ExpressionDisplay(),
        OperatorsDisplay(),
      ]),
    );
  }
}

//DISPLAY FOR VIEWING MATH EXPRESSION AND EVALUATION
class ExpressionDisplay extends ConsumerWidget {
  const ExpressionDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String expr = ref.watch(mathExpressionProvider).expr;
    return ExpressionDisplayContainer(expr: expr);
  }
}

//DISPLAYING CALCULATOR BUTTON (INPUT)
class OperatorsDisplay extends ConsumerWidget {
  const OperatorsDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const OperatorsDisplayContainer(OperatorButtons());
  }
}
