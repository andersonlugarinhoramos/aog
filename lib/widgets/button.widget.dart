import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String _label;
  final bool _loading;
  final bool _invertColor;
  final VoidCallback _onPressed;

  const ButtonWidget({
    super.key,
    required String label,
    required bool loading,
    required bool invertColor,
    required VoidCallback onPressed,
  })  : _label = label,
        _loading = loading,
        _invertColor = invertColor,
        _onPressed = onPressed;

  @override
  Widget build(BuildContext context) {
    return _loading
        ? Container(
            alignment: Alignment.center,
            height: 50,
            child: const CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
          )
        : Container(
            margin: const EdgeInsets.all(30),
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color: _invertColor
                  ? Theme.of(context).primaryColor
                  : Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(60),
            ),
            child: TextButton(
              onPressed: _onPressed,
              child: Text(
                _label,
                style: TextStyle(
                  color: _invertColor
                      ? Colors.white.withOpacity(0.8)
                      : Theme.of(context).primaryColor,
                  fontSize: 25,
                  fontFamily: 'Big Shoulders Display',
                ),
              ),
            ),
          );
  }
}
