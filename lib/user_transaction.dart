import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:personal_expense_planner/models/Transaction.dart';
import 'package:personal_expense_planner/new_transaction.dart';
import 'package:personal_expense_planner/widgets/transaction_list.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({Key? key}) : super(key: key);

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _usertransaction = [
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

  void _addNewTransaction(String txtitle, double txamount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txtitle,
        amount: txamount,
        date: DateTime.now(),
    );

    setState(() {
      _usertransaction.add(newTx);
    });

  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_usertransaction),
      ],
    );
  }
}
