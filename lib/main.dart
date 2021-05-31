import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import './Widgets/new_transaction.dart';
import './Widgets/about_me.dart';
import './Widgets/chart.dart';
import './Models/transtion.dart';
import 'Widgets/transaction_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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

  final List<Transtion> _userTransactions = [];

  void _deleteTransaction(int index) {
    setState(() {
      _userTransactions.removeAt(index);
    });
  }

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

  bool isAbout = false;
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      actions: [
        isAbout
            ? Text('')
            : IconButton(
                onPressed: () => _startNewTransaction(context),
                icon: Icon(
                  Icons.add,
                )),
        IconButton(
            onPressed: () {
              setState(() {
                isAbout == false ? isAbout = true : isAbout = false;
              });
            },
            icon: !isAbout ? Icon(Icons.person) : Icon(Icons.list_alt_outlined))
      ],
      title: Text('Personal Expenses'),
    );
    return Scaffold(
      appBar: appBar,
      body: isAbout == true
          ? AboutMe()
          : SingleChildScrollView(
              child: Column(
                children: [
                  // ----> Chart <----
                  Container(
                    height: (MediaQuery.of(context).size.height -
                            appBar.preferredSize.height -
                            MediaQuery.of(context).padding.top) *
                        0.35,
                    child: Chart(_recentTransactions),
                  ),
                  Container(
                    height: (MediaQuery.of(context).size.height -
                            appBar.preferredSize.height -
                            MediaQuery.of(context).padding.top) *
                        0.65,
                    child:
                        TransactionList(_userTransactions, _deleteTransaction),
                  ),
                ],
              ),
            ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: isAbout
          ? null
          : FloatingActionButton(
              elevation: 10,
              child: Icon(
                Icons.add,
              ),
              onPressed: () => isAbout ? null : _startNewTransaction(context),
            ),
    );
  }
}
