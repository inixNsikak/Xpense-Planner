
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionListState extends StatelessWidget {
  final List<Transaction>transactions;

  TransactionListState(this.transactions);
  
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 300,
      
        child: ListView.builder(
                itemBuilder: (ctx,index){
                  return Card(
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                          decoration: BoxDecoration(
                            border: Border.all(
                              //color:Color.fromARGB(255, 253, 85, 18),
                              color: Theme.of(context).primaryColor,
                              width: 2,), 
                              ),
                              padding: EdgeInsets.all(10), 
                          child: Text(
                            //String interpolation
                            '\$' + transactions[index].amount.toStringAsFixed(2),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            //color: Color.fromARGB(255, 255, 255, 255),
                            color: Theme.of(context).primaryColor,
                            ),
                            ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                          Text(transactions[index].title, 
                          style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17, 
                          ),),
                          Text(
                            DateFormat.yMMMd().format(transactions[index].date),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            //color: Theme.of(context).primaryColor,
                            
                           ),),
                        ],)
                      ],
                    ),);
                
                },
                itemCount: transactions.length,
                //Map will take function that is executed on every transaction
                
                ),
      
    );
  }
}