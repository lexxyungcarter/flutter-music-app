import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:pluralize/pluralize.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:validators/validators.dart';

DateTime? convertToDateTime(String? date) {
  if (date == null) {
    return null;
  }
  return DateTime.parse(date);
}

String fromNow(DateTime d) {
  return timeago.format(d);
}

String formatDate(DateTime? d, {String format = 'dd-MM-yyyy'}) {
  return d != null ? DateFormat(format).format(d) : '';
}

String formatTime(DateTime? d) {
  return d != null ? DateFormat.Hms().format(d) : '';
}

int parseInt(String string) {
  return double.parse(string).toInt();
}

String formatNumber(var number) {
  var f = NumberFormat('#,###.00', 'en_US');
  return number != null ? f.format(double.parse(number.toString())) : '';
}

String formatInt(var number) {
  var f = NumberFormat('#,###', 'en_US');
  return number != null ? f.format(double.parse(number.toString())) : '';
}

String? validateNullableField(String? value,
    {int minLength = 2, int maxLength = 50}) {
  if (value == null || value.isEmpty) {
    return null;
  }
  if (value.isNotEmpty) {
    if (value.length < minLength) {
      return 'The field must be more than $minLength characters';
    }
    if (value.length > maxLength) {
      return 'The field must be less than $minLength characters';
    }
    return null;
  }
  return null;
}

String? validateRequiredField(String? value,
    {int minLength = 2, int maxLength = 50}) {
  if (value == null || value.isEmpty) {
    return 'The field is required';
  }
  if (value.isNotEmpty) {
    if (value.length < minLength) {
      return 'The field must be more than $minLength characters';
    }
    if (value.length > maxLength) {
      return 'The field must be less than $minLength characters';
    }
    return null;
  }
  return null;
}

String? validateNullableEmail(String? value,
    {int minLength = 2, int maxLength = 50}) {
  if (value == null || value.isEmpty) {
    return null;
  }
  if (value.isNotEmpty) {
    if (value.length < minLength) {
      return 'The field must be more than $minLength characters';
    }

    if (value.length > maxLength) {
      return 'The field must be less than $minLength characters';
    }

    if (!isEmail(value)) {
      return 'Please provide a valid email';
    }
  }
  return null;
}

/// mask text
/// the length should be longer than start=3, otherwise it will crash
String? maskText(String? str, {int length = 5, int start = 2}) {
  if (str == null) return null;

  return str.replaceRange(start, length, '*' * (length - 2));
}

void showSuccessToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    backgroundColor: Colors.green.shade500,
    textColor: Colors.white,
  );
}

void showErrorToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    backgroundColor: Colors.red.shade500,
    textColor: Colors.white,
  );
}

void showInfoToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    backgroundColor: Colors.blue.shade500,
    textColor: Colors.white,
  );
}

String pluralize(String msg, num count) {
  final pluralize = Pluralize();

  if (count == 1) {
    return pluralize.singular(msg);
  }

  return pluralize.plural(msg);
}
