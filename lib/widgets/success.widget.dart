import 'package:flutter/material.dart';

import 'button.widget.dart';

class SuccessWidget extends StatelessWidget {
  final String _label;
  final VoidCallback _onPressed;

  const SuccessWidget(
      {super.key, required String label, required VoidCallback onPressed})
      : _label = label,
        _onPressed = onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 50,
          ),
          Text(
            _label,
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 40,
                fontFamily: 'Big Shoulders Display'),
          ),
          const SizedBox(
            height: 20,
          ),
          ButtonWidget(
            invertColor: true,
            loading: false,
            label: 'CALCULAR NOVAMENTE',
            onPressed: _onPressed,
          ),
        ],
      ),
    );
  }
}
