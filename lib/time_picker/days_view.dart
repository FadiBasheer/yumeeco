import 'package:flutter/material.dart';
import 'package:flutter_week_view/flutter_week_view.dart';
import 'package:provider/provider.dart';
import 'custom_time_picker.dart';
import 'provider.dart';

class DemoDayView extends StatelessWidget {
  TimeProvider tp = TimeProvider();
  DateTime date;

  DemoDayView(this.date);

  @override
  Widget build(BuildContext context) {
    print('day: ${date.day}');
//    DateTime now = DateTime.now();
//    DateTime date = DateTime(now.year, now.month, now.day);
    return Column(
      children: <Widget>[
        Expanded(
          child: DayView(
            date: date,
            events: Provider.of<TimeProvider>(context).events,
          ),
        ),
        RaisedButton(
            child: Text('Choose time'),
            onPressed: () async {
              final selectedTime = await _selectAM(context);
              if (selectedTime == null)
                return;
              else {
                Navigator.pop(context);
                Provider.of<TimeProvider>(context, listen: false).addToList(
                    day: date.day,
                    title: 'dad',
                    description: 'go',
                    startH: selectedTime.hour,
                    endh: selectedTime.hour + 2,
                    endm: 15);
              }
            })
      ],
    );
  }

  // Future<TimeOfDay> _selectTimeperiod(BuildContext context) {}

  Future<TimeOfDay> _selectAM(BuildContext context) {
    final now = DateTime.now();

    return showCustomTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: now.hour, minute: now.minute),
        times: [
          TimeOfDay(hour: 0, minute: 0),
          TimeOfDay(hour: 1, minute: 0),
          TimeOfDay(hour: 2, minute: 0),
          TimeOfDay(hour: 3, minute: 0),
          TimeOfDay(hour: 4, minute: 0),
          TimeOfDay(hour: 5, minute: 0),
          TimeOfDay(hour: 6, minute: 0),
          TimeOfDay(hour: 7, minute: 0),
          TimeOfDay(hour: 8, minute: 0),
          TimeOfDay(hour: 9, minute: 0),
          TimeOfDay(hour: 10, minute: 0),
          TimeOfDay(hour: 11, minute: 0),


//          TimeOfDay(hour: 12, minute: 0),
//          TimeOfDay(hour: 13, minute: 0),
//          TimeOfDay(hour: 14, minute: 0),
//          TimeOfDay(hour: 15, minute: 0),
//          TimeOfDay(hour: 16, minute: 0),
          TimeOfDay(hour: 17, minute: 0),
          TimeOfDay(hour: 18, minute: 0),
          TimeOfDay(hour: 19, minute: 0),
          TimeOfDay(hour: 20, minute: 0),
          TimeOfDay(hour: 21, minute: 0),
          TimeOfDay(hour: 22, minute: 0),
          TimeOfDay(hour: 23, minute: 0),
        ]);
  }
}
