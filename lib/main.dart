import 'package:flutter/material.dart';
import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
            titleLarge: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      home: _MyHomePage(),
    );
  }
}
class _MyHomePage extends StatefulWidget {
  @override
  State<_MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {

    final List<Transaction> _userTransactions = [
    Transaction(id: 't1', title: 'Title1', amount: 33.55, date: DateTime.now()),
    Transaction(id: 't2', title: 'Title2', amount: 35.55, date: DateTime.now()),
  ];

  void _addNewTransation(String txTitle, double txAmount) {
    final nexTx = Transaction(
        title: txTitle,
        amount: txAmount, 
        id: DateTime.now().toString(),
        date:  DateTime.now(),
      );

      setState(() {
        _userTransactions.add(nexTx);
      });
  }

  void _startAddNewTransaction(BuildContext ctx){
    showModalBottomSheet(
      context: ctx, 
      builder:(_) {
        return GestureDetector(
          onTap: (){},
          child: NewTransaction(_addNewTransation),
          behavior: HitTestBehavior.opaque,
        ) ;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
        actions: <Widget>[
          IconButton(
            onPressed: ()=>_startAddNewTransaction(context), 
            icon: Icon(Icons.add)
          ),
        ],
      ),
      body:SingleChildScrollView(
        child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:<Widget>[
        Container(
            width: double.infinity,
            child:  Card(
               child: Text('CHART!'),
               color: Colors.blue,
               elevation: 5
            ) ,
          ),
          TransactionList(_userTransactions)   
        ],
       ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: ()=>_startAddNewTransaction(context),
      ),
    );
  }
}
