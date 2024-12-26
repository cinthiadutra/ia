import 'package:flutter/material.dart';

class FilterOption extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback onTap;

  const FilterOption(
      {super.key, required this.text, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(color: selected ? Colors.blue : Colors.grey),
          color: selected ? Colors.blue : Colors.white,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: selected ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}