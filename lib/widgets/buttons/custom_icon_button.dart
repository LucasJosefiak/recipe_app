import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final void Function()? function;
  final Widget icon;
  const CustomIconButton({
    Key? key,
    required this.function,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        onPressed: function,
        icon: icon,
        color: Theme.of(context).colorScheme.secondary,
        iconSize: 32,
      ),
    );
  }
}
