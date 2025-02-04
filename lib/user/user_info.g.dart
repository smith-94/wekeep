// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => UserInfo(
      id: (json['id'] as num).toInt(),
      userId: json['userId'],
      userPw: json['userPw'],
      imgUrl: json['imgUrl'],
      nickName: json['nickName'],
      name: json['name'],
      gender: json['gender'],
      introduce: json['introduce'],
      birth: json['birth'],
      phone: json['phone'],
      address: json['address'],
      email: json['email'],
      authCode: json['authCode'],
      snsCode: json['snsCode'],
      status: json['status'],
      memo: json['memo'],
      gymId: json['gymId'],
      marketingConsen: json['marketingConsen'],
    )..deviceToken = json['deviceToken'] as String?;

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'userPw': instance.userPw,
      'imgUrl': instance.imgUrl,
      'nickName': instance.nickName,
      'name': instance.name,
      'gender': instance.gender,
      'introduce': instance.introduce,
      'birth': instance.birth,
      'phone': instance.phone,
      'address': instance.address,
      'email': instance.email,
      'authCode': instance.authCode,
      'snsCode': instance.snsCode,
      'status': instance.status,
      'memo': instance.memo,
      'gymId': instance.gymId,
      'marketingConsen': instance.marketingConsen,
      'deviceToken': instance.deviceToken,
    };
