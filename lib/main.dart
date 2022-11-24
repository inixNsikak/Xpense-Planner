import 'dart:ui';

import 'package:flutter/material.dart';

import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './models/transaction.dart';
import './widgets/chart.dart';
//import 'package:flutter_complete_guide/user_transaction.dart'
//import 'package:flutter_complete_guide/widgets/transaction_list.dart';


void main() => runApp(xpensePlannerApp());

class xpensePlannerApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Remve the debug banner
      debugShowCheckedModeBanner: false,
      /**theme: ThemeData.dark().copyWith(
        primaryColor: Color.fromARGB(255, 255, 0, 128),
      ),**/
      theme: ThemeData(
        //primaryColor: Colors.cyanAccent
         primarySwatch:Colors.blueGrey,
         accentColor: Colors.lightBlue,
         errorColor: Colors.red,
         fontFamily: 'Quicksand',
         textTheme: ThemeData.light().textTheme.copyWith(
          headline6:TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
            fontSize: 18),
            button: TextStyle(color: Colors.white),
            ),

         appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.bold)),
              )
         
         
      ),
      title: 'Xpense Planner',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //final titlController= TextEditingController();
  //final amountController= TextEditingController();

  final List<Transaction>_userTransactions=[
    /**Transaction(id: '01',
    title: 'New Shoes',
    amount: 50.99, 
    date: DateTime.now()
    ),
    Transaction(id: '02',
    title: 'New Laptop',
    amount: 120.99, 
    date: DateTime.now()
    )
**/
  ];
  List<Transaction> get _recentTransactions{
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days:7),
          ));
    }).toList();
  }
  //function to create new transaction
  void _addNewTramsaction(String txTitle, 
  double txAmount,
  DateTime chosenDate){
    final newTx=Transaction(title:txTitle,
    amount: txAmount, 
    //For adding chosen date
    date: chosenDate,
    id: DateTime.now().toString(), 
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startNewTransaction(BuildContext ctx){
    showModalBottomSheet(
      context: ctx, 
      builder: (bCtx){
        return GestureDetector(
          onTap: (){},
          child:NewTransaction(_addNewTramsaction),
          behavior: HitTestBehavior.opaque,
          );
    });
  }
  void _deleteTransaction(String id){
    //We need a unique identifer
    setState(() {
      _userTransactions.removeWhere((tx){
        return tx.id==id;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Xpense Planner'),

        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: ()=>_startNewTransaction(context),
            ),
        ],
      ),
      body:  SingleChildScrollView(
        child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
        
            children: <Widget>[
              Chart(_recentTransactions),
              //User transaction widget
              TransactionListState(_userTransactions,_deleteTransaction),
            ],
        
          ),
      ),
      floatingActionButtonLocation: 
      FloatingActionButtonLocation.centerFloat,
      floatingActionButton: 
      FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        
        //backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add,
        color: Colors.white,),
        
        onPressed: ()=>_startNewTransaction(context),
       ),
    );
  }
}
