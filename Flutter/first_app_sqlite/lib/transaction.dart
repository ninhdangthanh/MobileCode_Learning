class TransactionItem {
  int? id;
  String content;
  double amount;

  TransactionItem({this.id, required this.content, required this.amount});

  @override
  String toString() {
    return 'content: $content, amount: $amount';
  }

  Map<String, dynamic> toMap() {
    return {'content': content, 'amount': amount};
  }

  factory TransactionItem.fromMap(Map<dynamic, dynamic> map) {
    return TransactionItem(
      id: map['id'],
      content: map['content'],
      amount: map['amount'],
    );
  }
}
