import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project/pages/home.dart';
import 'package:project/pages/login.dart';
import 'package:project/pages/navigator.dart';
import 'package:project/pages/showcat.dart';

import '../auth_service.dart';

class Catregis extends StatefulWidget {
  const Catregis({super.key});

  @override
  State<Catregis> createState() => _CatregisState();
}

class _CatregisState extends State<Catregis> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _catname = TextEditingController();
  final TextEditingController _cattype = TextEditingController();
  final TextEditingController _catgender = TextEditingController();
  final TextEditingController _catAge = TextEditingController();
  String? status;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("ลงทะเบียนแมว"),
          ),
          backgroundColor: Color.fromARGB(255, 72, 172, 123),
        ),
        body: SafeArea(
            child: Align(
          alignment: AlignmentDirectional(0, -1),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Column(mainAxisSize: MainAxisSize.min, children: [
              Align(
                alignment: AlignmentDirectional(0, -0.95),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0, -1),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: Text(
                              'ลงทะเบียนแมว',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(255, 255, 51, 51)),
                          foregroundColor:
                              const MaterialStatePropertyAll(Colors.white)),
                      onPressed: () {
                        showlonfirmDialog();
                      },
                      child: Text("Logout"),
                    ),
                    Divider(
                      //เส้่น
                      thickness: 1,
                      indent: 50,
                      endIndent: 50,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ]),
            Image.asset(
              "images/logo.png",
              width: 300,
              height: 150,
            ),
            Align(
              alignment: AlignmentDirectional(-0.7, 1),
              child: Text(
                'ชื่อแมว :',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  height: 2,
                ),
              ),
            ),
            Align(
                alignment: AlignmentDirectional(0, 0),
                child: Container(
                  width: 280,
                  height: 40,
                  child: TextFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                    ),
                    controller: _catname,
                  ),
                )),
            Align(
              alignment: AlignmentDirectional(-0.7, 1),
              child: Text(
                'สายพันธุ์ :',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  height: 2,
                ),
              ),
            ),
            Align(
                alignment: AlignmentDirectional(0, 0),
                child: Container(
                  width: 280,
                  height: 40,
                  child: TextFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                    ),
                    controller: _cattype,
                  ),
                )),
            Align(
              alignment: AlignmentDirectional(-0.7, 1),
              child: Text(
                'เพศ :',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  height: 2,
                ),
              ),
            ),
            Align(
                alignment: AlignmentDirectional(0, 0),
                child: Container(
                  width: 280,
                  height: 40,
                  child: TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                      ),
                      controller: _catgender),
                )),
            Align(
              alignment: AlignmentDirectional(-0.7, 1),
              child: Text(
                'อายุ :',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  height: 2,
                ),
              ),
            ),
            Align(
                alignment: AlignmentDirectional(0, 0),
                child: Container(
                  width: 280,
                  height: 40,
                  child: TextFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                    ),
                    controller: _catAge,
                  ),
                )),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 16, 216, 33)),
                  foregroundColor:
                      const MaterialStatePropertyAll(Colors.white)),
              onPressed: () {
                showConfirmDialog();
              },
              child: Text("ยืนยัน"),
            )
          ]),
        )));
  }

  void showConfirmDialog() {
    var dialog = AlertDialog(
      title: const Text("ยืนยัน"),
      content: Text("ยืนยันการลงทะเบียน?"),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Back")),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(Color.fromARGB(255, 0, 170, 14)),
                foregroundColor: const MaterialStatePropertyAll(Colors.white)),
            onPressed: () {
              Registercat()
                  .catregister(_catname.text, _cattype.text, _catgender.text,
                      _catAge.text)
                  .then((value) => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => completelogin())));
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => completelogin()));
            },
            child: Text("ยืนยัน")),
      ],
    );
    showDialog(
      context: context,
      builder: (context) => dialog,
    );
  }

  void showlonfirmDialog() {
    var dialog = AlertDialog(
      title: const Text("Logout"),
      content: Text("ออกจากระบบ?"),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Back")),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.red[300]),
                foregroundColor: const MaterialStatePropertyAll(Colors.white)),
            onPressed: () {
              AuthService.logOutUser();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginForm()));
            },
            child: Text("logout")),
      ],
    );
    showDialog(
      context: context,
      builder: (context) => dialog,
    );
  }
}
