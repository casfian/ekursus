import 'package:ekursus/screens/resultstatus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Status extends StatelessWidget {
  Status({Key? key}) : super(key: key);

  final _nokpController = TextEditingController();
  late List kursus = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Status'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
          child: Column(
            children: [
              const Text('Masukkan IC:'),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  hoverColor: Colors.blue.shade100,
                  border: const OutlineInputBorder(),
                ),
                controller: _nokpController,
              ),
              ElevatedButton(
                  onPressed: () async {
                    print(_nokpController.text);
                    var url = Uri.parse(
                        'http://10.55.250.77/testapi2.php?action=semak');
                    var response = await http.post(url,
                        body: {'nokp': _nokpController.text.toString()});
                    print('Response status: ${response.statusCode}');
                    print('Response body: ${response.body}');

                    if (response.body == 'false') {
                      print('No data');
                      //show PopUp
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Alert!!"),
                            content: const Text("Tiada Data!"),
                            actions: <Widget>[
                              TextButton(
                                child: const Text("OK"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      var jsonResponse = convert.jsonDecode(response.body);
                      kursus = jsonResponse;

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ResultStatus(datapass: kursus)));
                    }
                  },
                  child: const Text('Semak'))
            ],
          ),
        ),
      ),
    );
  }
}
