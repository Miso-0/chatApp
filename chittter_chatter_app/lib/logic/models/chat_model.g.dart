// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChatAdapter extends TypeAdapter<Chat> {
  @override
  final int typeId = 0;

  @override
  Chat read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Chat()
      ..chatID = fields[0] as int
      ..messages = (fields[1] as List).cast<TextMessage>()
      ..unsentmessages = (fields[2] as List).cast<TextMessage>();
  }

  @override
  void write(BinaryWriter writer, Chat obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.chatID)
      ..writeByte(1)
      ..write(obj.messages)
      ..writeByte(2)
      ..write(obj.unsentmessages);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChatAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
