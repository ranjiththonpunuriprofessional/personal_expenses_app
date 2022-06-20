import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'new_transaction.dart';
import 'transaction_list.dart';
import '../models/transaction.dart';



class UserTransations extends StatefulWidget {
  @override
  State<UserTransations> createState() => _UserTransationsState();
}

class _UserTransationsState extends State<UserTransations> {

  @override
  Widget build(BuildContext context) {
     return Column(
      children: <Widget>[
        NewTransaction(_addNewTransation),
        TransactionList(_userTransactions),
      ],
     );
  }
}