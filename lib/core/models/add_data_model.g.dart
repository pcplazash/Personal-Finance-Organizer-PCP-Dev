// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddNewDataAdapter extends TypeAdapter<AddNewData> {
  @override
  final int typeId = 1;

  @override
  AddNewData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddNewData(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, AddNewData obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.category)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.datetime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddNewDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
