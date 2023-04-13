import 'dart:math';

import 'package:flutter/material.dart';

class DemoButtonsAndClickables extends StatefulWidget {
  const DemoButtonsAndClickables({Key? key}) : super(key: key);

  @override
  State<DemoButtonsAndClickables> createState() => _DemoButtonsAndClickablesState();
}

int? value;

enum Status { Paid, Due }

Status radioValue = Status.Paid;

class _DemoButtonsAndClickablesState extends State<DemoButtonsAndClickables> {
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buttons & Clickables'),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                print('Icon Button Pressed');
              },
              icon: Icon(
                Icons.account_balance_sharp,
              ),
              iconSize: 30,
              padding: EdgeInsets.all(5),
              splashRadius: 30,
              color: Colors.blueGrey,
              tooltip: 'Icon Button',
              isSelected: true,
              selectedIcon: Icon(Icons.ac_unit),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
              onPressed: () {
                print('outlined button pressed');
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => DraggableWidget()));
              },
              onLongPress: () {
                print('LONG PRESS : Outlined Button');
              },
              onHover: (value) {
                print('HOVER : Outlined Button $value');
              },
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                overlayColor: MaterialStateProperty.all(Colors.orange),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                backgroundColor: MaterialStateProperty.all(Colors.teal),
              ),
              child: Text('Outlined Button'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: () {}, child: Text('Elevated Button')),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              onPressed: () {},
              child: Text(
                'Material Button',
              ),
              textColor: Colors.white,
              height: 38,
              color: Colors.grey,
              disabledColor: Colors.orange,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.grey)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton(
                  value: value,
                  items: [1, 2, 3, 4, 5].map((e) => DropdownMenuItem(value: e, child: Center(child: Text('$e')))).toList(),
                  onChanged: (onChanged) {
                    setState(() {
                      value = onChanged;
                    });
                  },
                  hint: Text('DropDown'),
                  style: TextStyle(color: Colors.redAccent),
                  underline: Container(),
                  icon: Icon(Icons.arrow_circle_down_rounded),
                  isDense: true,
                  isExpanded: false,
                  focusColor: Colors.red,
                  alignment: Alignment.center,
                ),
              ),
            ),
          ),
          ListTile(
            leading: Radio(
                value: Status.Paid,
                groupValue: radioValue,
                onChanged: (onChanged) {
                  setState(() {
                    radioValue = onChanged!;
                  });
                  print(onChanged);
                }),
            title: Text('Paid'),
          ),
          ListTile(
            leading: Radio(
                value: Status.Due,
                groupValue: radioValue,
                onChanged: (onChanged) {
                  print(onChanged);
                  setState(() {
                    radioValue = onChanged!;
                  });
                }),
            title: Text('Due'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PopupMenuButton(
              initialValue: 20,
              icon: Icon(Icons.view_comfy_alt_outlined,size: 40,color: Colors.blueGrey,),
              onSelected: (value) {
                print(value);
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 10,
                  child: Text("First"),
                ),
                PopupMenuItem(
                  value: 20,
                  child: Text("Second"),
                ),
                PopupMenuItem(
                  value: 30,
                  child: Text("Third"),
                ),
                PopupMenuItem(
                  value: 40,
                  child: Text("Fourth"),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                focusColor: Colors.redAccent,
                onTapDown: (details) {
                  print('TAP DOWN : ${details.kind}');
                },
                onTap: () {
                  print('on tap');
                },
                onTapUp: (details) {
                  print('TAP Up : ${details.globalPosition}');
                },
                focusNode: focusNode,
                autofocus: true,
                child: Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.teal,
                    ),
                    child: Center(
                        child: Text(
                      'InkWell Widget',
                      style: TextStyle(color: Colors.white),
                    )))),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTapCancel: () {
                  print('tap cancelled');
                },
                onDoubleTap: () {
                  print('double tap');
                },
                onVerticalDragStart: (details) {
                  print('on vertical drag start ${details.globalPosition}');
                },
                onVerticalDragEnd: (details) {
                  print('on vertical drag end ${details.velocity.pixelsPerSecond.distanceSquared}');
                },
                child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.teal,
                    ),
                    child: Center(
                        child: Text(
                      'Gesture Detector ',
                      style: TextStyle(color: Colors.white),
                    )))),
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        tooltip: 'add button',
        hoverElevation: 10,
        hoverColor: Colors.teal,
        child: Icon(Icons.add),
        onPressed: () {},
        mini: true,
      ),
    );
  }
}

class DraggableWidget extends StatefulWidget {
  const DraggableWidget({Key? key}) : super(key: key);

  @override
  State<DraggableWidget> createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  double top = 100.0;
  double left = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Draggable'),
      ),
      body: Stack(
        children: [
          Positioned(
              top: top,
              left: left,
              child: GestureDetector(
                onPanUpdate: (details) {
                  top = max(0, top + details.delta.dy);
                  left = max(0, left + details.delta.dx);
                  setState(() {});
                },
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.redAccent,

                  ),
                  child: Center(
                    child: Text(
                      'Drag Me',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
