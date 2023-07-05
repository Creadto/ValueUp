import 'package:flutter/material.dart';
import 'package:value_up/core/resource/palette.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

class FilterBottomSheet {
  FilterBottomSheet({
    required this.context,
  }) {
    showFilterBottomSheet(context);
  }
  final BuildContext context;

  ///
  /// For Filter Variables
  ///
  String? filterDateRange;
  String? filterTimeRange;
  DateTimeRange selectedDateRange =
  DateTimeRange(start: DateTime.now(), end: DateTime.now());
  DateTime filterStartTime = DateTime.now();
  DateTime filterEndTime = DateTime.now();

  bool _isMonSelected = false;
  Color _monBackColor = Colors.white;
  Color _monForeColor = Colors.grey;
  bool _isTueSelected = false;
  Color _tueBackColor = Colors.white;
  Color _tueForeColor = Colors.grey;
  bool _isWedSelected = false;
  Color _wedBackColor = Colors.white;
  Color _wedForeColor = Colors.grey;
  bool _isThurSelected = false;
  Color _thurBackColor = Colors.white;
  Color _thurForeColor = Colors.grey;
  bool _isFriSelected = false;
  Color _friBackColor = Colors.white;
  Color _friForeColor = Colors.grey;
  bool _isSatSelected = false;
  Color _satBackColor = Colors.white;
  Color _satForeColor = Colors.grey;
  bool _isSunSelected = false;
  Color _sunBackColor = Colors.white;
  Color _sunForeColor = Colors.grey;

  bool _isAllCategorySelected = false;
  Color _allCategoryBackColor = Colors.white;
  Color _allCategoryForeColor = Colors.grey;
  bool _isCultureSelected = false;
  Color _cultureBackColor = Colors.white;
  Color _cultureForeColor = Colors.grey;
  bool _isActivitySelected = false;
  Color _activityBackColor = Colors.white;
  Color _activityForeColor = Colors.grey;
  bool _isFoodSelected = false;
  Color _foodBackColor = Colors.white;
  Color _foodForeColor = Colors.grey;
  bool _isSelfSelected = false;
  Color _selfBackColor = Colors.white;
  Color _selfForeColor = Colors.grey;
  bool _isSocialSelected = false;
  Color _socialBackColor = Colors.white;
  Color _socialForeColor = Colors.grey;


  Future<void> showFilterBottomSheet(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (builder) {
        return SizedBox(
          height: MediaQuery
              .of(context)
              .size
              .height * 0.7,
          child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setBottomState) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width / 2 - 20,
                        ),
                        Expanded(
                          child: Text(
                            '필터',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.close_rounded,
                            color: Colors.black,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      child: SizedBox(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.9,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text(
                                  '기간',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 280,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.calendar_month_outlined),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        filterDateRange ?? '',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      fixedSize: Size(
                                          MediaQuery
                                              .of(context)
                                              .size
                                              .width * 0.9 -
                                              280,
                                          40),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                      ),
                                      backgroundColor: Palette.valueRed),
                                  child: Text(
                                    '기간선택',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onPressed: () {
                                    showCalendar(setBottomState);
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text(
                                  '시간',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 280,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.access_time_outlined),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        filterTimeRange ?? '',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      fixedSize: Size(
                                          MediaQuery
                                              .of(context)
                                              .size
                                              .width * 0.9 -
                                              280,
                                          40),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                      ),
                                      backgroundColor: Palette.valueRed),
                                  child: Text(
                                    '시간선택',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onPressed: () {
                                    showTimePickerDialog(
                                        context, setBottomState);
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text(
                                  '요일',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                TextButton(
                                  style: TextButton.styleFrom(
                                      minimumSize: Size.zero,
                                      padding: EdgeInsets.zero,
                                      foregroundColor: _monForeColor,
                                      fixedSize: Size(30, 30),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              20)),
                                      side: BorderSide(
                                          width: 1, color: _monForeColor),
                                      backgroundColor: _monBackColor),
                                  child: Text('월'),
                                  onPressed: () {
                                    setBottomState(() {
                                      if (_isMonSelected) {
                                        _isMonSelected = false;
                                        _monBackColor = Colors.white;
                                        _monForeColor = Colors.grey;
                                      } else {
                                        _isMonSelected = true;
                                        _monBackColor = Palette.valueRed;
                                        _monForeColor = Colors.white;
                                      }
                                    });
                                  },
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                      minimumSize: Size.zero,
                                      padding: EdgeInsets.zero,
                                      foregroundColor: _tueForeColor,
                                      fixedSize: Size(30, 30),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              20)),
                                      side: BorderSide(
                                          width: 1, color: _tueForeColor),
                                      backgroundColor: _tueBackColor),
                                  child: Text('화'),
                                  onPressed: () {
                                    setBottomState(() {
                                      if (_isTueSelected) {
                                        _isTueSelected = false;
                                        _tueBackColor = Colors.white;
                                        _tueForeColor = Colors.grey;
                                      } else {
                                        _isTueSelected = true;
                                        _tueBackColor = Palette.valueRed;
                                        _tueForeColor = Colors.white;
                                      }
                                    });
                                  },
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                      minimumSize: Size.zero,
                                      padding: EdgeInsets.zero,
                                      foregroundColor: _wedForeColor,
                                      fixedSize: Size(30, 30),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              20)),
                                      side: BorderSide(
                                          width: 1, color: _wedForeColor),
                                      backgroundColor: _wedBackColor),
                                  child: Text('수'),
                                  onPressed: () {
                                    setBottomState(() {
                                      if (_isWedSelected) {
                                        _isWedSelected = false;
                                        _wedBackColor = Colors.white;
                                        _wedForeColor = Colors.grey;
                                      } else {
                                        _isWedSelected = true;
                                        _wedBackColor = Palette.valueRed;
                                        _wedForeColor = Colors.white;
                                      }
                                    });
                                  },
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                      minimumSize: Size.zero,
                                      padding: EdgeInsets.zero,
                                      foregroundColor: _thurForeColor,
                                      fixedSize: Size(30, 30),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              20)),
                                      side: BorderSide(
                                          width: 1, color: _thurForeColor),
                                      backgroundColor: _thurBackColor),
                                  child: Text('목'),
                                  onPressed: () {
                                    setBottomState(() {
                                      if (_isThurSelected) {
                                        _isThurSelected = false;
                                        _thurBackColor = Colors.white;
                                        _thurForeColor = Colors.grey;
                                      } else {
                                        _isThurSelected = true;
                                        _thurBackColor = Palette.valueRed;
                                        _thurForeColor = Colors.white;
                                      }
                                    });
                                  },
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                      minimumSize: Size.zero,
                                      padding: EdgeInsets.zero,
                                      foregroundColor: _friForeColor,
                                      fixedSize: Size(30, 30),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              20)),
                                      side: BorderSide(
                                          width: 1, color: _friForeColor),
                                      backgroundColor: _friBackColor),
                                  child: Text('금'),
                                  onPressed: () {
                                    setBottomState(() {
                                      if (_isFriSelected) {
                                        _isFriSelected = false;
                                        _friBackColor = Colors.white;
                                        _friForeColor = Colors.grey;
                                      } else {
                                        _isFriSelected = true;
                                        _friBackColor = Palette.valueRed;
                                        _friForeColor = Colors.white;
                                      }
                                    });
                                  },
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                      minimumSize: Size.zero,
                                      padding: EdgeInsets.zero,
                                      foregroundColor: _satForeColor,
                                      fixedSize: Size(30, 30),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              20)),
                                      side: BorderSide(
                                          width: 1, color: _satForeColor),
                                      backgroundColor: _satBackColor),
                                  child: Text('토'),
                                  onPressed: () {
                                    setBottomState(() {
                                      if (_isSatSelected) {
                                        _isSatSelected = false;
                                        _satBackColor = Colors.white;
                                        _satForeColor = Colors.grey;
                                      } else {
                                        _isSatSelected = true;
                                        _satBackColor = Palette.valueRed;
                                        _satForeColor = Colors.white;
                                      }
                                    });
                                  },
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                      minimumSize: Size.zero,
                                      padding: EdgeInsets.zero,
                                      foregroundColor: _sunForeColor,
                                      fixedSize: Size(30, 30),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              20)),
                                      side: BorderSide(
                                          width: 1, color: _sunForeColor),
                                      backgroundColor: _sunBackColor),
                                  child: Text('일'),
                                  onPressed: () {
                                    setBottomState(() {
                                      if (_isSunSelected) {
                                        _isSunSelected = false;
                                        _sunBackColor = Colors.white;
                                        _sunForeColor = Colors.grey;
                                      } else {
                                        _isSunSelected = true;
                                        _sunBackColor = Palette.valueRed;
                                        _sunForeColor = Colors.white;
                                      }
                                    });
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text(
                                  '카테고리',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                  style: TextButton.styleFrom(
                                      minimumSize: Size.zero,
                                      padding: EdgeInsets.zero,
                                      foregroundColor: _allCategoryForeColor,
                                      fixedSize: Size(100, 30),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              20)),
                                      side: BorderSide(
                                          width: 1,
                                          color: _allCategoryForeColor),
                                      backgroundColor: _allCategoryBackColor),
                                  child: Text('전체'),
                                  onPressed: () {
                                    setBottomState(() {
                                      if (_isAllCategorySelected) {
                                        _isAllCategorySelected = false;
                                        _allCategoryBackColor = Colors.white;
                                        _allCategoryForeColor = Colors.grey;

                                        _isCultureSelected = false;
                                        _cultureBackColor = Colors.white;
                                        _cultureForeColor = Colors.grey;
                                        _isActivitySelected = false;
                                        _activityBackColor = Colors.white;
                                        _activityForeColor = Colors.grey;
                                        _isFoodSelected = false;
                                        _foodBackColor = Colors.white;
                                        _foodForeColor = Colors.grey;
                                        _isSelfSelected = false;
                                        _selfBackColor = Colors.white;
                                        _selfForeColor = Colors.grey;
                                        _isSocialSelected = false;
                                        _socialBackColor = Colors.white;
                                        _socialForeColor = Colors.grey;
                                      } else {
                                        _isAllCategorySelected = true;
                                        _allCategoryBackColor =
                                            Palette.valueRed;
                                        _allCategoryForeColor = Colors.white;

                                        _isCultureSelected = true;
                                        _cultureBackColor = Palette.valueRed;
                                        _cultureForeColor = Colors.white;
                                        _isActivitySelected = true;
                                        _activityBackColor = Palette.valueRed;
                                        _activityForeColor = Colors.white;
                                        _isFoodSelected = true;
                                        _foodBackColor = Palette.valueRed;
                                        _foodForeColor = Colors.white;
                                        _isSelfSelected = true;
                                        _selfBackColor = Palette.valueRed;
                                        _selfForeColor = Colors.white;
                                        _isSocialSelected = true;
                                        _socialBackColor = Palette.valueRed;
                                        _socialForeColor = Colors.white;
                                      }
                                    });
                                  },
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                      minimumSize: Size.zero,
                                      padding: EdgeInsets.zero,
                                      foregroundColor: _cultureForeColor,
                                      fixedSize: Size(100, 30),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              20)),
                                      side: BorderSide(
                                          width: 1, color: _cultureForeColor),
                                      backgroundColor: _cultureBackColor),
                                  child: Text('문화예술'),
                                  onPressed: () {
                                    setBottomState(() {
                                      if (_isCultureSelected) {
                                        _isCultureSelected = false;
                                        _cultureBackColor = Colors.white;
                                        _cultureForeColor = Colors.grey;

                                        _isAllCategorySelected = false;
                                        _allCategoryBackColor = Colors.white;
                                        _allCategoryForeColor = Colors.grey;
                                      } else {
                                        _isCultureSelected = true;
                                        _cultureBackColor = Palette.valueRed;
                                        _cultureForeColor = Colors.white;
                                      }
                                    });
                                  },
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                      minimumSize: Size.zero,
                                      padding: EdgeInsets.zero,
                                      foregroundColor: _activityForeColor,
                                      fixedSize: Size(100, 30),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              20)),
                                      side: BorderSide(
                                          width: 1, color: _activityForeColor),
                                      backgroundColor: _activityBackColor),
                                  child: Text('액티비티'),
                                  onPressed: () {
                                    setBottomState(() {
                                      if (_isActivitySelected) {
                                        _isActivitySelected = false;
                                        _activityBackColor = Colors.white;
                                        _activityForeColor = Colors.grey;

                                        _isAllCategorySelected = false;
                                        _allCategoryBackColor = Colors.white;
                                        _allCategoryForeColor = Colors.grey;
                                      } else {
                                        _isActivitySelected = true;
                                        _activityBackColor = Palette.valueRed;
                                        _activityForeColor = Colors.white;
                                      }
                                    });
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                  style: TextButton.styleFrom(
                                      minimumSize: Size.zero,
                                      padding: EdgeInsets.zero,
                                      foregroundColor: _selfForeColor,
                                      fixedSize: Size(100, 30),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              20)),
                                      side: BorderSide(
                                          width: 1, color: _selfForeColor),
                                      backgroundColor: _selfBackColor),
                                  child: Text('자기개발'),
                                  onPressed: () {
                                    setBottomState(() {
                                      if (_isSelfSelected) {
                                        _isSelfSelected = false;
                                        _selfBackColor = Colors.white;
                                        _selfForeColor = Colors.grey;

                                        _isAllCategorySelected = false;
                                        _allCategoryBackColor = Colors.white;
                                        _allCategoryForeColor = Colors.grey;
                                      } else {
                                        _isSelfSelected = true;
                                        _selfBackColor = Palette.valueRed;
                                        _selfForeColor = Colors.white;
                                      }
                                    });
                                  },
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                      minimumSize: Size.zero,
                                      padding: EdgeInsets.zero,
                                      foregroundColor: _foodForeColor,
                                      fixedSize: Size(100, 30),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              20)),
                                      side: BorderSide(
                                          width: 1, color: _foodForeColor),
                                      backgroundColor: _foodBackColor),
                                  child: Text('맛집투어'),
                                  onPressed: () {
                                    setBottomState(() {
                                      if (_isFoodSelected) {
                                        _isFoodSelected = false;
                                        _foodBackColor = Colors.white;
                                        _foodForeColor = Colors.grey;

                                        _isAllCategorySelected = false;
                                        _allCategoryBackColor = Colors.white;
                                        _allCategoryForeColor = Colors.grey;
                                      } else {
                                        _isFoodSelected = true;
                                        _foodBackColor = Palette.valueRed;
                                        _foodForeColor = Colors.white;
                                      }
                                    });
                                  },
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                      minimumSize: Size.zero,
                                      padding: EdgeInsets.zero,
                                      foregroundColor: _socialForeColor,
                                      fixedSize: Size(100, 30),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              20)),
                                      side: BorderSide(
                                          width: 1, color: _socialForeColor),
                                      backgroundColor: _socialBackColor),
                                  child: Text('친  목'),
                                  onPressed: () {
                                    setBottomState(() {
                                      if (_isSocialSelected) {
                                        _isSocialSelected = false;
                                        _socialBackColor = Colors.white;
                                        _socialForeColor = Colors.grey;

                                        _isAllCategorySelected = false;
                                        _allCategoryBackColor = Colors.white;
                                        _allCategoryForeColor = Colors.grey;
                                      } else {
                                        _isSocialSelected = true;
                                        _socialBackColor = Palette.valueRed;
                                        _socialForeColor = Colors.white;
                                      }
                                    });
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                  minimumSize: Size.zero,
                                  padding: EdgeInsets.zero,
                                  foregroundColor: Colors.white,
                                  fixedSize: Size(150, 40),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  backgroundColor: Palette.valueRed),
                              child: const Text(
                                '적용하기',
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }),
        );
      },
    );
  }

  void showCalendar(setState) async {
    final DateTimeRange? result = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2022, 1, 1),
      lastDate: DateTime(2030, 12, 31),
      currentDate: DateTime.now(),
      saveText: '저장',
      initialDateRange: selectedDateRange,
    );

    if (result != null) {
      // Rebuild the UI
      setState(() {
        selectedDateRange = result;
        filterDateRange = '${selectedDateRange.start.year}. '
            '${selectedDateRange.start.month}. '
            '${selectedDateRange.start.day}. ~ '
            '${selectedDateRange.end.year}. '
            '${selectedDateRange.end.month}. '
            '${selectedDateRange.end.day}.';
      });
    }
  }

  Future showTimePickerDialog(BuildContext context, setState) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) =>
          AlertDialog(
            //insetPadding: EdgeInsets.zero,
            //contentPadding: EdgeInsets.zero,

            title: Container(
              alignment: Alignment.center,
              child: Text(
                '시간 선택',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
            content: Text("필터링 할 시간을 정해주세요"),
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
            actions: <Widget>[
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Text(
                          '시작 시간',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        TimePickerSpinner(
                          time: filterStartTime,
                          normalTextStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          highlightedTextStyle: TextStyle(
                            fontSize: 18,
                            color: Palette.valueRed,
                          ),
                          itemHeight: 30,
                          itemWidth: 70,
                          is24HourMode: false,
                          minutesInterval: 15,
                          onTimeChange: (inputTime) {
                            setState(() {
                              filterStartTime = inputTime;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Text(
                          '종료 시간',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        TimePickerSpinner(
                          normalTextStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          highlightedTextStyle: TextStyle(
                            fontSize: 18,
                            color: Palette.valueRed,
                          ),
                          itemHeight: 30,
                          itemWidth: 70,
                          is24HourMode: false,
                          minutesInterval: 15,
                          onTimeChange: (inputTime) {
                            setState(() {
                              filterEndTime = inputTime;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor: Palette.valueWhite,
                          minimumSize: Size(150, 20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          backgroundColor: Palette.valueRed),
                      child: const Text('저장하기'),
                      onPressed: () {
                        setState(() {
                          filterTimeRange = '${filterStartTime.hour} : '
                              '${filterStartTime.minute} ~ '
                              '${filterEndTime.hour} : '
                              '${filterEndTime.minute}';
                          print(filterTimeRange);
                        });
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
    );
  }
}
