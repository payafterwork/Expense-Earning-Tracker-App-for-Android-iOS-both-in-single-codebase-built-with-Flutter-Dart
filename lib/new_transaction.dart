
import 'package:flutter/material.dart';

 String titleInput;
 String amountInput;
class NewTransaction extends StatelessWidget {
  final Function addTx;
  NewTransaction(this.addTx);
  @override
  Widget build(BuildContext context) {
      
    return Card(
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
                        addTx(titleInput,double.parse(amountInput));
                      },
                    )
            
              ],
              )
              ),
              );
  }
}