import 'package:flutter/material.dart';
import 'package:hackathon_app/helpers/custom_route.dart';
import 'package:hackathon_app/pages/news_details.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:hackathon_app/scoped_models/app_model.dart';

class NewsList extends StatefulWidget {
  final AppModel model;
  NewsList(this.model);
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  void initState() {
    widget.model.fetchNews();
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
              itemCount: widget.model.newsList.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, CustomRoute(builder: (context) {
                      return NewsDetails(model, index);
                    }));
                  },
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Hero(
                          child: Image.network(
                            widget.model.newsList[index].imageUrl,
                            fit: BoxFit.cover,
                          ),
                          tag: 'articleImage$index',
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
                                widget.model.newsList[index].title,
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                widget.model.newsList[index].description,
                                overflow: TextOverflow.fade,
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
