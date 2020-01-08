import 'package:hackathon_app/models/meetup_item.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:hackathon_app/models/news_item.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AppModel extends Model {
  List<dynamic> newsList = [];
  List<dynamic> meetupList = [];

  String reutersKey = "918c31e31cf94ad7895b4e5f379dda50";
  String meetupKey = "3f28017387f4f7b66593f4d3e3853d";
  bool loading = false;

  Future<bool> fetchArticles() async {
    http.Response response = await http
        .get('https://newsapi.org/v2/everything?q=jaish&apiKey=$reutersKey');
    print(json.decode(response.body));
    return true;
  }

  void fetchNews() async {
    newsList = [];
    loading = true;
    notifyListeners();
    http.Response response = await http
        .get('https://newsapi.org/v2/everything?q=jaish&apiKey=$reutersKey');
    // print(json.decode(response.body));
    Map<String, dynamic> map = json.decode(response.body);
    if (map['status'] == 'ok') {
      map['articles'].forEach((item) {
        NewsItem tempItem = NewsItem(
          author: item['author'],
          content: item['content'],
          description: item['description'],
          imageUrl: item['urlToImage'],
          sourceId: item['source']['id'],
          sourceName: item['source']['id'],
          title: item['title'],
          url: item['url'],
        );

        // print(item['title']);
        // print('--------------------------');
        newsList.add(tempItem);
      });
      loading = false;
      print('Finish loading');
      notifyListeners();
    }
    loading = false;
    notifyListeners();
  }

  Future<bool> fetchEvents() async {
    http.Response response = await http.get(
        'https://api.meetup.com/2/open_events?&sign=true&photo-host=public&country=in&city=bangalore&category=1&page=20&key=$meetupKey');
    print(json.decode(response.body));
    return true;
  }

  void fetchMeetups() async {
    meetupList = [];
    loading = true;
    notifyListeners();
    http.Response response = await http.get(
        'https://api.meetup.com/2/open_events?&sign=true&photo-host=public&country=in&city=bangalore&category=1&page=20&key=$meetupKey');
    // print(json.decode(response.body));
    Map<String, dynamic> map = json.decode(response.body);
    if (map['results'] != []) {
      map['results'].forEach((item) {
        EventItem tempItem = EventItem(
          name: item['name'],
          description: item['description'],
          time: DateTime.fromMillisecondsSinceEpoch(item['time']),
          eventUrl: item['event_url'],
          photoUrl: item['photo_url'],
          venueName: item['venue']['name'],
          city: item['venue']['city'],
          country: item['venue']['country'],
        );

        print(tempItem.time);
        // print(item['description']);
        // print(tempItem.venueName + ", " + tempItem.city);
        // print('--------------------------');
        meetupList.add(tempItem);
      });
      loading = false;
      print('Finish loading');
      notifyListeners();
    }
    loading = false;
    notifyListeners();
  }
}
