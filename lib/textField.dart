import 'package:flutter/material.dart';

class DemoTextField extends StatefulWidget {
  const DemoTextField({Key? key}) : super(key: key);

  @override
  State<DemoTextField> createState() => _DemoTextFieldState();
}

class _DemoTextFieldState extends State<DemoTextField> {
  @override
  Widget build(BuildContext context) {
    String status = '';
    FocusNode focusNode1 = FocusNode();
    TextEditingController controller = TextEditingController(text: 'hello');
    return Scaffold(
        appBar: AppBar(
          title: Text('TextField'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  readOnly: false,
                  autocorrect: false,
                  obscureText: false,
                  autofocus: true,
                  // focusNode: focusNode1,
                  onChanged: (value) {
                    print(value);
                  },
                  onEditingComplete: () {
                    print('editing completed');
                  },
                  onSubmitted: (value) {
                    print('submitted : $value');
                  },
                  onTap: () {
                    print('tapped on textField');
                  },
                  onTapOutside: (event) {
                    print('tappped outside : ${event}');
                  },
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () {
                  FocusScope.of(context).requestFocus(focusNode1);
                  FocusScope.of(context);
                },
                child: Text('Focus on next textField'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                child: TextField(
                  readOnly: false,
                  autocorrect: false,
                  obscureText: false,
                  focusNode: focusNode1,
                  controller: controller,
                  onChanged: (value) {
                    print(value);

                  },
                  onEditingComplete: () {
                    print('editing completed');
                  },
                  onSubmitted: (value) {
                    print('submitted : $value');
                  },
                  onTap: () {
                    print('tapped on textField');
                  },
                  onTapOutside: (event) {
                    focusNode1.unfocus();
                    print('tappped outside : ${event}');
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: TextField(
                  decoration: InputDecoration.collapsed(hintText: 'say something...'),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: TextField(
                    decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.abc),
                  label: Text('lable'),
                  hintText: 'hint text',
                  errorText: 'this is error text',
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  floatingLabelAlignment: FloatingLabelAlignment.center,
                )),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: TextField(
                  decoration: InputDecoration(
                      helperText: 'this is helper text',
                      prefixIcon: Icon(Icons.present_to_all_rounded),
                      suffixIcon: Icon(Icons.present_to_all_rounded),
                      counterText: 'counter text',
                      focusColor: Colors.red,
                      hoverColor: Colors.green,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      enabled: true),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: TextField(
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.search,

                ),
              ),
            ],
          ),
        ));
  }
}
