import 'dart:convert';

import 'package:api_implement/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String pickedDate = 'Choose Date';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration Page"),
      ),
      body: Center(
        child: Column(
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage("lib/img/img_logo.JPG"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Enter your Name"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Enter your Email"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter your Password"),
              ),
            ),
            TextButton(
                onPressed: () {
                  DatePicker.showDatePicker(context,
                      minTime: DateTime(2000, 01, 01),
                      maxTime: DateTime(2100, 12, 31),
                      theme: DatePickerTheme(
                          headerColor: Colors.grey,
                          backgroundColor: Colors.white54.withOpacity(0.8)),
                      onChanged: (date) {
                    print(date);
                    pickedDate = date.toString();
                    setState(() {

                    });
                  });
                },
                child: Text(pickedDate)),
            ElevatedButton(
                onPressed: () {
                  registration();
                },
                child: Text("Sing Up")),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Text("Already have an account? Log In")),
          ],
        ),
      ),
    );
  }

  registration() {
    String name = nameController.text.toString();
    String email = emailController.text.toString().trim();
    String password = passwordController.text;

    var data = {"name": name, "email": email, "password": password};
    print(jsonEncode(data));
  }
}
