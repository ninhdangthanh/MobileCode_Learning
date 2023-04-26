import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';
import 'TransactionList.dart';
import 'db.dart';

class MyAppWidget extends StatefulWidget {
  const MyAppWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppWidgetState();
  }
}

class _MyAppWidgetState extends State<MyAppWidget> with WidgetsBindingObserver {
  final _contentController = TextEditingController();
  final _amountController = TextEditingController();

  final DatabaseConfiguration _databaseConfiguration = DatabaseConfiguration();

  //define state
  TransactionItem _transaction = TransactionItem(content: '', amount: 0.0);
  List<TransactionItem> _transactions = <TransactionItem>[];

  void deleteTransaction(TransactionItem transactionItem) {
    print('transactionItem $transactionItem');
    setState(() {
      _transactions.remove(transactionItem);
    });
  }

  void _insertTransaction(BuildContext context) {
    if (_transaction.content == '' || _transaction.amount == 0.0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please input valid data'),
          backgroundColor: (Colors.black12),
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }

    // _transactions.add(_transaction);
    //add to sqlite
    _databaseConfiguration.addTransactionItem(_transaction).then((id) => {
          print('added new todo to database ${id.id} !'),
        });

    ///
    _transaction = TransactionItem(content: '', amount: 0.0);
    _contentController.text = '';
    _amountController.text = '';
  }

  void _onButtonModalSheet() {
    showModalBottomSheet(
        context: this.context,
        builder: (context) {
          return Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextField(
                      controller: _contentController,
                      onChanged: (text) {
                        setState(() {
                          _transaction.content = text;
                        });
                      },
                      decoration: const InputDecoration(labelText: "Content"),
                    ),
                    TextField(
                      controller: _amountController,
                      onChanged: (text) {
                        setState(() {
                          _transaction.amount = double.tryParse(text)!;
                        });
                      },
                      decoration:
                          const InputDecoration(labelText: "Amount(money)"),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 16)),
              Container(
                // padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Padding(padding: EdgeInsets.only(left: 20)),
                    Expanded(
                        child: SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.green),
                        onPressed: () {
                          setState(() {
                            _insertTransaction(context);
                          });
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          "Save",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    )),
                    const Padding(padding: EdgeInsets.only(left: 10)),
                    Expanded(
                        child: SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.pinkAccent),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Cancel",
                            style:
                                TextStyle(fontSize: 16, color: Colors.white)),
                      ),
                    )),
                    const Padding(padding: EdgeInsets.only(right: 20)),
                  ],
                ),
              )
              //ok button
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction Manager',
            style: TextStyle(fontSize: 26, color: Colors.white)),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                _onButtonModalSheet();
              },
              icon: const Icon(Icons.add))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Add transaction",
        onPressed: () {
          _onButtonModalSheet();
        },
        child: const Icon(Icons.add),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return SafeArea(
            minimum: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                ButtonTheme(
                  height: 60,
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    child: const Text("Insert Transaction",
                        style: TextStyle(fontSize: 24)),
                    onPressed: () {
                      this._onButtonModalSheet();
                    },
                  ),
                ),
                FutureBuilder(
                    future: _databaseConfiguration.getAllTransactions(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        _transactions = snapshot.data!;
                      }
                      _transactions.forEach((item) => {print(item.toString())});
                      return TransactionList(
                          transactions: _transactions,
                          deleteTransaction: deleteTransaction);
                    }),
              ],
            )),
          );
        },
      ),
    );
  }
}
