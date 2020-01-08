import 'package:flutter/material.dart';
import 'package:hackathon_app/scoped_models/app_model.dart';

class NewsDetails extends StatefulWidget {
  final AppModel model;
  final int index;

  NewsDetails(this.model, this.index);
  @override
  _NewsDetailsState createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.3,
            flexibleSpace: Hero(
              child: Image.network(
                widget.model.newsList[widget.index].imageUrl,
                fit: BoxFit.cover,
              ),
              tag: 'articleImage${widget.index}',
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
                  widget.model.newsList[widget.index].title,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                child: Text(
                  widget.model.newsList[widget.index].content,
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
