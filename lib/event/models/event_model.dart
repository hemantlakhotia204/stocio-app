import 'package:json_annotation/json_annotation.dart';

part 'event_model.g.dart';

@JsonSerializable(explicitToJson: true)
class EventModel {
  final String title;
  final String desc;
  final String postedByName;
  final String postType;
  final String postedTime;
  final bool? edited;
  final List<String> eventType;
  final String collegeRef;
  final List<String>? userRef;
  final String? dateTime;
  final String? location;
  final String? poster;
  final List<String>? images;

  EventModel({
    required this.title,
    required this.desc,
    required this.postedByName,
    required this.postType,
    required this.postedTime,
    this.edited,
    required this.eventType,
    required this.collegeRef,
    this.userRef,
    this.dateTime,
    this.location,
    this.poster,
    this.images,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) => _$EventModelFromJson(json);

  Map<String, dynamic> toJson() => _$EventModelToJson(this);
}
