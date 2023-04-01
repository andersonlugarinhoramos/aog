import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 60,
        ),
        Image.asset(
          'assets/images/aog-white.png',
          height: 80,
        ),
        const Text(
          'Álcool ou Gasolina',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontFamily: 'Big Shoulders Display',
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
