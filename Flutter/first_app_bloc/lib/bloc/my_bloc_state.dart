import 'dart:ffi';

import 'package:first_app_bloc/transaction.dart';

class MyBlocState {
  List<Transaction> transactionList = <Transaction>[];

  MyBlocState({required this.transactionList});

  MyBlocState addToList({required Transaction transaction}) {
    transactionList.add(transaction);
    return MyBlocState(transactionList: transactionList);
  }

  MyBlocState deleteToList({required Transaction transaction}) {
    transactionList.remove(transaction);
    return MyBlocState(transactionList: transactionList);
  }
}
