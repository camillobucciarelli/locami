import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class TranslationsDataSource {
  CollectionReference<Map<String, dynamic>> _getCollection(
    String locale,
    String? country,
  ) {
    return FirebaseFirestore.instance.collection(country != null ? '${locale}_$country' : locale);
  }

  Future<Map<String, dynamic>> getStringsForLocale(
    String locale,
    String? country,
  ) async {
    final collection = _getCollection(locale, country);
    final snapshot = await collection.get();
    return snapshot.docs.first.data();
  }

  Future<void> saveStringsForLocale(
    String locale,
    String? country,
    Map<String, dynamic> strings,
  ) async {
    final collection = _getCollection(locale, country);
    for (final entry in strings.entries) {
      await collection.doc(entry.key).set(entry.value, SetOptions(merge: true));
    }
  }
}
