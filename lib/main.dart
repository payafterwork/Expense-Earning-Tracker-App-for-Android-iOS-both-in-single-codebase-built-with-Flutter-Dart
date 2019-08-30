import 'package:expense/new_transaction.dart';
import 'package:expense/transaction_list.dart';
import './transaction.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Laundry App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.blue 
      ),
      home: MyHomePage(title: 'Laundry App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: 't1',
    //   title: 'New Shoes',
    //   amount: 69.99,
    //   date: DateTime.now()
    //  ),
    //  Transaction(
    //   id: 't2',
    //   title: 'Weekly Shoes',
    //   amount: 16.99,
    //   date: DateTime.now()
    //  ),
  ];

  void _addNewTransaction(String txTitle, double txAmount){
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString()
    ); 


    setState((){
    _userTransactions.add(newTx);
    });
    
  }
  void _startAddNewTransaction(BuildContext ctx){
    showModalBottomSheet(
      context: ctx, 
      builder: (_){
        return GestureDetector(
          onTap:(){},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      } 
      );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
            color:Colors.white
            )
        ],
      ),
      body: 
      SingleChildScrollView(
        child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget> [
            Container(
              width: double.infinity,
              child: Card
              ( color: Colors.blue,
                child: Text('Chart!'),
                elevation: 5,
              ) 
             
              ),
              TransactionList(_userTransactions)
            
           ],
      ), 
// This trailing comma makes auto-formatting nicer for build methods.
   
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    floatingActionButton: 
    FloatingActionButton(
      child:Icon(Icons.add),
      onPressed:() => _startAddNewTransaction(context),
    
      )
    );
  }
}
