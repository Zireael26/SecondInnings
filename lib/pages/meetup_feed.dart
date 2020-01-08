import 'package:flutter/material.dart';
import 'package:hackathon_app/helpers/custom_route.dart';
import 'package:hackathon_app/pages/meetup_details.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:hackathon_app/scoped_models/app_model.dart';

class MeetupList extends StatefulWidget {
  final AppModel model;
  MeetupList(this.model);
  @override
  _MeetupListState createState() => _MeetupListState();
}

class _MeetupListState extends State<MeetupList> {
  @override
  void initState() {
    widget.model.fetchMeetups();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
        builder: (BuildContext context, Widget child, AppModel model) {
      return widget.model.loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: widget.model.meetupList.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, CustomRoute(builder: (context) {
                      return MeetupDetails(model, index);
                    }));
                  },
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Hero(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Image.network(
                              widget.model.meetupList[index].photoUrl,
                              fit: BoxFit.contain,
                            ),
                          ),
                          tag: 'eventImage$index',
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 24.0),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                widget.model.meetupList[index].name,
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                widget.model.meetupList[index].description,
                                maxLines: 4,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: 32.0,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
    });
  }
}
