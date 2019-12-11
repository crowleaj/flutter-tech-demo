import 'package:hello_flutter/entities/entity.dart';

class Appointment extends Entity {
  String name;
  DateTime start;

  Appointment([String id]) : super(id) {
    var now = DateTime.now();
    start = DateTime.utc(now.year, now.month, now.day, now.hour + 1);
  }
}