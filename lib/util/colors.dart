import 'package:flutter/material.dart';

import '../models/grpc/reclaim_task.pb.dart';

const calendarColors = {
  'BASIL': Color.fromRGBO(14, 117, 59, 1),
  'BANANA': Color.fromRGBO(245, 182, 35, 1),
  'SAGE': Color.fromRGBO(226, 112, 104, 1),
  // 'SAGE': Color.fromRGBO(55, 72, 172, 1),
};

Color getColor(Task task) {
  final calendarColor = calendarColors[task.eventColor];
  if (calendarColor != null) return calendarColor;
  switch (task.eventCategory) {
    case EventCategory.WORK:
      return Color.fromRGBO(55, 72, 172, 1);
    case EventCategory.PERSONAL:
      return  Color.fromRGBO(226, 112, 104, 1);
    default: return Colors.grey;
  }
}