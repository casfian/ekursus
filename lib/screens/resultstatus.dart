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
              return Card(
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      width: 300,
                      child: Column(
                      children: [
                        Text(datapass[index]['NamaKursus']),
                        Text(datapass[index]['TarikhMula']),
                        Text(datapass[index]['TarikhTamat']),
                      ],
                    )),
                    Container(
                      padding: EdgeInsets.all(10),
                      width: 50,
                      child: Text(datapass[index]['StatusPermohonan'].toString()),
                    ),
                  ],
                ));
            }));
  }
}
