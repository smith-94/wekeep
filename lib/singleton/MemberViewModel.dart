import 'package:costbridge/vo/member/member.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';



//회원 가입하기 전에, 정보를 저장하기 위한 곳
@JsonSerializable()
class MemberStore{
  static MemberStore instance = MemberStore._internal();
  factory MemberStore() => instance;

  MemberStore._internal();

  int? id;
  int? companyId;
  bool? adminYn;
  String? userId;
  String? userPw;
  String? imgUrl;
  String? nickname;
  String? name;
  String? gender;
  String? birth;
  String? phone;
  String? address;
  String? email;
  String? authCode;
  String? status;

  static Map<String, dynamic> $MemberStoreToJson() => <String, dynamic>{
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
    'status': instance.status,
  };

  void setting(Member member){
    id = member.id;
    companyId = member.companyId;
    adminYn = member.adminYn;
    userId = member.userId;
    userPw = member.userPw;
    imgUrl = member.imgUrl;
    nickname = member.nickname;
    name = member.name;
    gender = member.gender;
    birth = member.birth;
    phone = member.phone;
    address = member.address;
    email = member.email;
    authCode = member.authCode;
    status = member.status;
  }

}
