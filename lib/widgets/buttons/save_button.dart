import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  final void Function()? function;
  const SaveButton({
    Key? key,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: function,
        child: Text('Save'),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              Theme.of(context).colorScheme.secondary),
        ),
      ),
    );
  }
}
