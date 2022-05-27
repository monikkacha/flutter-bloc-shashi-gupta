import 'package:flutter/material.dart';
import 'package:weather_project/ui/home/model/home_middle_response.dart';
import 'package:weather_project/utils/app_string.dart';
import 'package:weather_project/utils/extension.dart';

class ShopByCategoryItem extends StatefulWidget {
  final ShopBy item;

  ShopByCategoryItem(this.item);

  @override
  State<ShopByCategoryItem> createState() => _ShopByCategoryItemState();
}

class _ShopByCategoryItemState extends State<ShopByCategoryItem> {
  String firstWord = "";
  String secondWord = "";

  @override
  void initState() {
    initWords();
  }

  void initWords() {
    List<String> words = widget.item.name!.split(" ");
    firstWord = words[0];
    secondWord = words[1];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 12.0),
      color: HexColor.fromHex(widget.item.tintColor.toString()),
      height: 190.0,
      width: 140.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: 140.0,
              height: 140.0,
              child: Image.network(widget.item.image!)),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: getName(),
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              AppString.explore.toUpperCase(),
              style: TextStyle(fontSize: 10.0),
            ),
          )
        ],
      ),
    );
  }

  getName() => Text.rich(
        TextSpan(
          children: [
            TextSpan(
                text: firstWord.toUpperCase() + " ",
                style: TextStyle(fontSize: 10.0)),
            TextSpan(
                text: secondWord.toUpperCase(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0)),
          ],
        ),
      );
}
