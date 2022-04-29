import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense_planner/models/Transaction.dart';
import 'package:personal_expense_planner/widgets/chart_bar.dart';


class Chart extends StatelessWidget {
  // const Chart({Key? key}) : super(key: key);

  final List<Transaction> recentTransaction;

  Chart(this.recentTransaction);

  double get totalSpending {
    return groupedTransactionsValues.fold(0, (sum, item) {
      return sum + item['amount'];
    });
  }


  List<Map<String, dynamic>> get groupedTransactionsValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index),);
      double totalSum = 0.0;

      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weekDay.day && recentTransaction[i].date.month == weekDay.month && recentTransaction[i].date.year == weekDay.year) {
          totalSum += recentTransaction[i].amount;
        }
      }

      // print(DateFormat.E().format(weekDay).substring(0, 1));
      // print(totalSum);

      return {
        'day' : DateFormat.E().format(weekDay).substring(0, 1),
        'amount' : totalSum,
      };
    });
  }



  @override
  Widget build(BuildContext context) {
    print(groupedTransactionsValues);
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionsValues.map((data) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                    data['day'],
                    data['amount'],
                    totalSpending == 0.0 ? 0.0 : (data['amount'] as double) / totalSpending),
              );
            }).toList(),
        ),
      ),
    );
  }
}
