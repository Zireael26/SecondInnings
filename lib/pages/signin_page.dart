import 'package:flutter/material.dart';

import '../widgets/anonymously_signin.dart';
import '../widgets/goog_signin.dart';

class SignInPage extends StatefulWidget {
  final String title = 'Registration';
  @override
  State<StatefulWidget> createState() => SignInPageState();
}

class SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context) {
      return Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              child: Image.asset(
                'assets/images/login_illustration.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: <Widget>[
                Text(
                  'Second Innings',
                  style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w700),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Lorem Ipsum dolor seit hi hello',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w300),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 24.0,
                ),
                AnonymouslySignInSection(),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 1.0,
                        color: Color(0x1f0D0F2D),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 16.0,
                      ),
                      child: Text('OR'),
                    ),
                    Expanded(
                      child: Container(
                        height: 1.0,
                        color: Color(0x1f0D0F2D),
                      ),
                    ),
                  ],
                ),
                GoogleSignInSection(),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  alignment: Alignment.center,
                  child: RaisedButton(
                    elevation: 8.0,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: Color(0xFFFFFFFF),
                    onPressed: () async {
                      Navigator.pushNamed(context, '/phonelogin');
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.60,
                      padding: EdgeInsets.all(16.0),
                      child: Center(
                        child: const Text(
                          'Sign in with phone number',
                          style: TextStyle(color: Color(0xFF0B0D38)),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
