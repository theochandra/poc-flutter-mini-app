import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'my_model.g.dart';

@JsonSerializable()
class MyModel extends Equatable {
  final int id;
  final String title;
  final String body;

  const MyModel({
    required this.id,
    required this.title,
    required this.body,
  });

  factory MyModel.fromJson(Map<String, dynamic> json) =>
      _$MyModelFromJson(json);
  Map<String, dynamic> toJson() => _$MyModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        title,
        body,
      ];
}
