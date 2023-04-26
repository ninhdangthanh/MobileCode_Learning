import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';
import 'db.dart';

class TransactionList extends StatelessWidget {
  final DatabaseConfiguration _databaseConfiguration = DatabaseConfiguration();

  late List<TransactionItem> transactions;

  final Function(TransactionItem) deleteTransaction;

  TransactionList(
      {super.key, required this.transactions, required this.deleteTransaction});

  ListView _buildListView(BuildContext context) {
    return ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: (index - 1) % 2 == 0 ? Colors.green : Colors.teal,
            elevation: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Padding(padding: EdgeInsets.all(10)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    Text(
                      transactions[index].content,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.white),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 4)),
                    Text(
                      "",
                      // 'Date: ${DateFormat.yMMMMd().format(transactions[index].createdDate!)}',
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 10)),
                  ],
                ),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8))),
                      child: Text(
                        '${transactions[index].amount}\$',
                        style:
                            const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(right: 12))
                  ],
                )),
                TextButton(
                  onPressed: () {
                    print("delete ${transactions[index].id}");
                    _databaseConfiguration
                        .deleteTransaction(transactions[index]);
                    deleteTransaction(transactions[index]);
                  },
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 30,
                  ),
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(height: 500, child: _buildListView(context));
  }
}
