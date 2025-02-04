// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'costbilling.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CostBilling _$CostBillingFromJson(Map<String, dynamic> json) => CostBilling(
      (json['id'] as num).toInt(),
      (json['memberId'] as num).toInt(),
      json['memberName'] as String,
      json['productCategory'] as String,
      json['brand'] as String,
      json['costBillingStatus'] as String,
      json['price'] as String,
      json['imgUrl'] as String,
      json['reqProcessTime'],
      json['finProcessTime'],
      json['denyProcessTime'],
      json['companyName'] as String,
      json['deadType'] as String,
    );

Map<String, dynamic> _$CostBillingToJson(CostBilling instance) =>
    <String, dynamic>{
      'id': instance.id,
      'memberId': instance.memberId,
      'memberName': instance.memberName,
      'productCategory': instance.productCategory,
      'brand': instance.brand,
      'costBillingStatus': instance.costBillingStatus,
      'price': instance.price,
      'imgUrl': instance.imgUrl,
      'reqProcessTime': instance.reqProcessTime,
      'finProcessTime': instance.finProcessTime,
      'denyProcessTime': instance.denyProcessTime,
      'companyName': instance.companyName,
      'deadType': instance.deadType,
    };
