import 'package:json_annotation/json_annotation.dart';

part 'user_info.g.dart';


@JsonSerializable()
class UserInfo {
  int id;
  var userId;
  var userPw;
  var imgUrl;
  var nickName;
  var name;
  var gender;
  var introduce;
  var birth;
  var phone;
  var address;
  var email;
  var authCode;
  var snsCode;
  var status;
  var memo;
  var gymId;
  var marketingConsen;
  String? deviceToken;

  UserInfo({
    required this.id,
    required this.userId,
    required this.userPw,
    required this.imgUrl,
    required this.nickName,
    required this.name,
    required this.gender,
    required this.introduce,
    required this.birth,
    required this.phone,
    required this.address,
    required this.email,
    required this.authCode,
    required this.snsCode,
    required this.status,
    required this.memo,
    required this.gymId,
    required this.marketingConsen,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) => _$UserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
}

// "id": 7,
// "userId": "member1",
// "userPw": "member1",
// "imgUrl": "",
// "nickname": "member1",
// "name": "member1",
// "gender": "M",
// "introduce": "member1",
// "birth": "",
// "phone": "",
// "address": "",
// "email": "",
// "authCode": "40",
// "snsCode": "0",
// "status": "10",
// "memo": "member1",
// "gymId": null
