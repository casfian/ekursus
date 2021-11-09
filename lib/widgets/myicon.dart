import 'package:flutter/material.dart';

class MyIcon extends StatefulWidget {
  MyIcon(
      {Key? key,
      required this.name,
      required this.myLabel})
      : super(key: key);

  IconData name;
  String myLabel;

  @override
  State<MyIcon> createState() => _MyIconState();
}

class _MyIconState extends State<MyIcon> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: 69,
            height: 69,
            child: Stack(
              children: [
                Image.asset('images/circle.png'),
                Center(
                  child: Icon(
                    widget.name,
                    size: 35,
                    color: Colors.white38,
                  ),
                ),
                
              ],
            )),
        const SizedBox(
          width: 5,
        ),
        Text(
          widget.myLabel,
          style: const TextStyle(fontSize: 15, color: Colors.white),
        ),
      ],
    );
  }
}
