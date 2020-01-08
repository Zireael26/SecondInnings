import 'package:flutter/material.dart';
import 'package:hackathon_app/pages/meetup_feed.dart';
import 'package:hackathon_app/pages/news_feed.dart';
import 'package:hackathon_app/scoped_models/app_model.dart';

class VeteransApp extends StatefulWidget {
  final AppModel model;
  VeteransApp(this.model);
  @override
  _VeteransAppState createState() => _VeteransAppState();
}

class _VeteransAppState extends State<VeteransApp>
    with SingleTickerProviderStateMixin {
  TabController controller;
  int _currentIndex = 0;

  @override
  void initState() {
    controller = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      NewsList(widget.model),
      MeetupList(widget.model),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('News Feed'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            title: Text('Meetup Feed'),
          )
        ],
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        currentIndex: _currentIndex,
        fixedColor: Theme.of(context).accentColor,
      ),
      body: pages[_currentIndex],
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.phone),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
