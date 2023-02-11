import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../ModelClass.dart';

class Fireprovider extends ChangeNotifier {
  TextEditingController name1 = TextEditingController();
  TextEditingController age1 = TextEditingController();
  TextEditingController phone1 = TextEditingController();
  final FirebaseFirestore db = FirebaseFirestore.instance;
  List<UserModel> modellist = [];

  Widget textfield({
    required String name,
    required String hint,
    required TextEditingController controller,
  }) {
    return Column(
      children: [
        Text(
          name,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: hint,
            ),
          ),
        ),
      ],
    );
  }

  void addData(String news, String id) {
    Map<String, Object> dataMap = HashMap();
    dataMap["name"] = name1.text;
    dataMap["age"] = age1.text;
    dataMap["phone"] = phone1.text;
    if (news == "edit") {
      db.collection("users").doc(id).update(dataMap);
    } else {
      db.collection("users").doc().set(dataMap);
    }
    notifyListeners();
  }

  Future<void> deleteData(String id) async {
    await db.collection("users").doc(id).delete();
    notifyListeners();
  }

  void getdataa() {
    modellist.clear();
    db.collection("users").get().then((value) {
      for (var element in value.docs) {
        Map<dynamic, dynamic> map = element.data();
        modellist.add(
          UserModel(
            map["name"].toString(),
            map["age"].toString(),
            map["phone"].toString(),
            element.id,
          ),
        );
      }
      notifyListeners();
    });
  }

  void updateDocument(String documentID) async {
    db.collection("users").doc(documentID).get().then(
      (value) {
        name1.text = value.get("name").toString();
        age1.text = value.get("age").toString();
        phone1.text = value.get("phone").toString();
        notifyListeners();
      },
    );
  }
}
