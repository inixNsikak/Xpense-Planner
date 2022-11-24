
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionListState extends StatelessWidget {
  final List<Transaction>transactions;
  final Function deleteTx;

  TransactionListState(this.transactions,this.deleteTx);
  
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 550,
      
        child: transactions.isEmpty ? Column(
          children: <Widget> [
          Text('No Transaction added yet!',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,),
          
          ),
          SizedBox(
            height: 13,
            ),
          Container(
            height:250,
            child: Image.asset('assets/images/waiting.png',
            fit: BoxFit.cover,),
          ),
        ],
        ) 
        : ListView.builder(
                itemBuilder: (ctx,index){
                  return Card(
                    margin: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 5,
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius:30,
                        //style: Theme.of(context).textTheme.title, 
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: FittedBox(
                            
                            child: Text('\$${transactions[index].amount}')),
                        ) ,
                      ),
                      title: Text(
                        transactions[index].title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      subtitle: Text(
                        DateFormat.yMMMd().format(
                          transactions[index].date),
                          ),
                          trailing: IconButton( icon: Icon(Icons.delete),
                          color: Theme.of(context).errorColor,
                          onPressed: ()=> deleteTx(transactions[index].id)),
                    ),
                  )
                ;
                },
                itemCount: transactions.length,
                //Map will take function that is executed on every transaction
                
                ),
      
    );
  }
}