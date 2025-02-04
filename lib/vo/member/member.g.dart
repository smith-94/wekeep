// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Member _$MemberFromJson(Map<String, dynamic> json) => Member(
      json['adminYn'] as bool?,
      (json['id'] as num?)?.toInt(),
      (json['companyId'] as num?)?.toInt(),
      json['userId'] as String?,
      json['userPw'] as String?,
      json['imgUrl'] as String?,
      json['nickname'] as String?,
      json['name'] as String?,
      json['gender'] as String?,
      json['birth'] as String?,
      json['phone'] as String?,
      json['grade'] as String?,
      json['address'] as String?,
      json['email'] as String?,
      json['authCode'] as String?,
      json['status'] as String?,
      json['mealVoteYn'] as bool?,
      json['mealVoteFlag'] as bool?,
    );

Map<String, dynamic> _$MemberToJson(Member instance) => <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'adminYn': instance.adminYn,
      'userId': instance.userId,
      'userPw': instance.userPw,
      'imgUrl': instance.imgUrl,
      'nickname': instance.nickname,
      'name': instance.name,
      'gender': instance.gender,
      'birth': instance.birth,
      'phone': instance.phone,
      'address': instance.address,
      'email': instance.email,
      'authCode': instance.authCode,
      'grade': instance.grade,
      'status': instance.status,
      'mealVoteYn': instance.mealVoteYn,
      'mealVoteFlag': instance.mealVoteFlag,
    };
