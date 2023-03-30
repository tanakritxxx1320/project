import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Showcat extends StatefulWidget {
  const Showcat({super.key});

  @override
  State<Showcat> createState() => _ShowcatState();
}

class _ShowcatState extends State<Showcat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(children: [showRealtimeChange()]),
        ),
      ),
    );
  }

  Widget showRealtimeChange() {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(50, 5, 50, 0),
      child: Column(
        children: [
          Image.asset(
              "images/logo.png",
              width: 300,
              height: 150,
            ),
          const Text(
            "ข้อมูลแมว",
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 20,
            ),
          ),
          createRealTimeDate(),
          const Divider(),
        ],
      ),
    );
  }

  Widget createRealTimeDate() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("Catregister").snapshots(),
      builder: (context, snapshot) {
        print("แมว");
        print(snapshot.connectionState);
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          print(snapshot.data!.docs);
          return Column(
            children: createDataList(snapshot.data),
          );
        }
      },
    );
  }

  List<Widget> createDataList(QuerySnapshot<Map<String, dynamic>>? data) {
    List<Widget> widgets = [];
    widgets = data!.docs.map((doc) {
      var data = doc.data();
      print(data['Field']);
      return ListTile(
        onTap: () {
          print(doc.id);
          // ดึงข้อมูล มาแสดง เพื่อแก้ไข
        },
        title: Text("ชื่อแมว" +
            data['CatName'] +
            "       สายพันธุ์ " +
            data['Cattype'] +
            "      เพศ   " +
            data['Gender'] +
            "  อายุ " +
            data["Age"]),
      );
    }).toList();

    return widgets;
  }
}
