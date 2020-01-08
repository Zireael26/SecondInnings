import 'package:flutter/material.dart';
import 'package:hackathon_app/widgets/user_persona.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:hackathon_app/scoped_models/app_model.dart';

class FirstOnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, AppModel model) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            centerTitle: true,
            title: Text("Lets get you set up"),
          ),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 48.0),
                width: double.infinity,
                child: Text("I am...",
                    style: TextStyle(
                        fontSize: 112.0, fontWeight: FontWeight.w100)),
              ),
              InkWell(
                child: UserPersonaWidget("A War Veteran"),
                onTap: () => Navigator.pushReplacementNamed(
                    context, '/second_onboarding'),
              ),
              InkWell(
                child: UserPersonaWidget("A Retired Soldier"),
                onTap: () => Navigator.pushReplacementNamed(
                    context, '/second_onboarding'),
              ),
              InkWell(
                child: UserPersonaWidget("On Holiday"),
                onTap: () => Navigator.pushReplacementNamed(
                    context, '/second_onboarding'),
              ),
            ],
          ),
        );
      },
    );
  }
}
