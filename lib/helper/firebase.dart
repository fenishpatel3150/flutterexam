
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/contectmodel.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String userId = FirebaseAuth.instance.currentUser!.uid;

  Future<void> syncContactsToFirestore(List<Contact> contacts) async {
    for (var contact in contacts) {
      await _firestore.collection('contacts').add(contact.toMap());
    }
  }

  Future<List<Contact>> fetchContactsFromFirestore() async {
    final snapshot = await _firestore.collection('contacts').get();
    return snapshot.docs.map((doc) => Contact.fromMap(doc.data())).toList();
  }
}
