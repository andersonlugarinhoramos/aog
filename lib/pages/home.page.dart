import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';

import '../widgets/logo.widget.dart';
import '../widgets/submit-form.widget.dart';
import '../widgets/success.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _gasCtrl = MoneyMaskedTextController();
  final _alcCtrl = MoneyMaskedTextController();
  var _loading = false;
  var _completed = false;
  var _resultText = '';
  Color _color = Colors.deepPurple;

  @override
  void initState() {
    _gasCtrl.text = '0,00';
    _alcCtrl.text = '0,00';
    super.initState();
  }

  @override
  void dispose() {
    _gasCtrl.dispose();
    _alcCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: AnimatedContainer(
          duration: const Duration(milliseconds: 1200),
          color: _color,
          child: ListView(
            children: <Widget>[
              const LogoWidget(),
              _completed
                  ? SuccessWidget(
                      label: _resultText,
                      onPressed: reset,
                    )
                  : SubmitFormWidget(
                      alcCtrl: _alcCtrl,
                      gasCtrl: _gasCtrl,
                      onPressed: calculate,
                      loading: _loading,
                    ),
            ],
          ),
        ));
  }

  Future calculate() {
    setState(() {
      _color = Colors.deepPurpleAccent;
      _completed = false;
      _loading = true;
    });

    double alc = double.parse(
          _alcCtrl.text.replaceAll(RegExp(r'[,.]'), ''),
        ) /
        100;
    double gas = double.parse(
          _gasCtrl.text.replaceAll(RegExp(r'[,.]'), ''),
        ) /
        100;
    double res = alc / gas;

    return Future.delayed(
      const Duration(seconds: 1),
      () {
        setState(
          () {
            if (res >= 0.7) {
              _resultText = 'Compensa utilizar Gasolina!';
            } else {
              _resultText = 'Compensa utilizar Álcool!';
            }

            _completed = true;
            _loading = false;
          },
        );
      },
    );
  }

  reset() {
    setState(() {
      _alcCtrl.text = '0.00';
      _gasCtrl.text = '0.00';
      _completed = false;
      _loading = false;
      _color = Colors.deepPurple;
    });
  }
}
