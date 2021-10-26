import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/cubit/ingredients_cubit.dart';
import 'package:groceries_app/cubit/unit_cubit.dart';
import 'package:groceries_app/models/ingredient.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/repositories/memory_repository.dart';
import 'package:groceries_app/screens/add_ingredient_screen.dart';
import 'package:groceries_app/themes/dark_theme.dart';
import 'package:groceries_app/themes/light_theme.dart';
import 'package:groceries_app/widgets/recipe_info.dart';
import 'package:widgetbook/widgetbook.dart';

void main() {
  runApp(HotReload());
}

class HotReload extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Widgetbook(
      appInfo: AppInfo(name: 'Recipe App'),
      lightTheme: getLightTheme(),
      darkTheme: getDarkTheme(),
      devices: [
        Apple.iPhone11,
        Samsung.s21ultra,
      ],
      categories: [
        Category(
          name: 'stories',
          folders: [
            Folder(
              name: 'widgets',
              widgets: [
                WidgetElement(
                  name: 'RecipeInfo',
                  stories: [
                    Story(
                      name: 'Short name',
                      builder: (context) => Column(
                        children: [
                          RecipeInfo(
                            recipe: Recipe(
                              identifier: '1',
                              title: 'Beef Lasagna',
                              createdAt: DateTime.now(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Story(
                      name: 'Long name',
                      builder: (context) => Column(
                        children: [
                          RecipeInfo(
                            recipe: Recipe(
                              identifier: '1',
                              title: 'Beef Lasagna with Basil and Garlic',
                              createdAt: DateTime.now(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Folder(
              name: 'screens',
              widgets: [
                WidgetElement(
                  name: 'AddIngredientScreen',
                  stories: [
                    Story(
                      name: 'theme example',
                      builder: (context) => MultiBlocProvider(
                        providers: [
                          BlocProvider(
                            create: (context) => UnitCubit(),
                          ),
                          BlocProvider(
                            create: (context) => IngredientsCubit(
                              ingredientRepository:
                                  MemoryRepository<Ingredient>(),
                            ),
                          )
                        ],
                        child: AddIngredientScreen(
                          recipe: Recipe(
                            identifier: '1',
                            title: 'Tomato Lasagna',
                            createdAt: DateTime.now(),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
