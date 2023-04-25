import 'package:bloc/bloc.dart';
import 'package:first_app_bloc/transaction.dart';

import 'my_bloc_event.dart';
import 'my_bloc_state.dart';

class MyBloc extends Bloc<MyBlocEvent, MyBlocState> {
  MyBloc()
      : super(MyBlocState(transactionList: [
          Transaction(content: "one", amount: 1, createdDate: DateTime.now()),
          Transaction(content: "two", amount: 2, createdDate: DateTime.now()),
          Transaction(content: "three", amount: 3, createdDate: DateTime.now())
        ]));

  @override
  Stream<MyBlocState> mapEventToState(MyBlocEvent event) async* {
    if (event is AddData) {
      yield state.addToList(transaction: event.transaction);
    } else if (event is DeleteData) {
      yield state.deleteToList(transaction: event.transaction);
    }
  }
}
