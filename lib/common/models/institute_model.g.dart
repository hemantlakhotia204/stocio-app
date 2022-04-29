// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'institute_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InstituteModel _$InstituteModelFromJson(Map<String, dynamic> json) =>
    InstituteModel(
      instituteName: json['instituteName'] as String,
      students: (json['students'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      professors: (json['professors'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      abbr: json['abbr'] as String?,
      packType: json['packType'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      domainId: json['domainId'] as String,
    );

Map<String, dynamic> _$InstituteModelToJson(InstituteModel instance) =>
    <String, dynamic>{
      'instituteName': instance.instituteName,
      'students': instance.students,
      'professors': instance.professors,
      'abbr': instance.abbr,
      'packType': instance.packType,
      'images': instance.images,
      'domainId': instance.domainId,
    };
