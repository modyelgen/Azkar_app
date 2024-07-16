// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'azan_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DateTimeEntityAdapter extends TypeAdapter<DateTimeEntity> {
  @override
  final int typeId = 0;

  @override
  DateTimeEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DateTimeEntity(
      readableDate: fields[0] as String?,
      hijriDay: fields[1] as String?,
      hijriYear: fields[3] as String?,
      hijriMonth: fields[2] as String?,
      azanTimes: (fields[4] as Map?)?.cast<String, dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, DateTimeEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.readableDate)
      ..writeByte(1)
      ..write(obj.hijriDay)
      ..writeByte(2)
      ..write(obj.hijriMonth)
      ..writeByte(3)
      ..write(obj.hijriYear)
      ..writeByte(4)
      ..write(obj.azanTimes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DateTimeEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
