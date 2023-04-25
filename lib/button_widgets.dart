import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'expression_providers.dart';

class OperatorButton extends ConsumerWidget {
  final Color? buttonBgColor;
  final Color? buttonTextColor;
  const OperatorButton(
      {this.buttonBgColor = Colors.black45,
      this.buttonTextColor = Colors.white,
      required this.value,
      Key? key})
      : super(key: key);
  const OperatorButton.accent(
      {this.buttonBgColor,this.buttonTextColor = Colors.white, required this.value, Key? key})
      : super(key: key);
  const OperatorButton.accentDark(
      {this.buttonBgColor,
      this.buttonTextColor,
      required this.value,
      Key? key})
      : super(key: key);
  final String value;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    onPressed() => ref.read(mathExpressionProvider.notifier).inputOperator(value);
    return Expanded(
        child: Container(
            padding: const EdgeInsets.all(3.5),
            //MAIN BUTTON
            child: SizedBox(
                height: double.maxFinite,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonBgColor,
                    ),
                    onPressed: () {
                      onPressed();
                    },
                    child: AutoSizeText(
                      value,
                      maxLines: 1,
                      style: TextStyle(fontSize: 35, color: buttonTextColor),
                    )))));
  }
}

//BUILDER
class OperatorButtonRowBuilder extends ConsumerWidget {
  static const List<List<String>> operators = [
    [
      'C',
      'DEL',
      '(',
      ')',
    ],
    [
      '7',
      '8',
      '9',
      '/',
    ],
    [
      '4',
      '5',
      '6',
      '*',
    ],
    [
      '1',
      '2',
      '3',
      '+',
    ],
    ['.', '0', '=', '-']
  ];
  final int rowIndex;
  const OperatorButtonRowBuilder(this.rowIndex, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 85,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(4, (index) {
          var value = operators[rowIndex][index];
          if (value == 'C' || value == 'DEL') {
            return OperatorButton.accent(value: value);
          } else if (value == '=') {
            return OperatorButton.accentDark(value: value);
          } else {
            return OperatorButton(
              value: value,
            );
          }
        }),
      ),
    );
  }
}
