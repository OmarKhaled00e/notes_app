import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String subTitle;
  @HiveField(2)
  late final int color;
  @HiveField(3)
  final String date;

  NoteModel({
    required this.date,
    required this.title,
    required this.subTitle,
    required this.color,
  });
}
