import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';

import 'button.widget.dart';
import 'input.widget.dart';

class SubmitFormWidget extends StatelessWidget {
  final MoneyMaskedTextController _gasCtrl;
  final MoneyMaskedTextController _alcCtrl;
  final bool _loading;
  final VoidCallback _onPressed;

  const SubmitFormWidget({
    super.key,
    required MoneyMaskedTextController gasCtrl,
    required MoneyMaskedTextController alcCtrl,
    required bool loading,
    required VoidCallback onPressed,
  })  : _gasCtrl = gasCtrl,
        _alcCtrl = alcCtrl,
        _loading = loading,
        _onPressed = onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: InputWidget(
            label: 'Gasolina',
            controller: _gasCtrl,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: InputWidget(
            label: 'Álcool',
            controller: _alcCtrl,
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        ButtonWidget(
          invertColor: false,
          loading: _loading,
          label: 'CALCULAR',
          onPressed: _onPressed,
        ),
      ],
    );
  }
}
