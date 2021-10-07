import 'package:flutter/material.dart';
import 'package:dashbook/dashbook.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/widgets/buttons/custom_elevated_button.dart';
import 'package:groceries_app/widgets/recipe_info.dart';

void main() {
  final dashbook = Dashbook.multiTheme(themes: {
    'theme1': ThemeData.light(),
    'theme2': ThemeData.dark(),
    'theme3': ThemeData.fallback(),
  });

  // Adds the Text widget stories
  dashbook
      .storiesOf('Text')
      // Decorators are easy ways to apply a common layout to all of the story chapters, here are using onde of Dashbook's decorators,
      // which will center all the widgets on the center of the screen
      .decorator(CenterDecorator())
      // The Widget story can have as many chapters as needed
      .add('default', (ctx) {
    return Container(
        width: 300,
        child: Text(
          ctx.textProperty("text", "Kino"),
          textAlign: ctx.listProperty(
            "text align",
            TextAlign.center,
            TextAlign.values,
          ),
          textDirection: ctx.listProperty(
            "text direction",
            TextDirection.rtl,
            TextDirection.values,
          ),
          style: TextStyle(
              fontWeight: ctx.listProperty(
                "font weight",
                FontWeight.normal,
                FontWeight.values,
              ),
              fontStyle: ctx.listProperty(
                "font style",
                FontStyle.normal,
                FontStyle.values,
              ),
              fontSize: ctx.numberProperty("font size", 20)),
        ));
  });

  dashbook.storiesOf('RaisedButton').decorator(CenterDecorator()).add(
      'default', (ctx) => RaisedButton(child: Text('Ok'), onPressed: () {}));

  dashbook.storiesOf('ElevatedButton').decorator(CenterDecorator()).add(
        'short name',
        (ctx) => Elevated(
          text: 'Add',
          function: () {},
        ),
      );

  dashbook.storiesOf('Elevated Button').decorator(CenterDecorator()).add(
      'long name',
      (ctx) => Elevated(
            text: 'Add ingredient to recipe',
            function: () {},
          ));

  dashbook.storiesOf('RecipeInfo').decorator(CenterDecorator()).add(
      'long name',
      (ctx) => RecipeInfo(
            recipe: Recipe(title: 'title', createdAt: DateTime.now()),
          ));

  // Since dashbook is a widget itself, you can just call runApp passing it as a parameter
  runApp(dashbook);
}
