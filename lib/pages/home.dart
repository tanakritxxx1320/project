import 'package:flutter/material.dart';
import 'package:project/pages/catregister.dart';
import 'package:project/pages/showcat.dart';

enum DrawerSections {
  dashboard,
  repair,
  repair_history,
  status,
  estimate,
  addinfo,
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _submitEnabled = true;
  DrawerSections currentPage = DrawerSections.dashboard;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 244, 104, 150),
        title: Text('หน้าหลัก'),
      ),
      drawer: Drawer(
        child: MyDrawerList(),
      ),
      body: Column(
          children: [
            Expanded(child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1,


              ),
               scrollDirection: Axis.vertical,
    children: [
       Image.asset(
              "images/abis.jpg",
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      ),
      Image.asset(
              "images/munkin.jpg",
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      ),
      Image.asset(
              "images/scott.jpg",
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      ),
      Text(
        'สายพันธุ์ "อบิสซีเนียน"',
        
      ),
      Text(
        'สายพันธุ์ "มันกิ้นส์"',
        
      ),
      Text(
        'สายพันธุ์ "สก๊อตติชโฟลด์"',
        
        
      ),
      Image.asset(
              "images/russian.jpg",
        width: 100,
        height: 100,
        fit: BoxFit.cover,
        
      ),
       Image.asset(
              "images/wichian.jpg",
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      ),
       Image.asset(
              "images/sphinx.jpg",
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      ),
      Text(
        'สายพันธุ์ "รัสเซียนบลู"',
        
      ),
      Text(
        'สายพันธุ์ "วิเชียรมาศ"',
        
      ),
      Text(
        'สายพันธุ์ "สฟิงซ์"',
        
        
      ),
        Image.asset(
              "images/rakdoll.jpg",
        width: 100,
        height: 100,
        fit: BoxFit.cover,
        
      ),
        Image.asset(
              "images/mencoon.jpg",
        width: 100,
        height: 100,
        fit: BoxFit.cover,
        
      ),
        Image.asset(
              "images/oxy.jpg",
        width: 100,
        height: 100,
        fit: BoxFit.cover,
        
      ),
        Text(
        'สายพันธุ์ "แร็คดอล"',
        
      ),
      Text(
        'สายพันธุ์ "เมนคูน"',
        
      ),
      Text(
        'สายพันธุ์ "อ็อกซี่"',
        
        
      ),


    ],)
              



              )
          ]


        
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey[50], // Use a custom color scheme
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "แถบเมนู",
              style: TextStyle(
                color: Color.fromARGB(
                    255, 235, 8, 8), // Use a custom font and color
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Divider(),
          SizedBox(height: 20.0),
          menuItem(
            1,
            "ข้อมูลแมวเจ้าของ",
            Icons.dashboard_outlined,
            currentPage == DrawerSections.dashboard ? true : false,
            () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Showcat(),
                ),
              );
            },
          ),
          SizedBox(height: 10.0),
          menuItem(
            2,
            "สายพันธุ์แมว",
            Icons.home_repair_service_outlined,
            currentPage == DrawerSections.repair ? true : false,
            () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },
          ),
          SizedBox(height: 10.0),
          menuItem(
            3,
            "ข้อมูลอาหาร",
            Icons.history_outlined,
            currentPage == DrawerSections.repair_history ? true : false,
            () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },
          ),
          SizedBox(height: 10.0),
          menuItem(
            4,
            "ลงทะเบียนแมว",
            Icons.view_list_rounded,
            currentPage == DrawerSections.status ? true : false,
            () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected,
      [Function()? onTap]) {
    return ListTile(
      leading: Icon(
        icon,
        color: selected ? Colors.blue : Colors.black,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: selected ? Colors.blue : Colors.black,
        ),
      ),
      selected: selected,
      onTap: onTap,
    );
  }
}
