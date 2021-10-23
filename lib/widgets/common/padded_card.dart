import 'package:flutter/material.dart';

class PaddedCard extends StatelessWidget {
  final Widget child;
  const PaddedCard({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: child,
      ),
    );
  }
}
