import 'package:flutter/material.dart';
import 'package:flutterexam/controller/contactController.dart';
import 'package:flutterexam/model/contectmodel.dart';
import 'package:get/get.dart';

class SecondScreen extends StatelessWidget {
  final ContactController contactController = Get.find<ContactController>();
  final TextEditingController txtName = TextEditingController();
  final TextEditingController txtMob = TextEditingController();
  final TextEditingController txtEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffeab676),
        title: Text(
          'Details',
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: txtName,
              decoration: InputDecoration(
                hintText: 'Enter your name ',
                prefixIcon: Icon(Icons.person, color: Colors.grey),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: txtMob,
              decoration: InputDecoration(
                hintText: 'Enter your Phone number ',
                prefixIcon: Icon(Icons.call, color: Colors.grey),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: txtEmail,
              decoration: InputDecoration(
                hintText: 'Enter your email ',
                prefixIcon: Icon(Icons.mail, color: Colors.grey),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              final contact = Contact(
                name: txtName.text,
                phoneNumber: txtMob.text,
                email: txtEmail.text,
              );
              contactController.addContact(contact);
              Get.back();
            },
            child: Container(
              height: 60,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xffeab676),
              ),
              child: Center(
                child: Text(
                  'Done',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
