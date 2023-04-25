import 'package:auto_size_text/auto_size_text.dart';
import 'package:fl_calculator/button_widgets.dart';
import 'package:flutter/material.dart';

//BASE EXPRESSION DISPLAY
class ExpressionDisplayContainer extends StatelessWidget {
  final String expr;
  const ExpressionDisplayContainer({required this.expr, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          padding: const EdgeInsets.fromLTRB(0, 0, 13, 10),
          alignment: Alignment.bottomRight,
          width: double.maxFinite,
          color: Colors.black12,
          child: AutoSizeText(
            expr,
            style: const TextStyle(fontSize: 35),
            maxLines: 5,
          )),
    );
  }
}

//BASE OPERATOR DISPLAY
class OperatorsDisplayContainer extends StatelessWidget {
  final Widget operatorButtons;
  const OperatorsDisplayContainer(this.operatorButtons, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        borderRadius:
            BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        color: Colors.black26,
      ),
      child: operatorButtons,
    );
  }
}

//DISPLAY OPERATOR BUTTON
class OperatorButtons extends StatelessWidget {
  const OperatorButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        OperatorButtonRowBuilder(0),
        OperatorButtonRowBuilder(1),
        OperatorButtonRowBuilder(2),
        OperatorButtonRowBuilder(3),
        OperatorButtonRowBuilder(4),
      ],
    );
  }
}
