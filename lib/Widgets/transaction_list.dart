import 'package:flutter/material.dart';
import '../Models/transtion.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transtion> tx;

  TransactionList(this.tx);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 380,
        //height: MediaQuery.of(context).size.height * 0.7,
        child: tx.isEmpty
            ? Column(
                children: [
                  Text('No Transaction added'),
                  Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      // fit: BoxFit.fitHeight,
                    ),
                  )
                ],
              )
            : ListView.builder(
                itemCount: tx.length,
                itemBuilder: (context, index) => Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 5),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundColor: Theme.of(context).primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: FittedBox(
                                  child: Text('₹${tx[index].amount}')),
                            ),
                          ),
                          title: Text(
                            tx[index].title,
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          subtitle: Text(
                            DateFormat.yMMMd().format(tx[index].date),
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ),
                      ),
                    )));
  }
}
