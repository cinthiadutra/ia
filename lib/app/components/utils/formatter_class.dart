import 'dart:math';

import 'package:bkopen/app/Strings/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MobilePhoneNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    int selectionIndex = newValue.selection.end;
    int oldLength = newValue.text.length;
    String formatted = '';
    String original = newValue.text;

    String numbersOnly = original.replaceAll(RegExp(Strings.re_not_number), '');
    if (numbersOnly.length > 11) {
      numbersOnly = numbersOnly.substring(0, 11);
    }
    int length = min(numbersOnly.length, 11);

    for (int k = 0; k < length; k++) {
      if (k == 0) {
        formatted += '(';
      }
      if (k == 2) {
        formatted += ')';
      }
      if (k == 7) {
        formatted += '-';
      }
      formatted += numbersOnly[k];
    }

    int delta = formatted.length - oldLength;

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: selectionIndex + delta),
    );
  }
}

class CpfInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    int selectionIndex = newValue.selection.end;
    int oldLength = newValue.text.length;
    String formatted = '';
    String original = newValue.text;

    String numbersOnly = original.replaceAll(RegExp(Strings.re_not_number), '');
    if (numbersOnly.length > 11) {
      numbersOnly = numbersOnly.substring(0, 11);
    }
    int length = min(numbersOnly.length, 11);

    for (int k = 0; k < length; k++) {
      if (k == 3) {
        formatted += '.';
      }
      if (k == 6) {
        formatted += '.';
      }
      if (k == 9) {
        formatted += '-';
      }
      formatted += numbersOnly[k];
    }

    int delta = formatted.length - oldLength;

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: selectionIndex + delta),
    );
  }
}

class DateInputFormatter extends TextInputFormatter {
  bool updating = false;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    int selectionIndex = newValue.selection.end;
    int oldLength = newValue.text.length;
    String formatted = '';
    String original = newValue.text;

    String numbersOnly = original.replaceAll(RegExp(Strings.re_not_number), '');
    if (numbersOnly.length > 8) {
      numbersOnly = numbersOnly.substring(0, 8);
    }
    int length = min(numbersOnly.length, 8);

    for (int k = 0; k < length; k++) {
      if (k == 2) {
        formatted += '/';
      }
      if (k == 4) {
        formatted += '/';
      }
      formatted += numbersOnly[k];
    }

    int delta = formatted.length - oldLength;

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: selectionIndex + delta),
    );
  }
}

class AccessKeyInputFormatter extends TextInputFormatter {
  bool updating = false;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    int selectionIndex = newValue.selection.end;
    int oldLength = newValue.text.length;
    String formatted = '';
    String original = newValue.text;

    String numbersOnly = original.replaceAll(RegExp(Strings.re_not_number), '');
    if (numbersOnly.length > 44) {
      numbersOnly = numbersOnly.substring(0, 44);
    }
    int length = min(numbersOnly.length, 44);

    for (int k = 0; k < length; k++) {
      if (k == 4 ||
          k == 8 ||
          k == 12 ||
          k == 16 ||
          k == 20 ||
          k == 24 ||
          k == 28 ||
          k == 32 ||
          k == 36 ||
          k == 40) {
        formatted += ' ';
      }
      formatted += numbersOnly[k];
    }

    int delta = formatted.length - oldLength;

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: selectionIndex + delta),
    );
  }
}

class CurrencyInputFormatter extends TextInputFormatter {
  bool updating = false;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    int selectionIndex = newValue.selection.end;
    int oldLength = newValue.text.length;
    String formatted = '';
    String original = newValue.text;

    String numbersOnly = original.replaceAll(RegExp(Strings.re_not_number), '');
    double number = double.parse(numbersOnly) / 100;
    formatted = Strings.formatTwoDecimals.format(number);

    int delta = formatted.length - oldLength;

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: selectionIndex + delta),
    );
  }
}

class CurrencyIntInputFormatter extends TextInputFormatter {
  bool updating = false;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    int selectionIndex = newValue.selection.end;
    int oldLength = newValue.text.length;
    String formatted = '';
    String original = newValue.text;
    int valueToSubtract = 3;

    if (original.contains('.00')) {
      var endIndex = original.length - 3;

      original = original.substring(0, endIndex);

      valueToSubtract = 0;
    }

    String numbersOnly = original.replaceAll(RegExp(Strings.re_not_number), '');
    int? number = int.tryParse(numbersOnly);
    number ??= 0;
    formatted = '$number.00';

    int delta = formatted.length - oldLength - valueToSubtract;

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: selectionIndex + delta),
    );
  }
}

class RowFormatters extends StatelessWidget {
  final String label;
  final TextInputFormatter formatter;

  const RowFormatters(
      {super.key, required this.label, required this.formatter});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(label: Text(label)),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        formatter,
      ],
    );
  }
}
