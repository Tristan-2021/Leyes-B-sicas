import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exmappleentity.g.dart';

@JsonSerializable()
class ExmappleEntity extends Equatable {
  final String? name;
  final int? entero;

  const ExmappleEntity({this.entero, this.name});
  factory ExmappleEntity.fromJson(Map<String, dynamic> map) =>
      _$ExmappleEntityFromJson(map);
  Map<String, dynamic> toJson() => _$ExmappleEntityToJson(this);
  @override
  List<Object?> get props => [name, entero];
}
