import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/svg.dart';
import 'package:letsplay/generated/assets.dart';
import 'package:letsplay/generated/l10n.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _isLoading = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Future<void> _login() async {
      setState(() {
        _isLoading = !_isLoading;
      });
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email.value.text,
          password: _password.value.text,
        );

        SnackBar(
          content: Text(S.of(context).authLoggedInSuccessfully),
        );

        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(S.of(context).authUserNotFound),
            ),
          );
        } else if (e.code == 'wrong-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(S.of(context).authWrongPassword),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(e.message),
            ),
          );
        }
      }
    }

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(S.of(context).loginButton),
      ),
      body: SingleChildScrollView(
        child: _isLoading
            ? CircularProgressIndicator()
            : Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SvgPicture.asset(
                      Assets.imagesCuteMilkshakeDog,
                      fit: BoxFit.scaleDown,
                      clipBehavior: Clip.none,
                      semanticsLabel: S.of(context).loginPageIllustrationLabel,
                    ),
                    Container(
                      height: 100,
                      child: Center(
                        child: Text(
                          S.of(context).loginButton,
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                                fontSize: 44,
                              ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: TextFormField(
                        controller: _email,
                        style: Theme.of(context).textTheme.bodyText2,
                        decoration: InputDecoration(
                          labelStyle: Theme.of(context).textTheme.bodyText2,
                          hintStyle: Theme.of(context).textTheme.bodyText2,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color:
                                  Theme.of(context).textTheme.bodyText2.color,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color:
                                  Theme.of(context).textTheme.bodyText2.color,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color:
                                  Theme.of(context).textTheme.bodyText2.color,
                            ),
                          ),
                          focusColor:
                              Theme.of(context).textTheme.bodyText2.color,
                          labelText: S.of(context).emailLabel,
                          hintText: S.of(context).emailHint,
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return S.of(context).loginPagerGenericEmptyField;
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: TextFormField(
                        controller: _password,
                        obscureText: true,
                        style: Theme.of(context).textTheme.bodyText2,
                        decoration: InputDecoration(
                          labelStyle: Theme.of(context).textTheme.bodyText2,
                          hintStyle: Theme.of(context).textTheme.bodyText2,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color:
                                  Theme.of(context).textTheme.bodyText2.color,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color:
                                  Theme.of(context).textTheme.bodyText2.color,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color:
                                  Theme.of(context).textTheme.bodyText2.color,
                            ),
                          ),
                          focusColor:
                              Theme.of(context).textTheme.bodyText2.color,
                          labelText: S.of(context).passwordLabel,
                          hintText: S.of(context).passwordHint,
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return S.of(context).loginPagerGenericEmptyField;
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: FlatButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              _isLoading = true;
                            });
                            _login();
                          }
                        },
                        child: Text(
                          S.of(context).loginButton,
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                                fontSize: 25,
                              ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      S.of(context).loginPagerNewUser,
                      style: Theme.of(context).textTheme.bodyText2.copyWith(
                            fontSize: 14,
                          ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
