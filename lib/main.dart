import 'package:flutter/material.dart';
import './Widgets/new_transaction.dart';
import './Models/transtion.dart';
import 'Widgets/transaction_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
      ),
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  void _startNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bctx) {
          return NewTransaction(_addNewTransaction);
        });
  }

  final List<Transtion> _userTransactions = [
    // Transtion(
    //     id: 't1', amount: 400.40, date: DateTime.now(), title: 'New Shoes'),
    // Transtion(
    //     id: 't2',
    //     amount: 700.80,
    //     date: DateTime.now(),
    //     title: 'Weekly Groceries')
  ];
  void _addNewTransaction(String title, double amount) {
    final newTx = Transtion(
        id: DateTime.now().toString(),
        amount: amount,
        date: DateTime.now(),
        title: title);
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => _startNewTransaction(context),
              icon: Icon(
                Icons.add,
              ))
        ],
        title: Text('Flutter App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ----> Chart <----
            Container(
              width: double.infinity,
              child: Card(
                child: Text('---Development pending for chart section----'),
              ),
            ),
            // -----end Chart
            //------> Text Fields and <Button ----
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        child: Icon(
          Icons.add,
        ),
        onPressed: () => _startNewTransaction(context),
      ),
    );
  }
}
