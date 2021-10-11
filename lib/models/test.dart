import 'package:flutter/material.dart';
import 'package:groceries_app/widgets/buttons/custom_elevated_button.dart';
import 'package:storyboard/storyboard.dart';

class Test extends Story {
  List<Widget> get storyContent {
    return [
      Elevated(
        text: 'test',
        function: () {},
      )
    ];
  }
}
