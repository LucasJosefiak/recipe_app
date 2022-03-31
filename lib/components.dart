import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookUseCase(name: 'Icon', type: FloatingActionButton)
Widget floatingActionButton(BuildContext context) {
  return FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.add),
  );
}

@WidgetbookUseCase(name: 'Extended', type: FloatingActionButton)
Widget floatingActionButtonExtended(BuildContext context) {
  return FloatingActionButton.extended(
    onPressed: () {},
    icon: Icon(Icons.add),
    label: Text(AppLocalizations.of(context)!.add),
  );
}

@WidgetbookUseCase(name: 'Text', type: ElevatedButton)
Widget elevatedButtonText(BuildContext context) {
  return ElevatedButton(
    onPressed: () {},
    child: Text('Elevated Button'),
  );
}

@WidgetbookUseCase(name: 'Icon', type: ElevatedButton)
Widget elevatedButtonIcon(BuildContext context) {
  return ElevatedButton.icon(
    onPressed: () {},
    icon: Icon(Icons.arrow_right),
    label: Text('Elevated Button'),
  );
}

@WidgetbookUseCase(name: 'Text', type: OutlinedButton)
Widget outlineButton(BuildContext context) {
  return OutlinedButton(
    onPressed: () {},
    child: Text('OutlinedButton Button'),
  );
}

@WidgetbookUseCase(name: 'Icon', type: OutlinedButton)
Widget outlineButtonIcon(BuildContext context) {
  return OutlinedButton.icon(
    onPressed: () {},
    label: Text('OutlinedButton Button'),
    icon: Icon(Icons.arrow_right),
  );
}

@WidgetbookUseCase(name: 'Text', type: TextButton)
Widget textButton(BuildContext context) {
  return TextButton(
    onPressed: () {},
    child: Text('TextButton Button'),
  );
}

@WidgetbookUseCase(name: 'Icon', type: TextButton)
Widget textButtonIcon(BuildContext context) {
  return TextButton.icon(
    onPressed: () {},
    label: Text('TextButton Button'),
    icon: Icon(Icons.arrow_right),
  );
}
