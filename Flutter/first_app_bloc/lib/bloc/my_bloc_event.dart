import '../transaction.dart';

abstract class MyBlocEvent {}

class AddData extends MyBlocEvent {
  Transaction transaction;
  AddData({required this.transaction});
}

class DeleteData extends MyBlocEvent {
  Transaction transaction;
  DeleteData({required this.transaction});
}
