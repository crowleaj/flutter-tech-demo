import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import '../utils.dart';

class DateTimeField extends StatelessWidget {
  final DateTime currentTime;
  final Function(DateTime) onSelected;

  DateTimeField(this.currentTime, {this.onSelected = Utils.noopOneArg});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Row(children: [
        Padding(padding: EdgeInsets.only(right: 10), child: Icon(Icons.calendar_today)),
        Text(dateTimeText(currentTime)),
        Expanded(child: Text("Change", textAlign: TextAlign.right,))
        ]),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      elevation: 4.0,
      onPressed: () {
        DatePicker.showDateTimePicker(context,
            theme: DatePickerTheme(
              containerHeight: 210.0,
            ),
            showTitleActions: true,
            minTime: DateTime(2000, 1, 1),
            maxTime: DateTime(2022, 12, 31),
            onConfirm: onSelected,
            currentTime: currentTime,
            locale: LocaleType.en);
      },
    );
  }

  String dateTimeText(DateTime date) {
    var month = date.month.toString().padLeft(2, "0");
    var day = date.day.toString().padLeft(2, "0");
    var hour = date.hour.toString().padLeft(2, "0");
    var minute = date.minute.toString().padLeft(2, "0");
    return '${date.year} - $month - $day $hour:$minute';
  }
}
