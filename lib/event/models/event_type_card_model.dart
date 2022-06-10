import 'package:json_annotation/json_annotation.dart';

part 'event_type_card_model.g.dart';

@JsonSerializable(explicitToJson: true)
class EventTypeCardModel {

  final String label;
  final String src;
  final int? fontColor;

  EventTypeCardModel({required this.label, required this.src, this.fontColor});

  factory EventTypeCardModel.fromJson(Map<String, dynamic> json) => _$EventTypeCardModelFromJson(json);

  Map<String, dynamic> toJson() => _$EventTypeCardModelToJson(this);
}