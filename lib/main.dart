import 'package:expense/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  final List<Transaction> transactions = [
    Transaction(
      id:'t1',
      title: 'New shoes',
      amount: 69.99,
      date: DateTime.now()
    ),
    Transaction(
      id:'t2',
      title: 'Weekly Groceries',
      amount: 16.99,
      date: DateTime.now()
    ),
    
  ];

  String titleInput;
  String amountInput;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: 
      Column(
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
              Card(
                elevation: 5,
                child: Container( 
                 padding: EdgeInsets.all(15),
                 child:Column(
                   crossAxisAlignment: CrossAxisAlignment.end,
                   children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      onChanged: (value){
                       titleInput =  value;
                      }
                      ,),
                    TextField(
                      decoration: InputDecoration(labelText: 'Amount'),
                      onChanged: (value){
                       amountInput =  value;
                      }
                      ),
                    FlatButton(
                      child:Text('Add Transaction'),
                      textColor: Colors.black,
                      onPressed:(){
                        print(titleInput);
                        print(amountInput);
                      },
                    )
            
              ],
              )
              ),
              ),
               Column(
                  children: transactions.map((tx){
                  return Card(
                    child:Row(
                     
                      children: <Widget>[
                     
                        Container(
                            margin: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                            decoration: BoxDecoration(border: Border.all(color: Colors.black, width:2)),
                            padding: EdgeInsets.all(10),
                            
                            child: Text(
                             '₹ '+ tx.amount.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black                             
                              ),
                              )
                          ),
                          Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                            Text(
                              tx.title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black                             
                              ),

                            ),
                            Text(
                               DateFormat.yMMMd().format(tx.date),
                               style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey                           
                              ),)
                              ],
                          ),
                                          
                    ],)
                  );
                  }).toList(), //Now each transaction will be represented as widget
              ),          
           ],
      ),   
// This trailing comma makes auto-formatting nicer for build methods.
 
    );
  }
}
