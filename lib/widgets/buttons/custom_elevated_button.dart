import 'package:flutter/material.dart';

class Elevated extends StatelessWidget {
  final void Function()? function;
  final String text;
  const Elevated({
    Key? key,
    required this.function,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: function,
        child: Text(
          text,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              Theme.of(context).colorScheme.secondary),
          padding: MaterialStateProperty.all(
            EdgeInsets.all(16.0),
          ),
        ),
      ),
    );
  }
}
