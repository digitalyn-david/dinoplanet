import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'clothes_record.g.dart';

abstract class ClothesRecord
    implements Built<ClothesRecord, ClothesRecordBuilder> {
  static Serializer<ClothesRecord> get serializer => _$clothesRecordSerializer;

  @nullable
  String get color;

  @nullable
  String get type;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ClothesRecordBuilder builder) => builder
    ..color = ''
    ..type = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('clothes');

  static Stream<ClothesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static ClothesRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      ClothesRecord(
        (c) => c
          ..color = snapshot.data['color']
          ..type = snapshot.data['type']
          ..reference = ClothesRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<ClothesRecord>> search(
          {String term,
          FutureOr<LatLng> location,
          int maxResults,
          double searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'clothes',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  ClothesRecord._();
  factory ClothesRecord([void Function(ClothesRecordBuilder) updates]) =
      _$ClothesRecord;

  static ClothesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createClothesRecordData({
  String color,
  String type,
}) =>
    serializers.toFirestore(
        ClothesRecord.serializer,
        ClothesRecord((c) => c
          ..color = color
          ..type = type));
