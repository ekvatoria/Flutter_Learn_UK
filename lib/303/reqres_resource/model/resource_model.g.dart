// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResourceModel _$ResourceModelFromJson(Map<String, dynamic> json) =>
    ResourceModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResourceModelToJson(ResourceModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: (json['Id'] as num?)?.toInt(),
      name: json['Name'] as String?,
      year: (json['Year'] as num?)?.toInt(),
      color: json['Color'] as String?,
      pantoneValue: _fetchCustom(json['PantoneValue'] as String),
      price: json['Price'] as String?,
      status: $enumDecodeNullable(_$StatusCodeEnumMap, json['Status']),
    );

const _$StatusCodeEnumMap = {
  StatusCode.success: 200,
  StatusCode.weird: 500,
};
