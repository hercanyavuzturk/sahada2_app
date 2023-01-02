import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sahada2_app/Services/global_variables.dart';

class Persistent
{
  static List<String> jobCategoryList = [
    'Stoper',
    'Sağ bek',
    'Sol bek',
    'Ortasaha',
    'Santrafor',
    'Sağ Kanat',
    'Sol Kanat',
    'Kaleci',

  ];

  void getMyData() async {
    final DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    name = userDoc.get('name');
    userImage = userDoc.get('userImage');

    }
  }
