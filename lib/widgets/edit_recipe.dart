import 'package:flutter/material.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/providers/recipes_provider.dart';
import 'package:groceries_app/widgets/error_dialog.dart';
import 'package:provider/provider.dart';

class EditRecipe extends StatefulWidget {
  final Recipe recipe;

  const EditRecipe({Key? key, required this.recipe}) : super(key: key);

  @override
  _EditRecipeState createState() => _EditRecipeState();
}

class _EditRecipeState extends State<EditRecipe> {
  final _form = GlobalKey<FormState>();
  late TextEditingController nameController;
  String? title;

  var _isLoading = false;

  @override
  void initState() {
    title = widget.recipe.title;
    nameController = TextEditingController(
      text: title,
    );
    super.initState();
  }

  Future<void> _saveForm() async {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
      //if the Form is not valid, the form will not be safed. Code will then
      //stop after return and thus before the form could be saved
    }
    _form.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    try {
      await Provider.of<RecipesProvider>(context, listen: false).updateRecipe(
        widget.recipe.copyWith(title: title!),
      );
    } catch (error) {
      await showDialog<Null>(
        context: context,
        builder: (ctx) => ErrorDialog(),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _form,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Recipe',
                      ),
                      controller:
                          TextEditingController(text: '${widget.recipe.title}'),
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'Please provide a value.';
                        }
                        return null;
                        // null means no error (coorect Form)
                      },
                      onSaved: (value) {
                        title = value;
                      },
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).accentColor),
                      ),
                      child: Text('Save'),
                      onPressed: _saveForm,
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}


// import 'package:flutter/material.dart';
// import 'package:groceries_app/models/ingredient.dart';
// import 'package:groceries_app/models/recipe.dart';
// import 'package:groceries_app/providers/recipes_provider.dart';
// import 'package:groceries_app/screens/add_ingredient_screen.dart';
// import 'package:groceries_app/screens/edit_ingredient_screen.dart';
// import 'package:provider/provider.dart';

// class EditRecipeScreen extends StatefulWidget {
//   static const routeName = '/edit-recipe-screen';
//   @override
//   _EditRecipeScreenState createState() => _EditRecipeScreenState();
// }

// class _EditRecipeScreenState extends State<EditRecipeScreen> {
//   // final _ingredientFocusNode = FocusNode();

//   TextEditingController recipeNameController;

//   GlobalKey<FormState> _form;
//   Recipe _editedRecipe;
//   Recipe _originalRecipe;
//   RecipesProvider recipesProvider;
//   Ingredient _editedIngredient;
//   String recipeId;

//   //Die beiden Modelle Recipe und Ingredient funktionieren nicht so wie sollen. Hier brauche ich ein besseres Data Model...

//   @override
//   void initState() {
//     super.initState();

//     _form = GlobalKey<FormState>();
//     _editedRecipe = Recipe(
//       id: null,
//       title: '',
//       // ingredients: [Ingredient(id: null, amount: null, unit: null, name: null)],
//     );
//     _editedIngredient = Ingredient(
//       id: null,
//       name: '',
//       amount: 0,
//       unit: null,
//     );
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     if (recipesProvider == null) {
//       // or else you end up creating multiple instances in this case.
//       recipesProvider = Provider.of<RecipesProvider>(context, listen: true);
//     }

//     if (recipeId == null) {
//       recipeId = ModalRoute.of(context).settings.arguments as String;
//     }

//     _originalRecipe = recipesProvider.findById(recipeId);
//     recipeNameController = TextEditingController(text: _originalRecipe.title);
//   }

//   void _saveForm() {
//     _form.currentState.save();
//     print(_editedRecipe.title);
//     print(_editedIngredient.name);
//     print(_editedIngredient.amount);
//     print(_editedIngredient.unit);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit Recipe'),
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.save),
//             onPressed: _saveForm,
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () {
//           Navigator.pushNamed(context, AddIngredientScreen.routeName);
//         },
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _form,
//           child: Column(
//             children: [
//               TextFormField(
//                   controller: recipeNameController,
//                   decoration: InputDecoration(
//                     labelText: 'Recipe Title',
//                     errorText: recipeNameController.value.text.isNotEmpty
//                         ? null
//                         : 'cannot be empty',
//                   ),
//                   onChanged: (value) {
//                     setState(() {});
//                   },
//                   textInputAction: TextInputAction.next,
//                   // validator: (value) {
//                   //   return value.isNotEmpty ? null : 'cannot be empty';
//                   // },
//                   onSaved: (value) {
//                     _editedRecipe = Recipe(
//                       title: value,
//                       id: _editedRecipe.id,
//                       // ingredients: _editedRecipe.ingredients,
//                     );
//                   }),
//               SizedBox(
//                 height: 30,
//               ),
//               Expanded(
//                 child: ListView.builder(
//                   // itemCount: _originalRecipe.ingredients.length,
//                   itemBuilder: (context, index) {
//                     return ListTile(
//                       // title: Text(_originalRecipe.ingredients[index].name),
//                       subtitle: Text('test'
//                           // '${_originalRecipe.ingredients[index].amount}\ ${_originalRecipe.ingredients[index].unit}',
//                           ),
//                       leading: IconButton(
//                         icon: Icon(Icons.edit),
//                         onPressed: () {
//                           Navigator.pushNamed(
//                             context,
//                             EditIngredientScreen.routeName,
//                             arguments: recipeId,
//                           );
//                         },
//                       ),
//                       trailing: IconButton(
//                         icon: Icon(Icons.delete),
//                         onPressed: () {
//                           setState(() {
//                             // recipesProvider.deleteIngredientFromRecipe(
//                             //     _originalRecipe,
//                             //     _originalRecipe.ingredients[index].id);
//                           });
//                         },
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
