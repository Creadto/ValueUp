import 'package:value_up/core/resource/enum_shop.dart';

class User{
  //false = male, true = female
  int? id;
  bool? sex;

  String? nickName;
  String? firstName;
  String? lastName;
  String? passportId;
  String? accessToken;
  LoginProviderType? provider;

  DateTime? birthDate;
  DateTime? issueDate;
  DateTime? expiryDate;
}