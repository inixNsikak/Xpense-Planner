import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
//import 'package:hive_database_example/models/transaction.dart';
import '../models/transaction.dart';

class Boxes{
 static Box<Transaction>getTransaction()=> 
 Hive.box<Transaction>('transactions');

}