import 'package:flutter/material.dart';
import 'package:flutter_cookbook/ButtonsAndClickables.dart';
import 'package:flutter_cookbook/flutterLogo.dart';
import 'package:flutter_cookbook/textField.dart';
import 'SignInUI/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      theme: ThemeData(
        primaryColor: Colors.redAccent,
        primarySwatch: Colors.blueGrey,
        fontFamily: 'dynaPuff',
          appBarTheme: AppBarTheme(color: Colors.blue,centerTitle: true),
        textTheme:  TextTheme(
          displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.w400),
          titleLarge: TextStyle(fontSize: 25.0, fontStyle: FontStyle.normal),
        ),
      ),
      darkTheme: ThemeData.dark(
        useMaterial3: true
      ),
      themeMode: ThemeMode.system,
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
    //height - MediaQuery.of(context).padding.top - kToolbarHeight) * 0.1
    // double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: Text('Cook Book',
        style: TextStyle(fontFamily: 'DynaPuff'),),centerTitle: true,shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),),
      body: SingleChildScrollView(child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              ElevatedButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DemoTextField()));
              }, child: Text('TextField',style: TextStyle(
                // fontStyle: FontStyle.italic,
                fontWeight: FontWeight.normal,
                fontSize: 20
              ),)),
              ElevatedButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DemoFlutterLogo()));
              }, child: Text('Flutter Logo')),
              ElevatedButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DemoButtonsAndClickables()));
              }, child: Text('Buttons And Clickables')),
              ElevatedButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OnboardingScreen()));
              }, child: Text('SignIn UI')),
            ],
          ),
        ),
      )),
    );
  }
}
