// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_type_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventTypeCardModel _$EventTypeCardModelFromJson(Map<String, dynamic> json) =>
    EventTypeCardModel(
      label: json['label'] as String,
      src: json['src'] as String,
      fontColor: json['fontColor'] as int?,
    );

Map<String, dynamic> _$EventTypeCardModelToJson(EventTypeCardModel instance) =>
    <String, dynamic>{
      'label': instance.label,
      'src': instance.src,
      'fontColor': instance.fontColor,
    };
