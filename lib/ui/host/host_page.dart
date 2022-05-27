import 'package:flutter/material.dart';
import 'package:weather_project/ui/category/screen/category_page.dart';
import 'package:weather_project/ui/home/screen/home_page.dart';
import 'package:weather_project/utils/app_string.dart';

class HostPage extends StatefulWidget {
  const HostPage({Key? key}) : super(key: key);

  @override
  _HostPageState createState() => _HostPageState();
}

class _HostPageState extends State<HostPage> {
  int _selectedIndex = 0;
  bool isHomePage = true;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      bottomNavigationBar: getBottomNavigationBar(),
      body: _selectedIndex == 0 ? HomePage() : CategoryPage(),
    );
  }

  getBottomNavigationBar() => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit_outlined),
            label: 'Curate',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Sale',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz_outlined),
            label: 'More',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      );

  getAppBar() => PreferredSize(
        child: Container(
          color: Colors.red[200],
          padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0),
          child: Row(
            children: [
              getBranding(),
              Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    size: 24.0,
                    color: Colors.white,
                  )),
              Stack(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        size: 24.0,
                        color: Colors.white,
                      )),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        margin: EdgeInsets.only(top: 7.0 , right: 7.0),
                        height: 14.0,
                        width: 14.0,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        child: Center(
                          child: Text(
                            "2",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 10.0),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        preferredSize: Size.fromHeight(60), // Set this height
      );

  getBranding() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'FAB',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.lightGreen,
                      fontSize: 20.0),
                ),
                TextSpan(text: 'CURATE', style: TextStyle(fontSize: 20.0)),
              ],
            ),
          ),
          Text(
            AppString.create_your_own_fabric,
            style: TextStyle(fontSize: 10.0),
          )
        ],
      );
}
