import 'package:flutter/material.dart';
import 'package:flutter_week_view/flutter_week_view.dart';

class TimeProvider extends ChangeNotifier {
  static DateTime now = DateTime.now();
  static DateTime date;
  List<FlutterWeekViewEvent> events = [];

  void addToList(
      {String title,
      String description,
      int startH,
      int endh,
      int endm,
      int day}) {
    date = DateTime(now.year, now.month, day);
    events.add(FlutterWeekViewEvent(
      title: title,
      description: description,
      start: date.add(Duration(hours: startH)),
      //date.subtract(Duration(hours: startH)),
      end: date.add(Duration(hours: endh, minutes: endm)),
    ));
    notifyListeners();
  }

  void prindf() {
    print(events.getRange(0, events.length).map((e) => e.start.hour));
  }
}
