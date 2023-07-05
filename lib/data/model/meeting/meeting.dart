import 'package:value_up/core/resource/enum_shop.dart';

class Meeting{

  bool? isCost;

  int? memberNumber;
  int? startAge;
  int? endAge;
  int? entryFee;

  String? title;
  String? location;
  String? questions;
  String? introduction;

  DateTime? meetingDateTime;

  MeetingSexType? sexType;
  MeetingRecruitType? recruitType;
  InterestType? interestType;

  String? costType;
  List<MeetingCostType>? costTypes;
}