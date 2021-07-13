import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projects/NoteApp/models/transaction.dart';
import 'package:projects/NoteApp/widgets/chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> transactionList;
  List<Map<Object, Object>> groupedTransactionsValueList = [{}];

  Chart(this.transactionList) {
    groupedTransactionsValueList = List.generate(7, (index) {
      DateTime weekDay = DateTime.now().subtract(Duration(days: index));
      /*
        Ví dụ today là ngày 10
        index 1: 10-1 = 9
        index 2: 10-2 = 8
        index 3: 10-1 = 7
        index 4: 10-1 = 6
        index 5: 10-1 = 5
        index 6: 10-1 = 4
        index 7: 10-1 = 3

        */
      late double sumPrice = 0;

      for (int i = 0; i < transactionList.length; i++) {
        if (transactionList[i].dateTime!.day == weekDay.day &&
            transactionList[i].dateTime!.month == weekDay.month &&
            transactionList[i].dateTime!.year == weekDay.year) {
          sumPrice += transactionList[i].price;
        }
      }
      // print(weekDay);
      // print(transactionList[1].dateTime);

      return {'day': DateFormat('E').format(weekDay), 'amountOfDay': sumPrice};
    });
  }

  double get totalSpendingOfWeek {
    return groupedTransactionsValueList.fold(
        0.0,
        (previousValue, element) =>
            previousValue + (element['amountOfDay'] as double));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: groupedTransactionsValueList.map((element) {
            return CharBar(
                element['day'].toString(),
                element['amountOfDay'] as double,
                totalSpendingOfWeek == 0.0
                    ? 0.0
                    : (element['amountOfDay'] as double) / totalSpendingOfWeek);
          }).toList()),
    );
  }
}
