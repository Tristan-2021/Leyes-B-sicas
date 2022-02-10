// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exmappleentity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExmappleEntity _$ExmappleEntityFromJson(Map<String, dynamic> json) =>
    ExmappleEntity(
      entero: json['entero'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$ExmappleEntityToJson(ExmappleEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'entero': instance.entero,
    };
