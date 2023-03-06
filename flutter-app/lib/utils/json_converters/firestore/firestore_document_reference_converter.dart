// 📦 Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class FirestoreDocumentReferenceConverter
    implements JsonConverter<DocumentReference<Map<String, dynamic>>, DocumentReference<Map<String, dynamic>>> {
  const FirestoreDocumentReferenceConverter();

  @override
  DocumentReference<Map<String, dynamic>> fromJson(DocumentReference<Map<String, dynamic>> ref) {
    return ref;
  }

  @override
  DocumentReference<Map<String, dynamic>> toJson(DocumentReference<Map<String, dynamic>> ref) {
    return ref;
  }
}
