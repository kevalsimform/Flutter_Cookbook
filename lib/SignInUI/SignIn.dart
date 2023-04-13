import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import '/SignInUI/button.dart';
import '/SignInUI/signup_button.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String? email;
  String? password;
  bool showPassword = true;

  bool isEnabled() {
    if (email != null && password != null) {
      return email!.contains('@') && password!.length >= 8;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: height,
        width: width,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: height * 0.12,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'Assets/logo.png',
                          height: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Leafboard', style: titleStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 25, letterSpacing: .1)),
                      ],
                    ),
                  ),
                  Text('Work without limits', style: subTitleStyle),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 20, bottom: 0),
                    child: Text(
                      'Your email address',
                      style: subTitleStyle.copyWith(fontWeight: FontWeight.w500, letterSpacing: 0.1),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      height: 40,
                      child: TextField(
                        style: TextStyle(fontFamily: 'Roboto', fontSize: 15),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20, right: 20),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Colors.transparent)),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        onChanged: (value) {
                          email = value;
                          setState(() {
                            isEnabled();
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 20, bottom: 0),
                    child: Text(
                      'Choose a password',
                      style: subTitleStyle.copyWith(fontWeight: FontWeight.w500, letterSpacing: 0.1),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      height: 40,
                      child: TextField(
                        style: TextStyle(fontFamily: 'Roboto', fontSize: 15),
                        obscureText: showPassword,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  showPassword = !showPassword;
                                });
                              },
                              child: Icon(showPassword ? CupertinoIcons.eye_slash : Icons.remove_red_eye_outlined)),
                          contentPadding: EdgeInsets.only(left: 20, right: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                        ),
                        onChanged: (value) {
                          password = value;
                          setState(() {
                            isEnabled();
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 30),
                child: ActionButton(
                  width: width,
                  height: height,
                  onTap: () {},
                  isEnabled: isEnabled(),
                  isBigger: true,
                  title: 'Continue',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      color: Colors.grey.shade100,
                      width: width * 0.8,
                      height: 1,
                    ),
                    Container(
                      width: 50,
                      color: Colors.white,
                      child: Center(
                          child: Text(
                        'or',
                        style: TextStyle(color: Colors.grey, fontFamily: 'Roboto', fontSize: 15),
                      )),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25, left: 20, right: 20, bottom: 10),
                    child: SignUpButton(
                      width: width,
                      height: height,
                      path: 'Assets/google.png',
                      title: 'Sign up with Google',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 30),
                    child: SignUpButton(
                      width: width,
                      height: height,
                      path: 'Assets/apple.png',
                      title: 'Sign up with Apple',
                    ),
                  ),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

