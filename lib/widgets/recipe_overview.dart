import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:groceries_app/constants/colors.dart';
import 'package:groceries_app/cubit/recipe_cubit.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/models/test_models.dart';
import 'package:groceries_app/widgets/common/padded_card.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookUseCase(name: 'Default', type: RecipeOverview)
Widget recipeOverviewStory(BuildContext context) {
  return Column(
    children: [
      RecipeOverview(
        recipe: getTestRecipeModel(),
      ),
    ],
  );
}

class RecipeOverview extends StatefulWidget {
  final Recipe recipe;
  const RecipeOverview({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  State<RecipeOverview> createState() => _RecipeOverviewState();
}

class _RecipeOverviewState extends State<RecipeOverview> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(
      text: widget.recipe.title,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PaddedCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EditableText(
            backgroundCursorColor: ColorConstants.grey,
            onChanged: (value) {
              BlocProvider.of<RecipeCubit>(context).updateRecipe(
                widget.recipe.copyWith(
                  title: value,
                ),
              );
            },
            controller: controller,
            cursorColor: ColorConstants.green,
            focusNode: FocusNode(),
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
              '${widget.recipe.ingredients.length} ${AppLocalizations.of(context)!.ingredients}')
        ],
      ),
    );
  }
}
