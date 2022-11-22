import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
final Function addTx;

NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
 final titleController=TextEditingController();

 final amountController=TextEditingController();

void submitData(){
  final enteredTitle= titleController.text;
  final enteredAmount= double.parse(amountController.text);

  if (enteredTitle.isEmpty || enteredAmount <=0){
    return;
  }
    widget.addTx(
      enteredTitle, 
      enteredAmount,
    );
    //To close the sheet after adding Data
    Navigator.of(context).pop();
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
                controller: titleController,
                onSubmitted: (_)=>submitData(),

                
              ),
              TextField(decoration: InputDecoration(labelText: "Amount"),
              // Registering Input
              //onChanged: (value)=> amountInput=value,
              controller: amountController,
              //Restricting keyboad only numbers
              keyboardType: TextInputType.number,
              onSubmitted: (_)=>submitData(),

              ),
              /**ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 255, 0, 128),)
                  ),
                onPressed: (){
                  addTx(titleController.text, 
                  double.parse(amountController.text)
                  );
                }, 
                child: Text('Add Transaction')
                ),***/
              FlatButton(
                child: Text('Add Transaction'),
                textColor: Colors.pink,
                onPressed: submitData,
                ),
          ],
          ),
            ),
          );
  }
}