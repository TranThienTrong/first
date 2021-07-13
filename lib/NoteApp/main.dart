import 'package:flutter/material.dart';
import 'package:projects/NoteApp/widgets/chart.dart';
import 'package:projects/NoteApp/widgets/transaction_input.dart';
import 'package:projects/NoteApp/widgets/transaction_list.dart';

import 'models/transaction.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: 'OpenSans',
            textTheme: ThemeData
                .light()
                .textTheme
                .copyWith(button: TextStyle(color: Colors.white))),
        home: HomePage());
  }
}

void main() => runApp(MyApp());

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Transaction> transactionList = [
    Transaction(id: '1',
        title: 'Nike',
        price: 69.69,
        dateTime: DateTime.now().subtract(Duration(days: 2))),
    Transaction(id: '2',
        title: 'Converse',
        price: 69.69,
        dateTime: DateTime.now().subtract(Duration(days: 3)))
  ];

  void _addNewTransaction(String inputTitle, String inputPrice,
      DateTime dateTimeabc) {
    Transaction newTransaction = new Transaction(
        id: DateTime.now().toString(),
        title: inputTitle,
        dateTime: dateTimeabc,
        price: double.parse(inputPrice));

    setState(() {
      transactionList.add(newTransaction);
    });
  }

  void startAddNewTransaction(BuildContext) {
    showModalBottomSheet(
        context: BuildContext,
        builder: (_) {
          return TransactionInput(_addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = new AppBar(title: new Text('Note App'));

    return new Scaffold(
      appBar: appBar,
      body: new Column(
        children: <Widget>[
          new Container(width: double.infinity, height: (MediaQuery
              .of(context)
              .size
              .height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.25,
              child: Chart(transactionList)),

          new Container(
              width: double.infinity,
              height: (MediaQuery
                  .of(context)
                  .size
                  .height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.75,
              child: TransactionList(transactionList, deleteTransaction))


        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => startAddNewTransaction(context),
      )
      ,
    );
  }


  void deleteTransaction(String id) {
    setState(() {
      for (Transaction transaction in transactionList) {
        if (transaction.id == id) {
          transactionList.remove(transaction);
          return;
        }
      }
    });
  }

}
