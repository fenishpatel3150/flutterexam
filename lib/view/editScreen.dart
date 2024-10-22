import 'package:flutter/material.dart';
import 'package:flutterexam/controller/contactController.dart';
import 'package:get/get.dart';

import '../model/contectmodel.dart';

class EditScreen extends StatelessWidget {
  final ContactController contactController = Get.find<ContactController>();

  late final Contact? contact;

  EditScreen({this.contact});

  final TextEditingController txtName = TextEditingController();
  final TextEditingController txtMob = TextEditingController();
  final TextEditingController txtEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (contact != null) {
      txtName.text = contact!.name;
      txtMob.text = contact!.phoneNumber;
      txtEmail.text = contact!.email;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffeab676),
        title: Text(
          contact == null ? 'Add Contact' : 'Edit Contact',
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
              if (contact == null) {
                // Add a new contact
                final newContact = Contact(
                  name: txtName.text,
                  phoneNumber: txtMob.text,
                  email: txtEmail.text,
                );
                contactController.addContact(newContact);
              } else {
                // Update the existing contact
                final updatedContact = Contact(
                  id: contact!.id,
                  name: txtName.text,
                  phoneNumber: txtMob.text,
                  email: txtEmail.text,
                );
                contactController.editContact(updatedContact);
              }
              Get.back(); // Go back to the previous screen
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
