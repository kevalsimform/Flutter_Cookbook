  import 'package:flutter/material.dart';
import 'package:flutter_cookbook/SignInUI/SignIn.dart';
import 'package:flutter_cookbook/SignInUI/constants.dart';

import 'button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  void onButtonPressed(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignIn()));
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
        // decoration: BoxDecoration(
        //   image: DecorationImage(image: AssetImage('Assets/1.png',),fit: BoxFit.fill)
        // ),
        child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.center,

            children: [
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      height: height * 0.4,
                      decoration: BoxDecoration(
                          gradient: gradient,
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(width * 0.3),bottomRight: Radius.circular(width * 0.3))
                      ),
                    ),
                    SizedBox(height: height* 0.15,),
                    Text('Leafboard',style: titleStyle),
                    SizedBox(height: height* 0.03,),
                    Text('A platform built for a new way of working',style: subTitleStyle),
                    SizedBox(height: height * 0.15,),
                    ActionButton(width: width, height: height,onTap: onButtonPressed,isBigger: false,isEnabled: true,title: 'Get Started For Free',),
                    SizedBox(height: 30,)
                  ],
                ),
              ),
              Positioned(
                top: height * 0.3,
                left: MediaQuery.of(context).orientation == Orientation.portrait ? width * 0.35 : width * 0.45,
                right: MediaQuery.of(context).orientation == Orientation.portrait ? width * 0.35 : width * 0.45,
                child: Material(
                  elevation: 20,
                  shadowColor: Colors.white70,
                  borderRadius: BorderRadius.circular(height * 0.2),
                  child: Container(
                    height: MediaQuery.of(context).orientation == Orientation.portrait ? width * 0.3 : height * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(height * 0.2)
                    ),
                    child: CircleAvatar(
                      child: Image.asset('Assets/logo.png',height: height * 0.1,),
                      backgroundColor: Colors.grey.shade200,
                    ),
                  ),
                )

              )
             ],
          ),
        ),
      ),
    );
  }
}

