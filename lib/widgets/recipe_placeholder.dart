import 'package:flutter/material.dart';

class RecipePlaceholder extends StatelessWidget {
  const RecipePlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.rotate(
        angle: 12.5,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
              shape: BoxShape.rectangle),
          height: 300,
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Image.network(
                'https://images-na.ssl-images-amazon.com/images/I/71wsjLf-WYL.jpg',
                height: 220,
              ),
              SizedBox(height: 16),
              Text(
                'Please add your favorite recipes!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
