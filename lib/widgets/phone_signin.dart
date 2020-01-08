import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class PhoneSignInSection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PhoneSignInSectionState();
}

class _PhoneSignInSectionState extends State<PhoneSignInSection> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _smsController = TextEditingController();

  String _message = '';
  String _verificationId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              child: Image.asset(
                'assets/images/phone_illustration.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Theme(
                    data: new ThemeData(
                      primaryColor: Color(0xFF5C63AB),
                    ),
                    child: TextFormField(
                      cursorColor: Theme.of(context).accentColor,
                      keyboardType: TextInputType.phone,
                      controller: _phoneNumberController,
                      decoration: InputDecoration(
                          labelText: 'Phone number (+x xxx-xxx-xxxx)',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0))),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Phone number (+x xxx-xxx-xxxx)';
                        }
                      },
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  alignment: Alignment.center,
                  child: RaisedButton(
                    elevation: 8.0,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: Color(0xFF5C63AB),
                    onPressed: () async {
                      _verifyPhoneNumber();
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.60,
                      padding: EdgeInsets.all(16.0),
                      child: Center(
                        child: const Text(
                          'Verify phone number',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Theme(
                    data: ThemeData(primaryColor: Color(0xFF29484C)),
                    child: TextField(
                      keyboardType: TextInputType.numberWithOptions(),
                      controller: _smsController,
                      decoration: InputDecoration(
                          labelText: 'Verification code',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0))),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  alignment: Alignment.center,
                  child: RaisedButton(
                    elevation: 8.0,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: Color(0xFF29484C),
                    onPressed: () async {
                      _signInWithPhoneNumber();
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
                          style: TextStyle(color: Color(0xFFFFFFFF)),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // Exmaple code of how to veify phone number
  void _verifyPhoneNumber() async {
    setState(() {
      _message = '';
    });
    final PhoneVerificationCompleted verificationCompleted =
        (FirebaseUser user) {
      setState(() {
        _message = 'signInWithPhoneNumber auto succeeded: $user';
      });
    };

    final PhoneVerificationFailed verificationFailed =
        (AuthException authException) {
      setState(() {
        _message =
            'Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}';
      });
    };

    final PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
      //     Scaffold.of(context).showSnackBar(SnackBar(
      //   content:
      //       const Text('Please check your phone for the verification code.'),
      // ));
      _verificationId = verificationId;
    };

    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      _verificationId = verificationId;
    };

    await _auth.verifyPhoneNumber(
        phoneNumber: _phoneNumberController.text,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }

  // Example code of how to sign in with phone.
  void _signInWithPhoneNumber() async {
    Navigator.pushNamed(context, '/first_onboarding');
    final AuthCredential credential = PhoneAuthProvider.getCredential(
      verificationId: _verificationId,
      smsCode: _smsController.text,
    );
    final FirebaseUser user = await _auth.signInWithCredential(credential);
    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);
    setState(() {
      if (user != null) {
        // _message = 'Successfully signed in, uid: ' + user.uid;
        print("Successful");
        Navigator.pushNamed(context, '/first_onboarding');
      } else {
        _message = 'Sign in failed';
      }
    });
  }
}
