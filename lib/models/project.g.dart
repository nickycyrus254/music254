// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProjectAdapter extends TypeAdapter<Project> {
  @override
  final int typeId = 0;

  @override
  Project read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Project(
      id: fields[0] as String,
      title: fields[1] as String,
      artist: fields[2] as String,
      genre: fields[3] as String,
      mood: fields[4] as String,
      lyrics: fields[5] as String,
      beat: fields[6] as String,
      melody: fields[7] as String,
      voicePath: fields[8] as String,
      coverArtPath: fields[9] as String,
      createdAt: fields[10] as DateTime,
      updatedAt: fields[11] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Project obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.artist)
      ..writeByte(3)
      ..write(obj.genre)
      ..writeByte(4)
      ..write(obj.mood)
      ..writeByte(5)
      ..write(obj.lyrics)
      ..writeByte(6)
      ..write(obj.beat)
      ..writeByte(7)
      ..write(obj.melody)
      ..writeByte(8)
      ..write(obj.voicePath)
      ..writeByte(9)
      ..write(obj.coverArtPath)
      ..writeByte(10)
      ..write(obj.createdAt)
      ..writeByte(11)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
