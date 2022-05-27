import 'package:flutter/material.dart';
import 'package:weather_project/ui/home/model/home_bottom_response.dart';

class DesignAsPerOccassionItem extends StatefulWidget {
  final DesignOccasion item;

  DesignAsPerOccassionItem(this.item);

  @override
  State<DesignAsPerOccassionItem> createState() =>
      _DesignAsPerOccassionItemState();
}

class _DesignAsPerOccassionItemState extends State<DesignAsPerOccassionItem> {
  String name = "";

  @override
  void initState() {
    getName();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4.0),
      child: Stack(
        children: [
          Image.network(widget.item.image!),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                width: double.infinity,
                height: 30.0,
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      name.toUpperCase(),
                      style: TextStyle(
                          fontSize: 10.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.item.subName!.toUpperCase(),
                            style: TextStyle(fontSize: 6.0)),
                        Text(widget.item.cta!.toUpperCase(),
                            style: TextStyle(fontSize: 6.0))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  getName() {
    List<String> names = widget.item.name!.split(" ");
    name = names[0];
    setState(() {});
  }
}
