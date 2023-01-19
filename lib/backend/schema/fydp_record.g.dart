// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fydp_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FydpRecord> _$fydpRecordSerializer = new _$FydpRecordSerializer();

class _$FydpRecordSerializer implements StructuredSerializer<FydpRecord> {
  @override
  final Iterable<Type> types = const [FydpRecord, _$FydpRecord];
  @override
  final String wireName = 'FydpRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, FydpRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.sceneImage;
    if (value != null) {
      result
        ..add('sceneImage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  FydpRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FydpRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'sceneImage':
          result.sceneImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$FydpRecord extends FydpRecord {
  @override
  final String? sceneImage;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$FydpRecord([void Function(FydpRecordBuilder)? updates]) =>
      (new FydpRecordBuilder()..update(updates))._build();

  _$FydpRecord._({this.sceneImage, this.ffRef}) : super._();

  @override
  FydpRecord rebuild(void Function(FydpRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FydpRecordBuilder toBuilder() => new FydpRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FydpRecord &&
        sceneImage == other.sceneImage &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, sceneImage.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FydpRecord')
          ..add('sceneImage', sceneImage)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class FydpRecordBuilder implements Builder<FydpRecord, FydpRecordBuilder> {
  _$FydpRecord? _$v;

  String? _sceneImage;
  String? get sceneImage => _$this._sceneImage;
  set sceneImage(String? sceneImage) => _$this._sceneImage = sceneImage;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  FydpRecordBuilder() {
    FydpRecord._initializeBuilder(this);
  }

  FydpRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _sceneImage = $v.sceneImage;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FydpRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FydpRecord;
  }

  @override
  void update(void Function(FydpRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FydpRecord build() => _build();

  _$FydpRecord _build() {
    final _$result =
        _$v ?? new _$FydpRecord._(sceneImage: sceneImage, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
