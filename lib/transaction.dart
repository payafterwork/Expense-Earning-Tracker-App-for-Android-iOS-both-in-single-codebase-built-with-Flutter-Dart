import 'package:flutter/foundation.dart';
class Transaction{
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  
  Transaction({
    @required this.id, //imported foundation.dart for @required
    @required this.title,
    @required this.amount,
    @required this.date});
}