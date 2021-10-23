import 'package:flutter/material.dart';

class PaddedScaffold extends StatelessWidget {
  final Widget body;
  final Widget? floatingActionButton;
  final PreferredSizeWidget? appBar;
  const PaddedScaffold({
    Key? key,
    required this.body,
    this.floatingActionButton,
    this.appBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: body,
      ),
      floatingActionButton: floatingActionButton,
      appBar: appBar,
    );
  }
}
