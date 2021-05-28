import 'package:flutter/material.dart';
import './Widgets/new_transaction.dart';
import './Widgets/chart.dart';
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
        textTheme: TextTheme(
          subtitle2: TextStyle(fontSize: 13, color: Colors.grey),
          headline1: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
        ),
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

  List<Transtion> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  void _addNewTransaction(String title, double amount, DateTime chooseDate) {
    final newTx = Transtion(
        id: DateTime.now().toString(),
        amount: amount,
        date: chooseDate,
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
              child: Chart(_recentTransactions),
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
