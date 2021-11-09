import 'package:ekursus/screens/bantuan.dart';
import 'package:ekursus/screens/katalog.dart';
import 'package:ekursus/screens/login.dart';
import 'package:ekursus/screens/profil.dart';
import 'package:ekursus/screens/status.dart';
import 'package:ekursus/widgets/myicon.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'eKursus',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: Drawer(
        child: Container(),
      ),
      body: Center(
        child: Stack(
          children: [
            SizedBox(
                width: double.maxFinite,
                height: double.maxFinite,
                child: Image.asset(
                  'images/bg.png',
                  fit: BoxFit.fill,
                )),
            Positioned(
              top: 165,
              left: -2,
              child: SizedBox(
                  width: 282,
                  height: 582,
                  child: Stack(
                    children: [
                      Image.asset(
                        'images/bulat.png',
                      ),
                      const Center(
                          child: Text(
                        'eKursus 3.0',
                        style: TextStyle(fontSize: 27, color: Colors.white),
                      )),
                      const Positioned(
                          top: 305,
                          left: 67,
                          child: Text(
                            'Mari kita berkursus',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          )),
                    ],
                  )),
            ),

            //menu
            Positioned(
              left: 165.0,
              top: 193.0,
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Katalog()));
                },
                child: MyIcon(
                  name: Icons.list,
                  myLabel: 'Katalog',
                ),
              ),
            ),
            Positioned(
              left: 239.0,
              top: 299.0,
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Status() ));
                },
                child: MyIcon(
                  name: Icons.person_outline,
                  myLabel: 'Status',
                ),
              ),
            ),
            Positioned(
              left: 258.0,
              top: 422.0,
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Profil() ));
                },
                child: MyIcon(
                  
                  name: Icons.person_search,
                  myLabel: 'Profil',
                ),
              ),
            ),
            Positioned(
              left: 213.0,
              top: 533.0,
              child: InkWell(
                onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Bantuan() ));
                  },
                child: MyIcon(
                  
                  name: Icons.info_outlined,
                  myLabel: 'Bantuan',
                ),
              ),
            ),
            Positioned(
              left: 139.0,
              top: 619.0,
              child: InkWell(
                onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Login() ));
                    },
                child: MyIcon(
                  
                  name: Icons.login,
                  myLabel: 'Login',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
