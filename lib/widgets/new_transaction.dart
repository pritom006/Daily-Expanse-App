import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewTransaction extends StatelessWidget {
  final Function transactionFunction;
  NewTransaction({required this.transactionFunction});
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    final enterTitle = titleController.text;
    final enterAmount = double.parse(amountController.text);

    if (enterTitle.isEmpty || enterAmount < 0) {
      return;
    }
    transactionFunction(enterTitle, enterAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            color: Colors.orange,
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'Charts',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: 10,
                ),
                TextField(
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Title',
                    labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  controller: titleController,
                  onSubmitted: (_) => submitData,
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Amount',
                    labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) => submitData,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      submitData();
                    },
                    child: Text(
                      'Add',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
