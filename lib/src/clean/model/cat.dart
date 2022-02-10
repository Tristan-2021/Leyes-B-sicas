import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'breed.dart';
import 'weight.dart';

part 'cat.g.dart';

@JsonSerializable()
class Cat extends Equatable {
  final String? id, url;
  final int? width, height;
  final List<Breed>? breeds;

  const Cat({this.width, this.height, this.id, this.url, this.breeds});
  factory Cat.fromJson(Map<String, dynamic> data) => _$CatFromJson(data);
  Map<String, dynamic> toJson() => _$CatToJson(this);

  @override
  List<Object?> get props => [id, url, width, height];
  static const empty = Cat(breeds: [
    Breed(weight: Weight()),
  ], id: '', url: '', width: 0, height: 0);
}
