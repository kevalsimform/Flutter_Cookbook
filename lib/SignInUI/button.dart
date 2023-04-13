import 'package:flutter/material.dart';

import 'constants.dart';


class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.width,
    required this.height,
    required this.onTap,
    required this.isEnabled,
    required this.isBigger,
    required this.title
  });

  final double width;
  final double height;
  final void Function() onTap;
  final bool isEnabled;
  final bool isBigger;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: isBigger ? width * 0.9 :width * 0.55,
        height: MediaQuery.of(context).orientation == Orientation.landscape ? height * 0.09 : height* 0.07,
        decoration: BoxDecoration(
            color: isEnabled ? buttonColor : Colors.grey.shade100,
            borderRadius: BorderRadius.circular(height * .2)
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(),
              Text(title,style: TextStyle(fontSize: 23,fontWeight: FontWeight.w400,color: isEnabled ? buttonTitle : Colors.grey.shade500),),
              Icon(Icons.arrow_forward_ios_rounded,size: 10,weight: 30,
              color: isEnabled ? buttonTitle : Colors.grey.shade500,)
            ],
          ),
        ),
      ),
    );
  }
}