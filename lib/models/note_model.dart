import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

part 'note_model.g.dart';

@HiveType(typeId: 1)
class Note extends Equatable {
  // Statics:
  static List<Color> colors = const [
    Color(0xffFFAB91),
    Color(0xffFFCC80),
    Color(0xffE7ED9B),
    Color(0xff81DEEA),
    Color(0xffCF94DA),
    Color(0xff7DCBC3),
    Color(0xffF48FB1),
  ];

  // Fields:
  @HiveField(0)
  String id = "";
  @HiveField(1)
  String title;
  @HiveField(2)
  String content;
  @HiveField(3)
  String lastEditDate = "";
  @HiveField(4)
  int noteBackgroundColor = 0;

  // Constructor:
  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.lastEditDate,
    required this.noteBackgroundColor,
  });

  Note.create({
    required this.title,
    required this.content,
  }) {
    // Initializing:
    id = DateTime.now().millisecondsSinceEpoch.toString();
    lastEditDate = DateFormat("MMMM d, y").format(DateTime.now());
    noteBackgroundColor = colors[Random().nextInt(colors.length)].value;
  }

  @override
  List<Object?> get props => [id, title, content, lastEditDate];
}
