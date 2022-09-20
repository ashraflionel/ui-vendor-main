import 'package:cloud_firestore/cloud_firestore.dart';

String collection = "users";
FirebaseFirestore instance = FirebaseFirestore.instance;

//future

Future setDoc({required String docId, required Map<String, dynamic> data}) async {
  return await instance.collection(collection).doc(docId).set(data);
}

Future getDoc({required String docId}) async {
  return await instance.collection(collection).doc(docId).get();
}

Future updateDoc({required String docId, required Map<String, dynamic> data}) async {
  return await instance.collection(collection).doc(docId).update(data);
}

//stream
Stream<DocumentSnapshot<Map<String, dynamic>>> docSnapshot({required String docId}) async* {
  yield* instance.collection(collection).doc(docId).snapshots();
}
