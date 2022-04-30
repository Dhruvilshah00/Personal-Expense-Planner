import 'package:flutter/material.dart';
import 'package:personal_expense_planner/models/Transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  // const TransactionList({Key? key}) : super(key: key);

  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);



  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: transactions.isEmpty ? Column(
        children: <Widget>[
        Text('No Transaction Added Yet!!',
        style: Theme.of(context).textTheme.headline6,
        ),
          SizedBox(height: 20),
          Container(
            // padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            height: 200,
              child: Image.asset(
                'assets/images/waiting.png',
                fit: BoxFit.cover,
              ),
          ),
      ],
      ) : ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, index) {
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Theme.of(context).primaryColor,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: FittedBox(
                    child: Text(
                      '\$${transactions[index].amount}',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
              ),
              title: Text(
                  transactions[index].title,
                style: Theme.of(context).textTheme.headline6,
              ),
              subtitle: Text(
                DateFormat.yMMMd().format(transactions[index].date,
                ),
              ),
              trailing: IconButton(
                onPressed: () => deleteTx(transactions[index].id),
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
