
import 'package:json_annotation/json_annotation.dart';

part 'company.g.dart';

@JsonSerializable()
class Company{

  int? id;
  String? name;

  Company(
      this.id,
      this.name);

  factory Company.fromJson(Map<String, dynamic> json) {
    return  _$CompanyFromJson(json);
  }
  static List<Company> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Company.fromJson(json)).toList();
  }
  static List<String>? fromJsonListCompanyName(List<dynamic> jsonList) {
    return jsonList.map((json) => Company.fromJson(json).name!).toList();
  }
  static String convertString(Company Company){
    return _$CompanyToJson(Company).toString();
  }

}

