import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  void _submitData (){
    if(_amountController.text.isEmpty){
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    if(enteredTitle.isEmpty || enteredAmount <=0 || _selectedDate == null){
      return;
    }
    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectedDate
    );
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate:  DateTime.now(),
    ).then((pickedDate){
      if(pickedDate == null){
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
    print('...');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Title',
                    ),
                    // onChanged: (value) {
                    //   titleInput = value;
                    // },
                    controller: _titleController,
                     onSubmitted: (_)=>_submitData,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Amount',
                    ),
                    // onChanged: (value) {
                    //   amountInput = value;
                    // },
                    controller: _amountController,
                    onSubmitted: (_)=>_submitData,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                  ),
                  Container(
                    height: 70,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(_selectedDate == null ? 'No Date Chosen!': 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',),
                        ) ,
                        FlatButton(
                          onPressed: _presentDatePicker,
                          child: Text('Chose Date',style: TextStyle(fontWeight: FontWeight.bold),),
                          textColor: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                  )
                  ,
                  RaisedButton(
                    child: Text('Add Transaction'),
                    color: Theme.of(context).primaryColor,
                    textColor:Colors.white,
                    onPressed: _submitData,
                  )
                ],
              ),
            ),
          );
  }
}