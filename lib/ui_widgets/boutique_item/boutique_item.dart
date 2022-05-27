import 'package:flutter/material.dart';
import 'package:weather_project/ui/home/model/home_middle_response.dart';

class BoutiqueItem extends StatelessWidget {
  final BoutiqueCollection item;

  BoutiqueItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 470.0,
      height: 710.0,
      child: Container(
        child: Stack(
          children: <Widget>[
            Image.network(
              item.bannerImage!,
              fit: BoxFit.cover,
              width: 470.0,
              height: 710.0,
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.9)
                      ],
                    ),
                  ),
                  padding: EdgeInsets.only(bottom: 20.0),
                  alignment: Alignment.bottomLeft,
                  height: 140.0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50.0,
                        ),
                        Text(
                          item.name!.toUpperCase(),
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          item.cta!.toUpperCase(),
                          style: TextStyle(color: Colors.white, fontSize: 12.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
