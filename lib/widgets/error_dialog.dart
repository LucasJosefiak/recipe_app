import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('An error occured!'),
      content: Text('Something went wrong.'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Okay'),
        ),
      ],
    );
  }
}
