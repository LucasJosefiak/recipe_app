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
import 'package:widgetbook/widgetbook.dart';

class Storybook extends StatelessWidget {
  const Storybook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook(
      categories: [
        Category(
          name: 'Widgets',
          folders: [
            Folder(
              name: 'Buttons',
              widgets: [
                WidgetElement(
                  name: 'CustomElevatedButton',
                  stories: [
                    Story(
                      name: 'Short text',
                      builder: (context) => Elevated(
                        function: null,
                        text: 'Add recipe',
                      ),
                    ),
                    Story(
                      name: 'Long text',
                      builder: (context) => Elevated(
                        function: null,
                        text: 'Click to add recipe',
                      ),
                    ),
                  ],
                ),
                WidgetElement(
                  name: 'CustomIconButton',
                  stories: [
                    Story(
                      name: 'Delete',
                      builder: (context) => CustomIconButton(
                        function: null,
                        icon: Icon(Icons.delete),
                      ),
                    ),
                    Story(
                      name: 'Edit',
                      builder: (context) => CustomIconButton(
                        function: null,
                        icon: Icon(Icons.edit),
                      ),
                    ),
                  ],
                ),
                WidgetElement(
                  name: 'SaveButton',
                  stories: [
                    Story(
                      name: 'test',
                      builder: (context) => SaveButton(
                        function: null,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
          widgets: [
            WidgetElement(
              name: 'RecipePlaceholder',
              stories: [
                Story(
                  name: 'test',
                  builder: (context) => RecipePlaceholder(),
                ),
              ],
            ),
            WidgetElement(
              name: 'RecipeInfo',
              stories: [
                Story(
                  name: 'Short title',
                  builder: (context) => RecipeInfo(
                    recipe: Recipe(
                      title: 'Cheese',
                      createdAt: DateTime.now(),
                    ),
                  ),
                ),
                Story(
                  name: 'Long title',
                  builder: (context) => RecipeInfo(
                    recipe: Recipe(
                      title: 'Pizza with mushrooms and cheese',
                      createdAt: DateTime.now(),
                    ),
                  ),
                ),
              ],
            ),
            WidgetElement(
              name: 'IngredientInfo',
              stories: [
                Story(
                  name: 'Short name',
                  builder: (context) => ChangeNotifierProvider(
                    create: (context) => RecipesProvider(),
                    child: ChangeNotifierProvider(
                      create: (context) => ShoppingListProvider(),
                      child: IngredientInfo(
                        recipe: Recipe(
                          title: 'Cheese',
                          createdAt: DateTime.now(),
                        ),
                        ingredient: Ingredient(
                          name: 'Gouda',
                          unit: Unit.g,
                          amount: 200,
                          createdAt: DateTime.now(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
      appInfo: AppInfo(
        name: 'Recipe App',
      ),
      devices: [
        Apple.iPadAir10Inch,
        Apple.iPadMini,
        Apple.iPhone12pro,
        Samsung.s10,
        Device(
          name: 'Custom',
          type: DeviceType.mobile,
          resolution: Resolution.dimensions(
            width: 500,
            height: 500,
            scaleFactor: 2,
          ),
        ),
      ],
      lightTheme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
    );
  }
}
