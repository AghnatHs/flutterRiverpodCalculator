import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_expressions/math_expressions.dart';

final mathExpressionProvider =
    StateNotifierProvider<MathExpressionNotifier, MathExpression>((ref) {
  return MathExpressionNotifier();
});

@immutable
class MathExpression {
  final String expr;
  const MathExpression({required this.expr});

  MathExpression copyWith({String? expr}) {
    return MathExpression(expr: expr ?? this.expr);
  }
}

class MathExpressionNotifier extends StateNotifier<MathExpression> {
  MathExpressionNotifier() : super(const MathExpression(expr: ''));

  void inputOperator(String opr) {
    if (opr != 'C' && opr != '=' && opr != 'DEL') {
      String prevExpr = state.expr;
      //List<String> prevExprSplit = prevExpr.split('');
      state = opr == '('
          ? MathExpression(expr: '$prevExpr*$opr')
          : MathExpression(expr: '$prevExpr$opr');

    } else if (opr == 'C') {
      clearExpression();
    } else if (opr == '=') {
      evaluationExpression();
    } else if (opr == 'DEL') {
      deleteExpression();
    }
  }

  void clearExpression() {
    state = state.copyWith(expr: '');
  }

  void deleteExpression() {
    String prevExpr = state.expr;
    if (prevExpr.isNotEmpty) {
      List<String> prevExprSplit = prevExpr.split('');
      prevExprSplit.removeLast();
      prevExpr = prevExprSplit.join();

      state = state.copyWith(expr: prevExpr);
    }
  }

  void evaluationExpression() {
    if (state.expr.isNotEmpty) {
      Parser parser = Parser();
      Expression mathExpression = parser.parse(state.expr);
      ContextModel cm = ContextModel();
      String eval = mathExpression.simplify().evaluate(EvaluationType.REAL, cm).toString();

      state = state.copyWith(expr: eval);
    }
  }
}
