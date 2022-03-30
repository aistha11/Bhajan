import 'package:bhajan_admin/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BhajanService {

  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Reference to bhajan collection
  static final bhajanColsRefs = _db
      .collection("/bhajan")
      .withConverter<Bhajan>(
          fromFirestore: (doc, _) => Bhajan.fromMap(doc.id, doc.data()!),
          toFirestore: (bhajan, _) => bhajan.toMap());
  
  
  static Future<void> createBhajan(Bhajan bhajan) async {
    await bhajanColsRefs.add(bhajan);
  }

  /// Get all bhajans
  static Stream<List<Bhajan>> getBhajans() {
    final refProducts =
        bhajanColsRefs.snapshots();
    return refProducts.map((list) {
      return list.docs.map((doc) => doc.data()).toList();
    });
  }

  /// Get single bhajan by id
  static Future<Bhajan?> getBhajanById(String id) async {
    DocumentSnapshot<Bhajan> snap = await bhajanColsRefs.doc(id).get();
    return snap.data();
  }

  // U - update according to new bhajan
  static Future<void> updateBhajan(Bhajan bhajan) {
    return bhajanColsRefs
        .doc(bhajan.id)
        .set(bhajan, SetOptions(merge: true));
  }


  /// Delete a bhajan
  /// Takes an id of a bhajan
  static Future<void> deleteBhajan(String id) {
    return bhajanColsRefs.doc(id).delete();
  }

}