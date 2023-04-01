import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final String _label;
  final TextEditingController _controller;

  const InputWidget(
      {super.key,
      required String label,
      required final TextEditingController controller})
      : _label = label,
        _controller = controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 100,
          alignment: Alignment.centerRight,
          child: Text(
            _label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 35,
              fontFamily: 'Big Shoulders Display',
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: TextFormField(
            controller: _controller,
            keyboardType: TextInputType.number,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 45,
              fontFamily: 'Big Shoulders Display',
            ),
            decoration: const InputDecoration(border: InputBorder.none),
          ),
        )
      ],
    );
  }
}
