import 'package:flutter/material.dart';

class DemoFlutterLogo extends StatefulWidget {
  const DemoFlutterLogo({Key? key}) : super(key: key);

  @override
  State<DemoFlutterLogo> createState() => _DemoFlutterLogoState();
}

class _DemoFlutterLogoState extends State<DemoFlutterLogo> {
  double size = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Logo'),),
      body: Center(child:
      InkWell(
        onTap: (){
          setState(() {
            if(size != 250){
              size = 250;
            }else{
              size = 100;
            }
          });
        },
        child: FlutterLogo(
          size: size,
        textColor: Colors.blue,
          style: FlutterLogoStyle.horizontal,
          duration: Duration(seconds: 2),
          curve: Curves.bounceOut,
        ),
      )),
    );
  }
}
