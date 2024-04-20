import 'package:flutter/material.dart';
import '/themes/src/colors/color_constant.dart';

import '../themes/src/text/text_constant.dart';
// import '../themes/theme.dart';

extension BuildContextExt on BuildContext {
  $MyThemeColor get color => Theme.of(this).extension<$MyThemeColor>()!;
  $MyThemeText get text => Theme.of(this).extension<$MyThemeText>()!;
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}

extension DateString on DateTime {
  String get view {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final init = DateTime(year, month, day);
    if (today == init) return 'Сегодня';
    if (today.difference(init).inDays < 2) return 'Вчера';
    final d = day.toString().length < 2 ? '0$day' : '$day';
    final m = month.toString().length < 2 ? '0$month' : '$month';
    return '$d.$m.$year';
  }

  String get dayId {
    final d = day.toString().length < 2 ? '0$day' : '$day';
    final m = month.toString().length < 2 ? '0$month' : '$month';
    return '$d-$m-$year';
  }

  String get id {
    final m = month.monthFrom;
    return '$m $year';
  }

  Map<String, List> get dayNumber {
    final m = month;
    final result = <String, List>{};
    for (var i = 0; i <= 31; i++) {
      final key = add(Duration(days: i));
      if (key.month == m) {
        result[key.dayId] = [];
      }
    }
    return result;
  }
}

extension Abriviature on String {
  String get abrv {
    if (isEmpty) return '';
    if (!contains(' ')) return substring(0, 1).toUpperCase();
    final index = indexOf(' ');
    final second = substring(index + 1, index + 2);
    return '${substring(0, 1)}$second'.toUpperCase();
  }

  String get statName {
    if (length <= 7) return this;
    return substring(0, 6);
  }
}

extension NameParce on String {
  String get naming {
    if (!contains('/')) return this;
    final index = indexOf('/');
    return substring(0, index);
  }
}

extension LastLetter on String {
  String get lL {
    return substring(length - 1);
  }

  String get lastLetter {
    switch (length) {
      case 3:
        final index = length - 1;
        return '+7 (${substring(index)}';
      case 7:
        return '$this) ';
      case 8:
        return '${substring(0, length - 1)}) $lL';
      case 9:
      case 13:
      case 16:
        return '${substring(0, length - 1)} $lL';
      case 12:
      case 15:
        return '$this ';
      case < 3:
        return '+7';
      default:
        return this;
    }
  }
}

extension MonthInt on int {
  String get monthFrom {
    switch (this) {
      case 1:
        return 'Январь';
      case 2:
        return 'Февраль';
      case 3:
        return 'Март';
      case 4:
        return 'Апрель';
      case 5:
        return 'Мая';
      case 6:
        return 'Июнь';
      case 7:
        return 'Июль';
      case 8:
        return 'Август';
      case 9:
        return 'Сентябрь';
      case 10:
        return 'Октябрь';
      case 11:
        return 'Ноябрь';
      case 12:
        return 'Декабрь';
      default:
        return '';
    }
  }
}
