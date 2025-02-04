
import 'package:json_annotation/json_annotation.dart';

part 'member.g.dart';

@JsonSerializable()
class Member{

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
  String? grade;
  String? status;
  bool? mealVoteYn;
  bool? mealVoteFlag;

  Member(
      this.adminYn,
      this.id,
      this.companyId,
      this.userId,
      this.userPw,
      this.imgUrl,
      this.nickname,
      this.name,
      this.gender,
      this.birth,
      this.phone,
      this.grade,
      this.address,
      this.email,
      this.authCode,
      this.status,
      this.mealVoteYn,
      this.mealVoteFlag
      );

  factory Member.fromJson(Map<String, dynamic> json) {
    return  _$MemberFromJson(json);
  }
  static List<Member> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Member.fromJson(json)).toList();
  }
  static String convertString(Member member){
    return _$MemberToJson(member).toString();
  }
  Map<String, dynamic> toJson() =>
      {
        'adminYn' : adminYn,
        'id' : id,
        'companyId' : companyId,
        'userId' : userId,
        'userPw' : userPw,
        'imgUrl' : imgUrl,
        'nickname' : nickname,
        'name' : name,
        'gender' : gender,
        'birth' : birth,
        'phone' : phone,
        'address' : address,
        'email' : email,
        'authCode' : authCode,
        'status' : status,
        'mealVoteYn' : mealVoteYn,
        'mealVoteFlag' : mealVoteFlag,
      };

}
