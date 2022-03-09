import 'package:device_frame/device_frame.dart' as frame;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/cubit/ingredients_cubit.dart';
import 'package:groceries_app/cubit/unit_cubit.dart';
import 'package:groceries_app/models/ingredient.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/repositories/memory_repository.dart';
import 'package:groceries_app/screens/add_ingredient_screen.dart';
import 'package:groceries_app/themes/dark_theme.dart';
import 'package:groceries_app/themes/light_theme.dart';
import 'package:groceries_app/widgets/new_tag.dart';
import 'package:groceries_app/widgets/recipe_info.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HotReload extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      appInfo: AppInfo(name: 'Recipe App'),
      themes: [
        WidgetbookTheme(
          name: 'Light',
          data: getLightTheme(),
        ),
        WidgetbookTheme(
          name: 'Dark',
          data: getDarkTheme(),
        ),
      ],
      devices: [
        Apple.iPhone12,
        Samsung.s21ultra,
      ],
      frames: [
        WidgetbookFrame.defaultFrame(),
        WidgetbookFrame.deviceFrame(),
        WidgetbookFrame.noFrame(),
      ],
      useCaseBuilder: (context, widget) {
        return Padding(
          padding: const EdgeInsets.only(top: 30),
          child: widget,
        );
      },
      deviceFrameBuilder: (context, device, renderMode, child) {
        if (renderMode == WidgetbookFrame.defaultFrame()) {
          return WidgetbookDeviceFrame(
            device: device,
            child: child,
          );
        }

        if (renderMode == WidgetbookFrame.deviceFrame()) {
          return frame.DeviceFrame(
            device: frame.Devices.ios.iPhone12,
            screen: child,
          );
        }

        return child;
      },
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'),
        Locale('es'),
        Locale('de'),
      ],
      categories: [
        WidgetbookCategory(
          name: 'use cases',
          folders: [
            WidgetbookFolder(
              name: 'widgets',
              widgets: [
                WidgetbookWidget(
                  name: 'RecipeInfo',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Short name',
                      builder: (context) => Column(
                        children: [
                          RecipeInfo(
                            recipe: Recipe(
                              identifier: '1',
                              title: 'potatoSoup',
                              createdAt: DateTime.now(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    WidgetbookUseCase(
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
                WidgetbookWidget(
                  name: 'New tag',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Default',
                      builder: (context) => NewTag(),
                    ),
                  ],
                ),
              ],
            ),
            WidgetbookFolder(
              name: 'screens',
              widgets: [
                WidgetbookWidget(
                  name: 'AddIngredientScreen',
                  useCases: [
                    WidgetbookUseCase(
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
