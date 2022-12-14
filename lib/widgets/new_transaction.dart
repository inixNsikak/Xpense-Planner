import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
final Function addTx;

NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
 final _titleController=TextEditingController();
 final _amountController=TextEditingController();
 DateTime _selectedDate;

void _submitData(){
  final enteredTitle= _titleController.text;
  final enteredAmount= double.parse(_amountController.text);

  if (enteredTitle.isEmpty || enteredAmount <=0 || _selectedDate == null){
    return;
  }
    widget.addTx(
      enteredTitle, 
      enteredAmount,
      _selectedDate,
    );
    //To close the sheet after adding Data
    Navigator.of(context).pop();
}

void _presentDatePicker(){
  showDatePicker(
    context: context, 
    initialDate: DateTime.now(), 
    firstDate: DateTime(2019), 
    lastDate: DateTime.now()
    ).then((pickedDate) {
     if (pickedDate == null){
      return ;
     } 
     setState((){
        _selectedDate = pickedDate;
     });
     
    });
}

  @override
  Widget build(BuildContext context) {
    return //Text input field
          Card(
            elevation: 5,
            child: Container(
              
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: "Title"), 
             /* onChanged: (value){
                tittleInput=value;
              },*/
              //For registering every key stroke on the Text field
                controller: _titleController,
                onSubmitted: (_)=>_submitData(),

                
              ),
              TextField(decoration: InputDecoration(labelText: "Amount"),
              // Registering Input
              //onChanged: (value)=> amountInput=value,
              controller: _amountController,
              //Restricting keyboad only numbers
              keyboardType: TextInputType.number,
              onSubmitted: (_)=>_submitData(),

              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                  //For date picker
                  Expanded(
                    child: Text(
                      _selectedDate ==null ?'No Date Choosen!':DateFormat.yMd().format(_selectedDate) 
                      ),
                  ),

                  FlatButton(
                  child: Text('Choose Date', 
                  style: TextStyle(
                    fontWeight:  FontWeight.bold,
                  ) ,
                  ),
                  textColor: Theme.of(context).primaryColor,
                  onPressed: _presentDatePicker,
                  )
                  

                ],),
              ),
              RaisedButton(
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button.color,
                onPressed: _submitData ,
                child: Text('Add Transaction')
                ),
              /**FlatButton(
                child: Text('Add Transaction'),
                textColor: Colors.pink,
                onPressed: submitData,
                ),**/
          ],
          ),
            ),
          );
  }
}