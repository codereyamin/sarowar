import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Contact {
  Future contactMessage(String name, String email, String messages) async {
    final user = FirebaseFirestore.instance.collection('Contact').doc();
    // final json = {'name': 'name', 'email': 'email', 'messages': 'messages'};
    final inputData =
        ContactData(email: email, name: name, messages: messages, id: user.id);

    final data = inputData.toJason();
    await user.set(data);
  }
}

class ContactData {
  String id;
  String name;
  String email;
  String messages;
  ContactData(
      {this.id = '',
      required this.email,
      required this.messages,
      required this.name});

  Map<String, dynamic> toJason() => {
        'id': id,
        'name': name,
        'email': email,
        'message': messages,
      };
}
