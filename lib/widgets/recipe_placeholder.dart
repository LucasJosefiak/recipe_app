import 'package:flutter/material.dart';
import 'package:groceries_app/constants/radii.dart';
import 'package:vector_math/vector_math.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RecipePlaceholder extends StatelessWidget {
  const RecipePlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.8,
      // child: Transform.rotate(
      //   // angle: -radians(2),
      //   child: Column(
      child: Center(
        child:
            // ClipRRect(
            //   borderRadius: Radii.cardRadius,
            //   child: Image.asset('assets/recipe-stock-image.jpg'),
            // ),
            // SizedBox(
            //   height: 16,
            // ),
            Text(
          AppLocalizations.of(context)!.recipePlaceholder,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      // ),
    );
  }
}
