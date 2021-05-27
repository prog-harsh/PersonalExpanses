import 'package:flutter/material.dart';
import '../Models/transtion.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transtion> tx;

  TransactionList(this.tx);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
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
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.deepPurple, width: 2)),
                            child: Text(
                              '₹${tx[index].amount}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.deepPurple),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tx[index].title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                DateFormat.yMMMd().format(tx[index].date),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    fontSize: 13),
                              ),
                            ],
                          )
                        ],
                      ),
                    )));
  }
}
