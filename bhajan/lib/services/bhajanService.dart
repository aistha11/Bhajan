import 'package:bhajan/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BhajanService {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Reference to bhajan collection
  static final bhajanColsRefs = _db.collection("/bhajan").withConverter<Bhajan>(
      fromFirestore: (doc, _) => Bhajan.fromMap(doc.id, doc.data()!),
      toFirestore: (bhajan, _) => bhajan.toMap());

  /// Get all bhajans
  static Stream<List<Bhajan>> getBhajans() {
    final refProducts = bhajanColsRefs.snapshots();
    return refProducts.map((list) {
      return list.docs.map((doc) => doc.data()).toList();
    });
  }

  /// Get single bhajan by id
  static Future<Bhajan?> getBhajanById(String id) async {
    DocumentSnapshot<Bhajan> snap = await bhajanColsRefs.doc(id).get();
    return snap.data();
  }
}
