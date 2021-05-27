import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Models/transtion.dart';

class Chart extends StatelessWidget {
  final List<Transtion> recentTransaction;
  Chart(this.recentTransaction);

  List<Map> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;

      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weekDay.day &&
            recentTransaction[i].date.month == weekDay.month &&
            recentTransaction[i].date.year == weekDay.year) {
          totalSum += recentTransaction[i].amount;
        }
      }
      return {'days': DateFormat.E().format(weekDay), 'amount': totalSum};
    });
  }

  // List<Map<String, Object>> get groupedTransactionValues {
  //   //return List.generate(7,)
  // }
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 9,
      margin: EdgeInsets.all(20),
    );
  }
}
