import '/models/transaction.dart';
import '/widgets/new_transaction.dart';
import '/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

class UserTransaction extends StatefulWidget {
  //const UserTransaction({Key? key}) : super(key: key);
  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  List<Transaction> transaction = [
    Transaction(
      id: '1',
      title: 'Flutter Book',
      amount: 450.0,
      add_date: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: 'Flutter Book',
      amount: 450.0,
      add_date: DateTime.now(),
    ),
  ];

  addTransaction(String title, double amount) {
    final addTr = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      add_date: DateTime.now(),
    );
    setState(() {
      transaction.add(addTr);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(
          transactionFunction: addTransaction,
        ),
        TransactionList(
          tList: transaction,
        ),
      ],
    );
  }
}
