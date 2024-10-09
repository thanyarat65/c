import 'package:cafe/databases/transaction_db.dart';
import 'package:flutter/foundation.dart';
import 'package:cafe/models/transactions.dart';

class TransactionProvider with ChangeNotifier {
  List<Transactions> transactions = [];

  List<Transactions> getTransaction() {
    return transactions;
  }

  void initData() async{
    var db = await TransactionDB(dbName: 'transactions.db');
    this.transactions = await db.loadAllData();
    print(this.transactions);
    notifyListeners();
  }

  void addTransaction(Transactions transaction) async{
    var db = await TransactionDB(dbName: 'transactions.db');
    var keyID = await db.insertDatabase(transaction);
    this.transactions = await db.loadAllData();
    print(this.transactions);
    notifyListeners();
  }

  void deleteTransaction(int? index) async{
    print('delete index: $index');
    var db = await TransactionDB(dbName: 'transactions.db');
    await db.deleteDatabase(index);
    this.transactions = await db.loadAllData();
    notifyListeners(); 
  }
}
