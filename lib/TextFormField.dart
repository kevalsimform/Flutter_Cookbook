import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'SignInUI/components/button.dart';
import 'SignInUI/components/signup_button.dart';
import 'SignInUI/constants.dart';

class DemoTextFormField extends StatefulWidget {
  const DemoTextFormField({Key? key}) : super(key: key);

  @override
  State<DemoTextFormField> createState() => _DemoTextFormFieldState();
}

class _DemoTextFormFieldState extends State<DemoTextFormField> {
  final _formKey = GlobalKey<FormState>();

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
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) { });
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) { });
    //TODO: difference and use case
    //keys and its types
    //validate with different text field
    //lifecycle
    //inherited widget how used
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 15, top: height * 0.12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          logoPath,
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
                      // height: 40,
                      child: TextFormField(
                        autofocus: true,
                        style: TextStyle(fontFamily: 'Roboto', fontSize: 15),
                        decoration: inputDecoration,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        onChanged: (value) {
                          email = value;
                        },
                        validator: (value) {
                          return (value != null && value.contains('@')) ? null : 'Invalid Email';
                        },
                        onTapOutside: (event) {
                          FocusScope.of(context).unfocus();
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
                      // height: 40,
                      child: TextFormField(
                        style: TextStyle(fontFamily: 'Roboto', fontSize: 15),
                        obscureText: showPassword,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        decoration: inputDecoration.copyWith(
                          suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  showPassword = !showPassword;
                                });
                              },
                              child: Icon(showPassword ? CupertinoIcons.eye_slash : Icons.remove_red_eye_outlined)),
                        ),
                        validator: (value) {
                          return (value != null && value.length >= 8) ? null : 'Invalid Password';
                        },
                        onChanged: (value) {
                          password = value;
                        },
                        onSaved: (String? value) {
                          print('ON SAVED CALLED');
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 30),
                child: ActionButton(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                    }
                  },
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Container(
                        color: Colors.grey.shade100,
                        height: 1,
                      ),
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

                      path: googleLogoPath,
                      title: 'Sign up with Google',
                      onTap: () {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 30),
                    child: SignUpButton(
                      path: appleLogoPath,
                      title: 'Sign up with Apple',
                      onTap: () {},
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
