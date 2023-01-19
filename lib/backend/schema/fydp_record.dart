import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'fydp_record.g.dart';

abstract class FydpRecord implements Built<FydpRecord, FydpRecordBuilder> {
  static Serializer<FydpRecord> get serializer => _$fydpRecordSerializer;

  String? get sceneImage;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(FydpRecordBuilder builder) =>
      builder..sceneImage = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('fydp');

  static Stream<FydpRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<FydpRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  FydpRecord._();
  factory FydpRecord([void Function(FydpRecordBuilder) updates]) = _$FydpRecord;

  static FydpRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createFydpRecordData({
  String? sceneImage,
}) {
  final firestoreData = serializers.toFirestore(
    FydpRecord.serializer,
    FydpRecord(
      (f) => f..sceneImage = sceneImage,
    ),
  );

  return firestoreData;
}
