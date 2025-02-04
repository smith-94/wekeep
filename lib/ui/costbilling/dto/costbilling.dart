import 'package:json_annotation/json_annotation.dart';

part 'costbilling.g.dart';

@JsonSerializable()
class CostBilling{
  int? id;
  int? memberId;
  String? memberName;
  String? productCategory;
  String? brand;
  String? costBillingStatus;
  String? price;
  String imgUrl;
  var reqProcessTime;
  var finProcessTime;
  var denyProcessTime;
  String? companyName;
  String? deadType;

  CostBilling(
  int this.id,
  int this.memberId,
  String this.memberName,
  String this.productCategory,
  String this.brand,
  String this.costBillingStatus,
  String this.price,
  String this.imgUrl,
  var this.reqProcessTime,
  var this.finProcessTime,
  var this.denyProcessTime,
  String this.companyName,
  String this.deadType
  );

  CostBilling.create(
      int this.memberId,
      String this.productCategory,
      String this.brand,
      String this.price,
      String this.imgUrl,
      String this.companyName,
      String this.deadType,
      var this.reqProcessTime
      );


  factory CostBilling.fromJson(Map<String, dynamic> json) {
    return  _$CostBillingFromJson(json);
  }
  static List<CostBilling> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => CostBilling.fromJson(json)).toList();
  }
  Map<String, dynamic> toJson() => _$CostBillingToJson(this);
}
