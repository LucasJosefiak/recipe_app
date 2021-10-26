import 'package:flutter/material.dart';

class TileTitle extends StatelessWidget {
  final String title;
  const TileTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .headline5!
          .copyWith(fontWeight: FontWeight.bold),
    );
  }
}
