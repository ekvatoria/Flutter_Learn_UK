// ignore_for_file: prefer_interpolation_to_compose_strings, no_leading_underscores_for_local_identifiers
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'resource_model.g.dart';

String _fetchCustom(String data) {
  return 'aa';
}

@JsonSerializable()
class ResourceModel {
  List<Data>? data;

  ResourceModel({this.data});

  ResourceModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.pascal)
class Data extends Equatable {
  int? id;
  String? name;
  int? year;
  // @JsonKey(name: 'renk')
  String? color;
  @JsonKey(fromJson: _fetchCustom)
  String? pantoneValue;
  String? price;
  StatusCode? status;

  Data({this.id, this.name, this.year, this.color, this.pantoneValue, this.price, this.status});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    year = json['year'];
    color = json['color'];
    pantoneValue = json['pantone_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['year'] = year;
    data['color'] = color;
    data['pantone_value'] = pantoneValue;
    return data;
  }

  @override
  List<Object?> get props => [id, name, price];
}

enum StatusCode {
  @JsonValue(200)
  success,
  @JsonValue(500)
  weird,
}
