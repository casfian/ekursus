import 'package:ekursus/models/kursus.dart';
import 'package:flutter/material.dart';

class Katalog extends StatelessWidget {
  List<Kursus> kursus = [
    Kursus('Kursus Binadiri', 'Seremban', 'Gred29 keatas', 'Utk Binadiri anda',
        '50', 'tiada penginapan', '20 Nov 2021', '15 Nov 2021'),
    Kursus('Kursus Flutter', 'Nilai', 'Gred30 keatas', 'Utk belajar Flutter',
        '10', 'tiada penginapan', '10 Nov 2021', '1 Nov 2021'),
    Kursus('Kursus Web', 'KL', 'Gred42 keatas', 'Utk belajar Buat Web', '8',
        'tiada penginapan', '15 Nov 2021', '11 Nov 2021'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Katalog'),
        ),
        body: ListView.builder(
            itemCount: kursus.length,
            itemBuilder: (context, index) {
              return Card(
                  child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Container(
                      width: 270,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            kursus[index].nama,
                            style:
                                const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text('Objectif: ${kursus[index].objektif}'),
                          Text('Tarikh Kursus: ${kursus[index].tarikh}'),
                          Text('Tarikh Akhir Mohon: ${kursus[index].tarikhakhirpemohonan}'),
                        ],
                      ),
                    ),
                    Container(
                      width: 80,
                      child: Column(
                        children: [
                          ElevatedButton(onPressed: () {
                            //code
                          }, 
                          child: Text('Buka')),
                        ],
                      ),
                    ),
                  ],
                ),
              ));
            }));
  }
}
