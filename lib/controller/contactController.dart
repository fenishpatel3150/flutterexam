import 'package:flutterexam/helper/database.dart';
import 'package:flutterexam/helper/firebase.dart';
import 'package:flutterexam/model/contectmodel.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class ContactController extends GetxController {
  var contactList = <Contact>[].obs;
  var filteredContactList = <Contact>[].obs; // New observable list for filtered contacts
  final dbHelper = DatabaseHelper.instance;
  final firestoreService = FirestoreService();

  @override
  void onInit() {
    super.onInit();
    fetchContacts();
  }

  void fetchContacts() async {
    final contacts = await dbHelper.fetchContacts();
    contactList.assignAll(contacts);
    filteredContactList.assignAll(contacts);
  }

  void addContact(Contact contact) async {
    await dbHelper.insertContact(contact);
    contactList.add(contact);
    filteredContactList.add(contact); // Update filtered list
    await firestoreService.syncContactsToFirestore([contact]);
  }

  void editContact(Contact contact) async {
    await dbHelper.updateContact(contact);
    int index = contactList.indexWhere((c) => c.id == contact.id);
    if (index != -1) {
      contactList[index] = contact;
      filteredContactList[index] = contact;
    }
  }

  void deleteContact(int id) async {
    await dbHelper.deleteContact(id);
    contactList.removeWhere((contact) => contact.id == id);
    filteredContactList.removeWhere((contact) => contact.id == id);
  }

  void searchContacts(String query) {
    if (query.isEmpty) {
      filteredContactList.assignAll(contactList);
    } else {
      filteredContactList.assignAll(contactList.where((contact) {
        return contact.name.toLowerCase().contains(query.toLowerCase());
      }).toList());
    }
  }

  Future<void> syncAllContacts() async {
    await firestoreService.syncContactsToFirestore(contactList);
  }
}
