import 'package:flutter/material.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

 class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Column(
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
              );     
  }
}