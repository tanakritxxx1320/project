
import 'package:flutter/material.dart';
import 'package:project/pages/catregister.dart';
import 'package:project/pages/home.dart';
import 'package:project/pages/showcat.dart';


class completelogin extends StatefulWidget {
  const completelogin({super.key});

  @override
  State<completelogin> createState() => _completeloginState();
}

class _completeloginState extends State<completelogin> {
  int currentIndex = 0 ;
  List widgetOption = [
    HomePage(),
    Catregis(),
    Showcat(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: widgetOption[currentIndex], ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: 'หน้าหลัก'),
         BottomNavigationBarItem(icon: Icon(Icons.book_online),label: 'ลงทะเบียนแมว'),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: 'ข้อมูลแมว'),
      ],
      currentIndex: currentIndex,
      onTap: (index)=> setState(() => currentIndex = index ),),
    ) ;
  }
}
