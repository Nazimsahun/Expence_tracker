import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
final formatter = DateFormat.yMd();

enum Category { Food, Travel, Leisure, Work }

const categoryIcons = {
  Category.Food: Icons.lunch_dining,
  Category.Leisure: Icons.movie,
  Category.Travel: Icons.flight_takeoff,
  Category.Work: Icons.work,
};

class Expanse {
  Expanse({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpanceBucket {
  ExpanceBucket({
    required this.category,
    required this.expances,
  });
  ExpanceBucket.forCategory(List<Expanse> allExapnces, this.category)
      : expances = allExapnces
            .where((expance) => expance.category == category)
            .toList();

  final List<Expanse> expances;
  final Category category;

  double get totalExpanses {
    double sum = 0;
    for (final expance in expances) {
      sum += sum + expance.amount;
    }
    return sum;
  }
}
