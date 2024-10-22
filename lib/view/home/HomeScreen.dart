import 'package:flutter/material.dart';
import 'package:flutterexam/controller/contactController.dart';
import 'package:flutterexam/view/editScreen.dart';
import 'package:flutterexam/view/second/SecondScreen.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final ContactController contactController = Get.put(ContactController()); // Initialize controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffeab676),
        onPressed: () {
          Get.to(SecondScreen());
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xffeab676),
        title: Center(
          child: Text(
            'CONTACTS',
            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Obx(() {
        if (contactController.contactList.isEmpty) {
          return Center(child: Text("No contacts found."));
        } else {
          return ListView.builder(
            itemCount: contactController.contactList.length,
            itemBuilder: (context, index) {
              final contact = contactController.contactList[index];
              return ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                title: Text(contact.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                subtitle: Text('Phone: ${contact.phoneNumber}'),
                leading: CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.to(EditScreen(contact: contact));
                      },
                      icon: Icon(Icons.edit, color: Colors.green),
                    ),
                    IconButton(
                      onPressed: () {
                        contactController.deleteContact(contact.id!);
                      },
                      icon: Icon(Icons.delete, color: Colors.red),
                    ),
                  ],
                ),
              );
            },
          );
        }
      }),
    );
  }
}
