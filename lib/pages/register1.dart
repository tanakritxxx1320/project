import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../auth_service.dart';

class Registerpages extends StatefulWidget {
  const Registerpages({super.key});

  @override
  State<Registerpages> createState() => _RegisterpagesState();
}

class _RegisterpagesState extends State<Registerpages> {
  final _fromkey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _tel = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _gmail = TextEditingController();
  String? status;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ลงทะเบียนผู้ใช้"),
        backgroundColor: Color.fromARGB(255, 240, 84, 190),
      ),
      body: Container(
        color: Color.fromARGB(255, 249, 249, 246),
        child: Form(
          key: _fromkey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  "REGISTER",
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Divider(
                thickness: 1,
                color: Colors.black87,
                indent: 50,
                endIndent: 50,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(50, 5, 50, 0),
                child: buildEmailInput(),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(50, 5, 50, 0),
                child: buildPasswordInput(),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(50, 5, 50, 0),
                child: buildNameInput(),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(50, 5, 50, 0),
                child: buildTelInput(),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(50, 5, 50, 0),
                child: buildEmailSignUp(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildEmailInput() {
    return TextFormField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 0, 255, 13),
          ),
        ),
        labelText: "Email",
      ),
      controller: _email,
      validator: (value) {
        if (value!.isEmpty) {
          return "กรุณากรอก Email";
        }
        return null;
      },
    );
  }

  TextFormField buildEmailuserInput() {
    return TextFormField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 0, 255, 13),
          ),
        ),
        labelText: "Username",
      ),
      controller: _username,
      validator: (value) {
        if (value!.isEmpty) {
          return "กรุณากรอก Username";
        }
        return null;
      },
    );
  }

  TextFormField buildPasswordInput() {
    return TextFormField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 0, 255, 13),
          ),
        ),
        labelText: "Password",
      ),
      controller: _password,
      validator: (value) {
        if (value!.isEmpty) {
          return "กรุณากรอก Password";
        }
        return null;
      },
      obscureText: true,
    );
  }

  Widget buildNameInput() {
    return TextFormField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 0, 255, 13),
          ),
        ),
        labelText: "Name",
      ),
      controller: _name,
      validator: (value) {
        if (value!.isEmpty) {
          return "กรุณากรอก ชื่อ";
        }
        return null;
      },
    );
  }

  Widget buildgmailInput() {
    return TextFormField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 0, 255, 13),
          ),
        ),
        labelText: "Email ที่ติดต่อได้",
      ),
      controller: _gmail,
    );
  }

  Widget buildTelInput() {
    return TextFormField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 16, 236, 166),
          ),
        ),
        labelText: "Telephone",
      ),
      controller: _tel,
      validator: (value) {
        if (value!.isEmpty) {
          return "กรุณากรอก เบอร์มือถือ";
        }
        return null;
      },
    );
  }

  Widget buildEmailSignUp() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: EmailAuthButton(
        text: "Sing Up",
        onPressed: () {
          AuthService()
              .signUpWithEmail(
                  _email.text, _password.text, _name.text, _tel.text)
              .then((value) => Navigator.pop(context));
        },
      ),
    );
  }

  buildGenderSignUp() {
    return Row(
      children: [
        Text(
          "Gender",
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 16,
          ),
        ),
        RadioListTile(
          title: Text("ชาย"),
          value: "ชาย",
          groupValue: status,
          onChanged: (value) {
            setState(() {
              status = value.toString();
            });
          },
        ),
        RadioListTile(
          title: Text("หญิง"),
          value: "หญิง",
          groupValue: status,
          onChanged: (value) {
            setState(() {
              status = value.toString();
            });
          },
        )
      ],
    );
  }
}
