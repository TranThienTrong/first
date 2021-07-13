import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionInput extends StatefulWidget {
  late final Function(String, String, DateTime) addNewTransaction;

  TransactionInput(this.addNewTransaction);

  @override
  _TransactionInputState createState() => _TransactionInputState();
}

class _TransactionInputState extends State<TransactionInput> {
  final titleController = new TextEditingController();
  final priceController = new TextEditingController();
  DateTime? pickedDate;

  @override
  Widget build(BuildContext context) {
    return new Card(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
          new TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController),
          new TextField(
            decoration: InputDecoration(labelText: 'Price'),
            keyboardType: TextInputType.number,
            controller: priceController,
          ),
          new Container(
              height: 50,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(this.pickedDate == null
                      ? 'No Date'
                      : DateFormat('dd/MM/yy').format(pickedDate!)),
                  Container(
                      margin: EdgeInsets.only(left: 10),
                      child: IconButton(
                        iconSize: 40,
                        onPressed: showDate,
                        color: Colors.blue,
                        icon: Icon(Icons.date_range),
                      )),
                ],
              )),
          new ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.blue),
              onPressed: addTransaction,
              child: Text("Add Transaction"))
        ]));
  }

  /* Button Function */
  void showDate() {
    showDatePicker(
            context: this.context,
            initialDate: DateTime.now(),
            firstDate: DateTime(DateTime.now().year),
            lastDate: DateTime.now())
        .then((pickedDate) {
      setState(() {
        this.pickedDate = pickedDate;
      });
    });
  }

  void addTransaction() {
    print('date'+this.pickedDate.toString());
    widget.addNewTransaction(
        titleController.text, priceController.text, this.pickedDate!);
  }
}
