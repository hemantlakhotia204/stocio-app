import 'package:json_annotation/json_annotation.dart';

part 'institute_model.g.dart';

@JsonSerializable(explicitToJson: true)
class InstituteModel {
  // {instituteName(r), students(ref), professors(ref), abbr(r), {packType}(r), images(list)(if any), domainId(r)}

  final String? id;
  final String instituteName;
  final List<String>? students;
  final List<String>? professors;
  final String? abbr;
  final String? packType;
  final List<String>? images;
  final String domainId;

  InstituteModel(
      {this.id,
      required this.instituteName,
      this.students,
      this.professors,
      this.abbr,
      this.packType,
      this.images,
      required this.domainId});

  factory InstituteModel.fromJson(Map<String, dynamic> json) =>
      _$InstituteModelFromJson(json);

  Map<String, dynamic> toJson() => _$InstituteModelToJson(this);
}
