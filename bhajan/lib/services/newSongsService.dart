import 'package:bhajan/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewSongsService {

  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Reference to bhajan collection
  static final newSongsColsRefs = _db
      .collection("/newSongs")
      .withConverter<Bhajan>(
          fromFirestore: (doc, _) => Bhajan.fromMap(doc.id, doc.data()!),
          toFirestore: (bhajan, _) => bhajan.toMap());
  
  
  

  /// Get all bhajans
  static Stream<List<Bhajan>> getBhajans() {
    final refProducts =
        newSongsColsRefs.snapshots();
    return refProducts.map((list) {
      return list.docs.map((doc) => doc.data()).toList();
    });
  }

  /// Get single bhajan by id
  static Future<Bhajan?> getBhajanById(String id) async {
    DocumentSnapshot<Bhajan> snap = await newSongsColsRefs.doc(id).get();
    return snap.data();
  }

  

}