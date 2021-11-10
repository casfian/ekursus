import 'package:flutter/material.dart';

class ResultStatus extends StatelessWidget {
const ResultStatus({Key? key, required this.datapass}) : super(key: key);

final List datapass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Result Status'),
        ),
        body: ListView.builder(
            itemCount: datapass.length,
            itemBuilder: (context, index) {
              return Text(datapass[index]['NamaKursus']);
            }));
  }
}
