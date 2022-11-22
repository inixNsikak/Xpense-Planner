import 'package:flutter/material.dart';

import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './models/transaction.dart';
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
      theme: ThemeData.dark().copyWith(
        //primaryColor: Colors.cyanAccent
         primaryColor: Color.fromARGB(255, 255, 166, 2)
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
     Transaction(id: '01',
    title: 'New Shoes',
    amount: 50.99, 
    date: DateTime.now()
    ),
    Transaction(id: '02',
    title: 'New Laptop',
    amount: 120.99, 
    date: DateTime.now()
    )

  ];
  //function to create new transaction
  void _addNewTramsaction(String txTitle, double txAmount){
    final newTx=Transaction(title:txTitle,
    amount: txAmount, 
    date: DateTime.now(),
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
              Container(
                width: double.infinity,
                //height: 100,
                child: Card(
                  //color: Color.fromARGB(255, 253, 85, 18),
                  color: Theme.of(context).primaryColor,
                  child: Text('Chart'),
                    
                  elevation: 5,
                ),
              ),
              //User transaction widget
              TransactionListState(_userTransactions),
            ],
        
          ),
      ),
      floatingActionButtonLocation: 
      FloatingActionButtonLocation.centerFloat,
      floatingActionButton: 
      FloatingActionButton(
        //backgroundColor: Color.fromARGB(255, 255, 0, 128),
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add),
        
        onPressed: ()=>_startNewTransaction(context),
       ),
    );
  }
}
