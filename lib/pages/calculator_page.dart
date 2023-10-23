import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:calculator/widgets/button.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _historialValue = '';
  String _expressionValue = '';

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: const Color(0xff283637),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: _keyboard(),
          ),
        ),
      ),
    );
  }

  Widget _historial() {
    return Container(
      alignment: const Alignment(1.0, 1.0),
      padding: const EdgeInsets.only(right: 12.0),
      child: Text(
        _historialValue,
        style: GoogleFonts.rubik(
          textStyle: const TextStyle(
            fontSize: 24.0,
            color: Color(0xff545f61),
          ),
        ),
      ),
    );
  }

  Widget _expression() {
    return Container(
      alignment: const Alignment(1.0, 1.0),
      padding: const EdgeInsets.all(12.0),
      child: Text(
        _expressionValue,
        style: GoogleFonts.rubik(
          textStyle: const TextStyle(
            fontSize: 48.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _row(List<Button> buttons) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[...buttons],
    );
  }

  List<Widget> _keyboard() {
    return <Widget>[
      _historial(),
      _expression(),
      // AC, C, (, )
      _row(
        [
          Button(
            callback: _allClear,
            textContent: 'AC',
            bgColor: Colors.green,
          ),
          Button(
            callback: _clear,
            textContent: 'C',
            bgColor: Colors.red,
          ),
          Button(
            callback: _appendValue,
            textContent: '(',
            bgColor: Colors.orange,
          ),
          Button(
            callback: _appendValue,
            textContent: ')',
            bgColor: Colors.orange,
          ),
        ],
      ),
      // 7, 8, 9, *
      _row(
        [
          Button(
            callback: _appendValue,
            textContent: '7',
          ),
          Button(
            callback: _appendValue,
            textContent: '8',
          ),
          Button(
            callback: _appendValue,
            textContent: '9',
          ),
          Button(
            callback: _appendValue,
            textContent: '*',
            bgColor: Colors.orange,
          ),
        ],
      ),
      // 4, 5, 6, /
      _row(
        [
          Button(
            callback: _appendValue,
            textContent: '4',
          ),
          Button(
            callback: _appendValue,
            textContent: '5',
          ),
          Button(
            callback: _appendValue,
            textContent: '6',
          ),
          Button(
            callback: _appendValue,
            textContent: '/',
            bgColor: Colors.orange,
          ),
        ],
      ),
      // 1, 2, 3, +
      _row(
        [
          Button(
            callback: _appendValue,
            textContent: '1',
          ),
          Button(
            callback: _appendValue,
            textContent: '2',
          ),
          Button(
            callback: _appendValue,
            textContent: '3',
          ),
          Button(
            callback: _appendValue,
            textContent: '+',
            bgColor: Colors.orange,
          ),
        ],
      ),
      // ., 0, =, -
      _row(
        [
          Button(
            callback: _appendValue,
            textContent: '.',
            bgColor: Colors.orange,
          ),
          Button(
            callback: _appendValue,
            textContent: '0',
          ),
          Button(
            callback: _evaluate,
            textContent: '=',
            bgColor: Colors.blue,
          ),
          Button(
            callback: _appendValue,
            textContent: '-',
            bgColor: Colors.orange,
          ),
        ],
      ),
    ];
  }

  void _allClear(String? _) {
    setState(() {
      _historialValue = '';
      _expressionValue = '';
    });
  }

  void _clear(String? _) {
    setState(() {
      _expressionValue = '';
    });
  }

  void _evaluate(String? _) {
    try {
      Parser parser = Parser();
      Expression expression = parser.parse(_expressionValue);
      ContextModel contextModel = ContextModel();
      setState(() {
        _historialValue = _expressionValue;
        _expressionValue = expression
            .evaluate(
              EvaluationType.REAL,
              contextModel,
            )
            .toString();
      });
    } catch (e) {
      _allClear(null);
    }
  }

  void _appendValue(String value) {
    setState(() {
      // RegExp numRegExp = RegExp('\\d\$');
      // RegExp symRegExp = RegExp('\\D\$');

      // bool valEndsWithNumber = numRegExp.hasMatch(value);
      // print('Val ends with number: $valEndsWithNumber');
      // bool valEndsWithSymbol = symRegExp.hasMatch(value);
      // print('Val ends with symbol: $valEndsWithSymbol');

      // bool expEndsWithNumber = numRegExp.hasMatch(_expressionValue);
      // print('Exp ends with number: $expEndsWithNumber');
      // bool expEndsWithSymbol = symRegExp.hasMatch(_expressionValue);
      // print('Exp ends with symbol: $expEndsWithSymbol');

      _expressionValue += value;
    });
  }
}
