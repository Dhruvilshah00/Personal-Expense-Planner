import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense_planner/Transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // const MyHomePage({Key? key}) : super(key: key);

  final List<Transaction> transactions = [
    Transaction(
        id: 't1',
        title: 'New shoes',
        amount: 49.99,
        date: DateTime.now()
    ),
    Transaction(
        id: 't2',
        title: 'New Mobile',
        amount: 39.95,
        date: DateTime.now()
    ),
  ];

  // late String titleinput;
  // late String amountinput;

  final titlecontroller = TextEditingController();
  final amountcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.greenAccent,
                child: Text('Chart!'),
              ),
            ),
            Card(
              elevation: 5.0,
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: titlecontroller,
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Amount'),
                      controller: amountcontroller,
                    ),
                    TextButton(
                      child: Text('Add Transaction'),
                      style: TextButton.styleFrom(
                        primary: Colors.purple,
                      ),
                      onPressed: () {
                        print(titlecontroller.text);
                      },
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: transactions.map((tx) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Text(
                          '\$ ${tx.amount}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Colors.purple,
                          ),
                        ),
                        margin: EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.purple,
                              width: 2.0
                          ),
                        ),
                        padding: EdgeInsets.all(5.0),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tx.title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            DateFormat.yMMMd().format(tx.date),
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ));
  }
}
