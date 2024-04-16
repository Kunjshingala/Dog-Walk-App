import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class WalkPlanningBloc {
  final BuildContext context;

  WalkPlanningBloc({required this.context});

  final dateRangePickerController = DateRangePickerController();
  final initialSelectedRange = PickerDateRange(
      DateTime.now(), DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 5));

  final walkNumberSubject = BehaviorSubject<int>.seeded(1);
  Stream<int> get getWalkNumber => walkNumberSubject.stream;
  Function(int) get setWalkNumber => walkNumberSubject.add;

  final walkDurationSubject = BehaviorSubject<int>.seeded(15);
  Stream<int> get getWalkDuration => walkDurationSubject.stream;
  Function(int) get setWalkDuration => walkDurationSubject.add;

  void dispose() {
    dateRangePickerController.dispose();
  }
}

/// for custom cell
//   bool isLowerDate(DateTime date1, DateTime date2) {
//     return ((getDateWithoutTime(date1).difference(getDateWithoutTime(date2))).inDays < 0);
//   }
//
//   bool isToday(DateTime date1, DateTime date2) {
//     return ((getDateWithoutTime(date1).difference(getDateWithoutTime(date2))).inDays == 0);
//   }

//   bool? isSelected(DateTime date, DateTime selectedDate) {
//       try {
//         return ((getDateWithoutTime(date)
//                     .difference(getDateWithoutTime(dateRangePickerController.selectedDate!)))
//                 .inDays ==
//             0);
//       } catch (e) {
//         return false;
//       }
//     }
//
//   DateTime getDateWithoutTime(DateTime d) {
//     return DateTime(d.year, d.month, d.day);
//   }
