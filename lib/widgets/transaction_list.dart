import '/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> tList;
  const TransactionList({required this.tList});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            color: Colors.cyan,
            child: Text(
              'Transaction List',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ),
          Container(
              height: 400,
              child: ListView.builder(
                  itemCount: tList.length,
                  itemBuilder: (ctx, int index) {
                    return Container(
                      margin: EdgeInsets.only(left: 10, right: 10, bottom: 8),
                      child: Card(
                        color: Colors.purple.shade200,
                        child: Container(
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(border: Border.all()),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                child: Text(
                                    '\$ ${tList[index].amount.toStringAsFixed(2)}'),
                              ),
                              SizedBox(
                                width: 120,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(tList[index].title),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    DateFormat.yMMMEd()
                                        .format(tList[index].add_date),
                                    style: TextStyle(color: Colors.black),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
