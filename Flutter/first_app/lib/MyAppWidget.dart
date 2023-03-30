import 'package:first_app/TransactionList.dart';
import 'package:flutter/material.dart';
import './transaction.dart';

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

  //define state
  Transaction _transaction =
      Transaction(content: '', amount: 0.0, createdDate: DateTime.now());
  final List<Transaction> _transactions = <Transaction>[];

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
    _transaction.createdDate = DateTime.now();
    _transactions.add(_transaction);
    _transaction =
        Transaction(content: '', amount: 0.0, createdDate: DateTime.now());
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
                TransactionList(transactions: _transactions)
              ],
            )),
          );
        },
      ),
    );
  }
}
