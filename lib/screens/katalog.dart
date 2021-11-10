import 'package:ekursus/models/kursus.dart';
import 'package:flutter/material.dart';
//kita jadikan package yg diimport jadi alias
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Katalog extends StatefulWidget {
  @override
  State<Katalog> createState() => _KatalogState();
}

class _KatalogState extends State<Katalog> {
  //ne kita initialise data = kosong
  List<Kursus> arraykursus = []; //pakai class

  var url = Uri.parse('http://10.55.250.77/testapi2.php?action=kursus');

  Future<List<Kursus>> getData() async {
    var response = await http.get(url);
    var jsonResponse = convert.jsonDecode(response.body);

    //buat loop
    for (var u in jsonResponse) {
      Kursus _kursus = Kursus(
          u['IdKursus'],
          u['NamaKursus'],
          u['TempatKursus'],
          u['TarikhMula'],
          u['TarikhTamat'],
          u['BilPeserta'],
          u['KumpSasar'],
          u['KategoriKursus'],
          u['StatusKursus'],
          u['no_rujukan'].toString(),
          u['TarikhSurat'].toString(),
          u['start_time'].toString(),
          u['end_time'].toString(),
          u['tempat_daftar'].toString(),
          u['sign_pegawai'].toString(),
          u['Tarikhpengesahan'].toString(),
          u['upload_jadual'].toString(),
          u['flag_surat_edaran'],
          u['flag_penginapan'],
          u['catatan'],
          u['bil_hari'],
          u['flag_borang_penilaian'],
          u['created_at'],
          u['updated_at']);

      //tiap kali loop kita tambah ke array
      arraykursus.add(_kursus);
    }
    //return nanti adalah array yg lengkap
    return arraykursus;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog Kursus'),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            //kalau done kita papar data
            return ListView.builder(
                itemCount: snapshot.data == null ? 0 : snapshot.data.length,
                itemBuilder: (context, index) {
                  //convert snapshot ke array of type Kursus
                  List<Kursus> mydata = snapshot.data;

                  return Card(
                      child: Row(
                    children: [
                      Container(
                        width: 320,
                        padding: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                        // color: Colors.amber,
                        child: Column(
                          children: [
                            Text(mydata[index].NamaKursus),
                            Text(mydata[index].KumpSasar),
                            Text(mydata[index].TarikhMula),
                          ],
                        ),
                      ),
                      Container(
                        width: 100,
                        // color: Colors.orange,
                        child: Column(
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  //code
                                },
                                child: Text('Buka')),
                          ],
                        ),
                      )
                    ],
                  ));
                });
          } else
            //kalau tak siap kita kasi dia pusing pusing
            return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}











// import 'package:ekursus/models/kursus.dart';
// import 'package:flutter/material.dart';
// //kita jadikan package yg diimport jadi alias
// import 'package:http/http.dart' as http;
// import 'dart:convert' as convert;

// class Katalog extends StatefulWidget {
//   @override
//   State<Katalog> createState() => _KatalogState();
// }

// class _KatalogState extends State<Katalog> {
//   //List<Kursus> kursus = []; //pakai class

//   //ne kita initialise data = kosong
//   List kursus = []; //raw method

//   var url = Uri.parse('http://10.55.250.77/testapi2.php?action=kursus');

//   Future<void> getData() async {
//     var response = await http.get(url);
//     var jsonResponse = convert.jsonDecode(response.body);
//     setState(() {
//       kursus = jsonResponse;
//       print(kursus);
//     });
    
//   }

//   @override
//   void initState() {
//     super.initState();
//     getData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Katalog'),
//         ),
//         body: ListView.builder(
//             itemCount: kursus.length,
//             itemBuilder: (context, index) {
//               return Card(
//                   child: Padding(
//                 padding: const EdgeInsets.all(5.0),
//                 child: Row(
//                   children: [
//                     Container(
//                       width: 270,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(kursus[index].NamaKursus),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       width: 80,
//                       child: Column(
//                         children: [
//                           ElevatedButton(
//                               onPressed: () {
//                                 //code
//                               },
//                               child: Text('Buka')),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ));
//             }));
//   }
// }
