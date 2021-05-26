import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTx;

  void saveData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredAmount <= 0 || enteredTitle.isEmpty) {
      return;
    }
    addTx(titleController.text, double.parse(amountController.text));
  }

  NewTransaction(this.addTx);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => saveData(),
              // onChanged: (value) => titleText = value;,
            ),
            TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              onSubmitted: (_) => saveData(),
            ),
            TextButton(
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all(Colors.deepPurple)),
                onPressed: saveData,
                child: Text('Add Transaction'))
          ],
        ),
      ),
    );
  }
}
