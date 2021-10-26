import 'package:flutter/material.dart';

class SeparatedListView extends StatelessWidget {
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;
  const SeparatedListView({
    Key? key,
    required this.itemCount,
    required this.itemBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: itemBuilder,
      separatorBuilder: (_, __) {
        return SizedBox(
          height: 8,
        );
      },
      itemCount: itemCount,
    );
  }
}
