import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui/widgets/destination_carousel.dart';
import 'package:flutter_ui/widgets/hotel_carousel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentTab = 0;
  List<IconData> _icon = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];

  Widget _myIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
          // _selectedIndex +=1;
        });
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            color: index == _selectedIndex
                ? Theme.of(context).accentColor
                : Colors.blueGrey[100],
            borderRadius: BorderRadius.circular(30.0)),
        child: Icon(
          _icon[index],
          color: index == _selectedIndex
              ? Theme.of(context).primaryColor
              : Colors.blueGrey[400],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 120),
              child: Text(
                'What you would like to find?',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icon
                  .asMap()
                  .entries
                  .map((MapEntry map) => _myIcon(map.key))
                  .toList(),
            ),
            SizedBox(height: 20),
            DestinationCarousel(),
            SizedBox(height: 20),
            HotelCaousel(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        items: [
          BottomNavigationBarItem(
              title: SizedBox.shrink(),
              icon: Icon(
                Icons.search,
                size: 30,
              ),
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              title: SizedBox.shrink(),
              icon: Icon(
                Icons.local_pizza,
                size: 30,
              ),
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              title: SizedBox.shrink(),
              icon: CircleAvatar(
                backgroundImage: AssetImage('assets/images/alias.jpg'),
              )),
        ],
      ),
    );
  }
}
