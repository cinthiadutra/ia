// ignore_for_file: library_private_types_in_public_api

import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/theme/styles.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final String text;
  final bool initialValue;
  final ValueChanged<bool>? onChanged;

  const CustomSwitch({
    super.key,
    required this.text,
    required this.initialValue,
    this.onChanged,
  });

  @override
  _CustomWidgetState createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<CustomSwitch> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      color: BKOpenColors.backgroudMedium,
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0,right: 8.0),
            child: Text(
              widget.text,
              style: Styles.labelText
            ),
          ),
          Switch(
            activeTrackColor: BKOpenColors.secondary,
            inactiveTrackColor:BKOpenColors.checkBoxColor ,
            thumbColor: WidgetStatePropertyAll( Colors.white),
            
            value: _value,
            onChanged: (newValue) {
              setState(() {
                _value = newValue;
              });
              if (widget.onChanged != null) {
                widget.onChanged!(newValue);
              }
            },
          ),
        ],
      ),
    );
  }
}
