import 'package:flutter/material.dart';
import 'package:hackathon_app/scoped_models/app_model.dart';

class MeetupDetails extends StatefulWidget {
  final AppModel model;
  final int index;

  MeetupDetails(this.model, this.index);
  @override
  _MeetupDetailsState createState() => _MeetupDetailsState();
}

class _MeetupDetailsState extends State<MeetupDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.3,
            flexibleSpace: Hero(
              child: Image.network(
                widget.model.meetupList[widget.index].photoUrl,
                fit: BoxFit.cover,
              ),
              tag: 'eventImage${widget.index}',
            ),
            floating: true,
            backgroundColor: Theme.of(context).primaryColor,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(height: 16.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                child: Text(
                  widget.model.meetupList[widget.index].name,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24.0, vertical: 4.0),
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                decoration: BoxDecoration(
                    border: Border.all(
                        style: BorderStyle.solid,
                        color: Theme.of(context).accentColor,
                        width: 1.0),
                    borderRadius: BorderRadius.circular(30.0)),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0),
                      child: Icon(
                        Icons.location_on,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(
                          widget.model.meetupList[widget.index].venueName +
                              ", " +
                              widget.model.meetupList[widget.index].city,
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                decoration: BoxDecoration(
                    border: Border.all(
                        style: BorderStyle.solid,
                        color: Theme.of(context).accentColor,
                        width: 1.0),
                    borderRadius: BorderRadius.circular(30.0)),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0),
                      child: Icon(
                        Icons.date_range,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(
                          widget.model.meetupList[widget.index].time.toString(),
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                child: Text(
                  widget.model.meetupList[widget.index].description,
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
