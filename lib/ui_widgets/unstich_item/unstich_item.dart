import 'package:flutter/material.dart';

class UnstichItem extends StatelessWidget {
  final String image;

  UnstichItem({required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 470.0,
      height: 710.0,
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                Image.network(
                  image,
                  fit: BoxFit.cover,
                  width: 470.0,
                  height: 710.0,
                ),
              ],
            )),
      ),
    );
  }
}
