import 'entity.dart';

class Announcement extends Entity {
  String title;
  String text;

  Announcement(title, text)
  {
    this.title = title;
    this.text = text;
  }
}