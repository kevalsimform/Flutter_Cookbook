
import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
    required this.width,
    required this.height,
    required this.path,
    required this.title,
  });

  final double width;
  final double height;
  final String path;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: width * 0.9,
        height: MediaQuery.of(context).orientation == Orientation.landscape ? height * 0.1 : height * 0.06,
        decoration:
        BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(height * .2), border: Border.all(color: Colors.grey.shade300)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                path,
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  title,
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}