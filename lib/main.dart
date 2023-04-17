import 'package:flutter/material.dart';
import 'package:flutter_cookbook/ButtonsAndClickables.dart';
import 'package:flutter_cookbook/flutterLogo.dart';
import 'package:flutter_cookbook/textField.dart';
import 'SignInUI/constants.dart';
import 'SignInUI/screens/onboarding.dart';
import 'TextFormField.dart';
import 'focusScope.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // primaryColor: Colors.redAccent,
        // primarySwatch: Colors.blueGrey,
        fontFamily: 'Dongle',
        // appBarTheme: AppBarTheme(color: Colors.blue, centerTitle: true),
        textTheme: TextTheme(
          displayLarge: TextStyle(fontSize: 50.0, fontWeight: FontWeight.w400),
          titleLarge: TextStyle(fontSize: 25.0, fontStyle: FontStyle.normal),
        ),
        buttonTheme: ButtonThemeData(),
      ),
      darkTheme: ThemeData.dark().copyWith(
        brightness: Brightness.dark
        // primaryColor: Colors.red
        //   fontFamily: 'Dongle',
        //   // appBarTheme: AppBarTheme(color: Colors.blue, centerTitle: true),
        //   textTheme: TextTheme(
        //     displayLarge: TextStyle(fontSize: 50.0, fontWeight: FontWeight.w400),
        //     titleLarge: TextStyle(fontSize: 25.0, fontStyle: FontStyle.normal),
        //   ),
        //   buttonTheme: ButtonThemeData(),
        // buttonTheme: ButtonThemeData(buttonColor: Colors.grey,colorScheme: ColorScheme.dark())
      ),
      themeMode: ThemeMode.dark,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    Theme(data: ThemeData(),
    child: Text(''),);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cook Book',
          style: TextStyle(fontFamily: 'Dongle', fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20))),
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => DemoTextField()));
                  },
                  child: Text(
                    'TextField',
                    style: TextStyle(
                        // fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.normal,
                        fontSize: 20),
                  )),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => DemoFlutterLogo()));
                  },
                  child: Text(
                    'Flutter Logo',
                    style: TextStyle(fontSize: 20),
                  )),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => DemoButtonsAndClickables()));
                  },
                  child: Text(
                    'Buttons And Clickables',
                    style: TextStyle(fontSize: 20),
                  )),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => OnboardingScreen()));
                  },
                  child: Text(
                    'SignIn UI',
                    style: TextStyle(fontSize: 20),
                  )),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => DemoTextFormField()));
                  },
                  child: Text(
                    'Text Form Field',
                    style: TextStyle(fontSize: 20),
                  )),
              // ElevatedButton(
              //     onPressed: () {
              //       Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyStatefulWidget()));
              //     },
              //     child: Text(
              //       'Focus Scope',
              //       style: TextStyle(fontSize: 25),
              //     )),

            ],
          ),
        ),
      )),
    );
  }
}
