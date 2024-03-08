import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testsdk/models/maternalprofile_model.dart';

class FirebaseService {
  final CollectionReference maternalProfilesCollection =
      FirebaseFirestore.instance.collection('MaternalProfile');

  Future<List<MaternalProfile>> getMaternalProfiles() async {
    try {
      QuerySnapshot querySnapshot = await maternalProfilesCollection.get();
      return querySnapshot.docs
          .map((doc) => MaternalProfile.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error fetching maternal profiles: $e');
      return [];
    }
  }
}
