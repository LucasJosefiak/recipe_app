import 'package:flutter/material.dart';
import 'package:groceries_app/models/ingredient.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/models/unit.dart';
import 'package:groceries_app/providers/recipes_provider.dart';
import 'package:groceries_app/providers/shopping_list_provider.dart';
import 'package:groceries_app/widgets/buttons/custom_elevated_button.dart';
import 'package:groceries_app/widgets/buttons/custom_icon_button.dart';
import 'package:groceries_app/widgets/buttons/save_button.dart';
import 'package:groceries_app/widgets/ingredient_info.dart';
import 'package:groceries_app/widgets/recipe_info.dart';
import 'package:groceries_app/widgets/recipe_placeholder.dart';
import 'package:provider/provider.dart';
// import 'package:widgetbook/widgetbook.dart';
import 'package:flutterbook/flutterbook.dart';

class Storyboo extends StatelessWidget {
  const Storyboo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterBook(
      categories: [
        Category(
          categoryName: 'Widgets',
          organizers: [
            Folder(
              folderName: 'Buttons',
              organizers: [
                Component(
                  componentName: 'CustomElevatedButton',
                  states: [
                    ComponentState(
                      stateName: 'Short text',
                      builder: (context, c) => Elevated(
                        function: null,
                        text: 'Add recipe',
                      ),
                    ),
                    ComponentState(
                      stateName: 'Short text',
                      builder: (context, c) => Elevated(
                        function: null,
                        text: 'Add recipe to the list',
                      ),
                    ),
                  ],
                ),
                //           WidgetElement(
                //             name: 'CustomIconButton',
                //             stories: [
                //               Story(
                //                 name: 'Delete',
                //                 builder: (context) => CustomIconButton(
                //                   function: null,
                //                   icon: Icon(Icons.delete),
                //                 ),
                //               ),
                //               Story(
                //                 name: 'Edit',
                //                 builder: (context) => CustomIconButton(
                //                   function: null,
                //                   icon: Icon(Icons.edit),
                //                 ),
                //               ),
                //             ],
                //           ),
                //           WidgetElement(
                //             name: 'SaveButton',
                //             stories: [
                //               Story(
                //                 name: 'test',
                //                 builder: (context) => SaveButton(
                //                   function: null,
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ],
                //       ),
                //     ],
                //     widgets: [
                //       WidgetElement(
                //         name: 'RecipePlaceholder',
                //         stories: [
                //           Story(
                //             name: 'test',
                //             builder: (context) => RecipePlaceholder(),
                //           ),
                //         ],
                //       ),
                Component(
                  componentName: 'RecipeInfo',
                  states: [
                    ComponentState(
                      stateName: 'Short title',
                      builder: (context, c) => RecipeInfo(
                        recipe: Recipe(
                          title: 'Cheese',
                          createdAt: DateTime.now(),
                        ),
                      ),
                    ),
                    ComponentState(
                      stateName: 'Long title',
                      builder: (context, c) => RecipeInfo(
                        recipe: Recipe(
                          title: 'Cheese and cheese and cheese',
                          createdAt: DateTime.now(),
                        ),
                      ),
                    ),
                  ],
                ),
                //       WidgetElement(
                //         name: 'IngredientInfo',
                //         stories: [
                //           Story(
                //             name: 'Short name',
                //             builder: (context) => ChangeNotifierProvider(
                //               create: (context) => RecipesProvider(),
                //               child: ChangeNotifierProvider(
                //                 create: (context) => ShoppingListProvider(),
                //                 child: IngredientInfo(
                //                   recipe: Recipe(
                //                     title: 'Cheese',
                //                     createdAt: DateTime.now(),
                //                   ),
                //                   ingredient: Ingredient(
                //                     name: 'Gouda',
                //                     unit: Unit.g,
                //                     amount: 200,
                //                     createdAt: DateTime.now(),
                //                   ),
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // ],
                // appInfo: AppInfo(
                //   name: 'Recipe App',
                // ),
                // devices: [
                //   Apple.iPadAir10Inch,
                //   Apple.iPadMini,
                //   Apple.iPhone12pro,
                //   Samsung.s10,
                //   Device(
                //     name: 'Custom',
                //     type: DeviceType.mobile,
                //     resolution: Resolution.dimensions(
                //       width: 500,
                //       height: 500,
                //       scaleFactor: 2,
              ],
            ),
          ],
        ),
      ],
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
    );
  }
}
