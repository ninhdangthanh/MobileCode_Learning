import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import './transaction.dart';

class DatabaseConfiguration {
  //create database instance
  Database? _database;

  //create a function to open

  Future openDB() async {
    _database ??= await openDatabase(join(await getDatabasesPath(), "mydb.db"),
        version: 1, onCreate: (Database db, int version) async {
      await db.execute(
          "CREATE TABLE transactions(id INTEGER PRIMARY KEY autoincrement, content TEXT, amount DOUBLE)");
    });
  }

  //Add new transaction
  Future<TransactionItem> addTransactionItem(
      TransactionItem transaction) async {
    await openDB();
    await _database!.insert('transactions', transaction.toMap());
    print("add a transaction success!");
    return transaction;
  }

  //get all transaction
  Future<List<TransactionItem>> getAllTransactions() async {
    await openDB();
    final List<Map<String, dynamic>> transactions =
        await _database!.query('transactions');
    print("get all transaction success!");
    return transactions.map((todo) => TransactionItem.fromMap(todo)).toList();
  }

  //get transaction by id
  Future<TransactionItem?> getTransactionById(int id) async {
    await openDB();
    final List<Map> transactions = await _database!
        .query('transactions', where: "id = ?", whereArgs: [id]);

    if (transactions.length > 0) {
      return TransactionItem.fromMap(transactions.first);
    }
    return null;
  }

  //update transaction
  Future<int> updateTransaction(TransactionItem transactionItem) async {
    await openDB();
    var updatedTransaction = await _database!.update(
        'transactions', transactionItem.toMap(),
        where: "id = ?", whereArgs: [transactionItem.id]);
    return updatedTransaction;
  }

  //delete transaction
  Future<void> deleteTransaction(TransactionItem transactionItem) async {
    await openDB();
    await _database!.delete('transactions',
        where: "id = ?", whereArgs: [transactionItem.id]);
  }
}
