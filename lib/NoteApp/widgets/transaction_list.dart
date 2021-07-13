import 'package:flutter/material.dart';
import 'package:projects/NoteApp/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  late List<Transaction> transactionList;
  late Function(String) deleteTransaction;

  TransactionList(this.transactionList, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return transactionList.isEmpty
        ? Image.asset('./assets/images/empty.png', fit: BoxFit.contain)
        : new ListView.builder(
            itemBuilder: (builderContext, index) {
              return ListTile(
                leading: CircleAvatar(
                    radius: 30,
                    child: new FittedBox(
                        child: Text(
                            '\$ ${transactionList[index].price.toStringAsFixed(2)}',
                            style: TextStyle(
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.bold,
                                fontSize: 12)))),
                title: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(transactionList[index].title.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue)),
                    ]),
                subtitle: Text(DateFormat('dd/MM/yyyy')
                    .format(transactionList[index].dateTime!)),
                trailing: IconButton(
                    onPressed: () =>
                        deleteTransaction(transactionList[index].id),
                    icon: Icon(Icons.delete),
                    color: Colors.redAccent),
              );
            },
            itemCount: transactionList.length);
  }
}
