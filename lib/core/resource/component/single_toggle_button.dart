import 'package:flutter/material.dart';

class SingleToggleButton extends StatefulWidget {
  SingleToggleButton({
    super.key,
    required this.initBackColor,
    required this.initBorderColor,
    required this.changedBackColor,
    required this.changedBorderColor,
    required this.text,
  });

  final Color initBackColor;
  final Color initBorderColor;
  final Color changedBackColor;
  final Color changedBorderColor;
  final String text;
  final _SingleToggleButtonState _state = _SingleToggleButtonState();

  @override
  State<SingleToggleButton> createState() {
    return _state;
  }

  bool get isSelected => _state.isSelected;
}

class _SingleToggleButtonState extends State<SingleToggleButton> {
  bool _isSelected = false;
  late Color _buttonBackColor;
  late Color _buttonBorderColor;

  bool get isSelected => _isSelected;

  @override
  void initState() {
    super.initState();
    _buttonBackColor = widget.initBackColor;
    _buttonBorderColor = widget.initBorderColor;
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: TextButton.styleFrom(
        foregroundColor: _buttonBorderColor,
        minimumSize: Size(100, 35),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: _buttonBackColor,
        side: BorderSide(width: 1, color: _buttonBorderColor),
      ),
      child: Text(widget.text),
      onPressed: () {
        setState(() {
          if (_isSelected) {
            _isSelected = false;
            _buttonBackColor = widget.initBackColor;
            _buttonBorderColor = widget.initBorderColor;
          } else {
            _isSelected = true;
            _buttonBackColor = widget.changedBackColor;
            _buttonBorderColor = widget.changedBorderColor;
          }
        });
      },
    );
  }
}
