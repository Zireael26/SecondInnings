import 'package:flutter/material.dart';
import 'package:hackathon_app/models/HobbyChip.dart';

class SecondOnBoarding extends StatefulWidget {
  @override
  State createState() => SecondOnBoardingState();
}

class SecondOnBoardingState extends State<SecondOnBoarding> {
  List<String> _filters = <String>[];
  List<HobbyChip> hobbies = [
    HobbyChip("Arts & Culture", 1, Icons.color_lens),
    HobbyChip("Book Clubs", 18, Icons.book),
    HobbyChip("Career & Business", 2, Icons.card_travel),
    HobbyChip("Cars & Motorcycles", 3, Icons.airport_shuttle),
    HobbyChip("Community & Environment", 4, Icons.nature_people),
    HobbyChip("Dancing", 5, Icons.directions_walk),
    HobbyChip("Education & Learning", 6, Icons.book),
    HobbyChip("Fashion & Beauty", 8, Icons.person),
    HobbyChip("Fitness", 9, Icons.directions_run),
    HobbyChip("Food & Drink", 10, Icons.fastfood),
    HobbyChip("Games", 11, Icons.gamepad),
    HobbyChip("Movements & Politics", 13, Icons.people),
    HobbyChip("Health & Wellbeing", 14, Icons.local_hospital),
    HobbyChip("Hobbies & Crafts", 15, Icons.card_giftcard),
    HobbyChip("Languages", 16, Icons.chat),
    HobbyChip("LGBT", 12, Icons.people),
    HobbyChip("Lifestyle", 17, Icons.blur_on),
    HobbyChip("Movies & Film", 20, Icons.movie_filter),
    HobbyChip("Music", 21, Icons.music_note),
    HobbyChip("Photography", 27, Icons.photo_camera),
  ];

  Iterable<Widget> get actorWidgets sync* {
    for (HobbyChip hobby in hobbies) {
      yield Padding(
        padding: const EdgeInsets.all(4.0),
        child: FilterChip(
          avatar: CircleAvatar(
            child: Container(
              child: Icon(
                hobby.iconData,
                color: Theme.of(context).primaryColorDark,
                size: 16.0,
              ),
            ),
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: Colors.grey.shade300,
          selectedColor: Theme.of(context).accentColor,
          label: Text(
            hobby.name,
            style: TextStyle(color: Colors.black),
          ),
          selected: _filters.contains(hobby.name),
          onSelected: (bool value) {
            setState(() {
              if (value) {
                _filters.add(hobby.name);
              } else {
                _filters.removeWhere((String name) {
                  return name == hobby.name;
                });
              }
            });
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Wrap(
                children: actorWidgets.toList(),
              ),
            ),
            Text('Look for: ${_filters.join(', ')}'),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              alignment: Alignment.center,
              child: RaisedButton(
                elevation: 8.0,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: Theme.of(context).accentColor,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/veteran');
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.60,
                  padding: EdgeInsets.all(16.0),
                  child: Center(
                    child: const Text(
                      'Continue',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
