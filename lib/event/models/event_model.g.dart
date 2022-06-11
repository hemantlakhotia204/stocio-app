// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventModel _$EventModelFromJson(Map<String, dynamic> json) => EventModel(
      title: json['title'] as String,
      desc: json['desc'] as String,
      postedByName: json['postedByName'] as String,
      postType: json['postType'] as String,
      postedTime: json['postedTime'] as String,
      edited: json['edited'] as bool?,
      eventType:
          (json['eventType'] as List<dynamic>).map((e) => e as String).toList(),
      collegeRef: json['collegeRef'] as String,
      userRef:
          (json['userRef'] as List<dynamic>?)?.map((e) => e as String).toList(),
      dateTime: json['dateTime'] as String?,
      location: json['location'] as String?,
      poster: json['poster'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$EventModelToJson(EventModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'desc': instance.desc,
      'postedByName': instance.postedByName,
      'postType': instance.postType,
      'postedTime': instance.postedTime,
      'edited': instance.edited,
      'eventType': instance.eventType,
      'collegeRef': instance.collegeRef,
      'userRef': instance.userRef,
      'dateTime': instance.dateTime,
      'location': instance.location,
      'poster': instance.poster,
      'images': instance.images,
    };
