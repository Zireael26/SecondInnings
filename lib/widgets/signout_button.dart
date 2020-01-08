import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class SignOutButton extends StatefulWidget {
  @override
  _SignOutButtonState createState() => _SignOutButtonState();
}

class _SignOutButtonState extends State<SignOutButton> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: const Text('Sign out'),
      textColor: Theme.of(context).buttonColor,
      onPressed: () async {
        final FirebaseUser user = await _auth.currentUser();
        if (user == null) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: const Text('No one has signed in.'),
          ));
          return;
        }
        _signOut();
        final String uid = user.uid;
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(uid + ' has successfully signed out.'),
        ));
      },
    );
  }

  void _signOut() async {
    await _auth.signOut();
  }
}
