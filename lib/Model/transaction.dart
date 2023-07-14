class Transaction {
  int id;
  String userId;
  String amount;
  String transactionId;
  String type;
  String transactionStatus;
  String createDate;
  String updateDate;
  String number;

  Transaction({
    required this.id,
    required this.userId,
    required this.amount,
    required this.transactionId,
    required this.type,
    required this.transactionStatus,
    required this.createDate,
    required this.updateDate,
    required this.number,
  });

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      id: map['id'] ?? -1,
      userId: map['user_id'] ?? '',
      amount: map['amount'] ?? '',
      transactionId: map['transection'] ?? "",
      type: map['mode'] ?? '',
      transactionStatus: map['status'],
      createDate: map['created_at'],
      updateDate: map['updated_at'],
      number: map['phone_number'],
    );
  }
}
