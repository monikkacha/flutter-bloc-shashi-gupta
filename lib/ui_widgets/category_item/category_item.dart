import 'package:flutter/material.dart';
import 'package:weather_project/ui_widgets/curved_right_side_clipper/curved_right_side_clipper.dart';
import 'dart:math' as math;

class CategoryItem extends StatefulWidget {
  String name;
  String bannerImage;
  bool? isParentCategory = false;

  CategoryItem(
      {required this.name, required this.bannerImage, this.isParentCategory});

  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 1.0),
      height: 178.0,
      width: double.infinity,
      child: Stack(
        children: [
          FittedBox(fit: BoxFit.fill, child: Image.network(widget.bannerImage)),
          Positioned.fill(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Transform.rotate(
                angle: -math.pi / 2,
                child: ClipPath(
                  clipper: CurvedRightSideClipper(),
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 0.5, horizontal: 0.5),
                    height: 300.0,
                    width: 178.0,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.red[200]!,
                            Colors.red[500]!,
                          ],
                        ),
                        color: Colors.red[100]),
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Text(
                  widget.name,
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          widget.isParentCategory ?? false
              ? Positioned.fill(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 24.0),
                      child: Container(
                          height: 40.0,
                          width: 40.0,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(100.0)),
                          child: Icon(
                            Icons.expand_more,
                            color: Colors.white,
                          )),
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
