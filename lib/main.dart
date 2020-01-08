import 'package:flutter/material.dart';

import 'package:hackathon_app/pages/first_onboarding.dart';
import 'package:hackathon_app/pages/second_onboarding.dart';
import 'package:hackathon_app/pages/veteran.dart';
import 'package:hackathon_app/widgets/phone_signin.dart';
import 'package:hackathon_app/widgets/signout_button.dart';
import './pages/signin_page.dart';
import 'package:hackathon_app/scoped_models/app_model.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppModel model = AppModel();

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: model,
      child: MaterialApp(
        title: "HackBattle '19 App",
        home: MyHomePage(title: "HackBattle '19 App"),
        routes: {
          '/auth': (BuildContext context) => SignInPage(),
          '/first_onboarding': (BuildContext context) => FirstOnBoarding(),
          '/second_onboarding':(BuildContext context) => SecondOnBoarding(),
          '/phonelogin':(BuildContext context) => PhoneSignInSection(),
          '/veteran': (BuildContext context) => VeteransApp(model),
        },
        theme: ThemeData(
          fontFamily: 'Raleway',
          primaryColor: Colors.white,
          primaryColorLight: Color(0x9989C5CC),
          primaryColorDark: Color(0xFF89C5CC),
          accentColor: Color(0xFF89C5CC),
          bottomAppBarColor: Colors.purple[800],
          bottomAppBarTheme: BottomAppBarTheme(
              color: Colors.purple, shape: CircularNotchedRectangle()),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignInPage(),
    );
  }
}
