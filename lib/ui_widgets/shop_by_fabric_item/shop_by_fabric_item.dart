import 'package:flutter/material.dart';
import 'package:weather_project/ui/home/model/home_middle_response.dart';

class ShopByFabricItem extends StatefulWidget {
  final ShopBy item;

  ShopByFabricItem(this.item);

  @override
  State<ShopByFabricItem> createState() => _ShopByFabricItemState();
}

class _ShopByFabricItemState extends State<ShopByFabricItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10.0),
      height: 140.0,
      width: 140.0,
      child: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Container(
                    height: 140.0,
                    width: 140.0,
                    child: Image.network(widget.item.image!)),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.5),
                      ],
                    ),
                  ),
                  padding: EdgeInsets.only(bottom: 20.0),
                  alignment: Alignment.bottomCenter,
                  height: 140.0,
                  width: 140.0,
                  child: Text(
                    widget.item.name!,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
