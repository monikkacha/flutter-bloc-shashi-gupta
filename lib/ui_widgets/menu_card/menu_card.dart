import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  final VoidCallback onTap;
  final String image;
  final String text;

  MenuCard(this.image, this.text, {required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 140.0,
          child: Column(
            children: [
              Expanded(
                  child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
                child: Image.network(
                  image,
                ),
              )),
              Text(text),
            ],
          ),
        ),
      ),
    );
  }
}
