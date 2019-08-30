
import 'package:flutter/material.dart';

 String titleInput;
 String amountInput;
class NewTransaction extends StatelessWidget {
  final Function addTx;
  NewTransaction(this.addTx);
  
  void submitData(){
    if( titleInput.isEmpty || double.parse(amountInput)<=0)
    {
      return;
    }
    addTx(titleInput,double.parse(amountInput));
 
  }
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
                      },
                      onSubmitted: (_) => submitData(),
                      
                      ),
                    TextField(
            
                      decoration: InputDecoration(labelText: 'Amount'),
                      keyboardType: TextInputType.numberWithOptions(decimal: true ),
                      onChanged: (value){
                       amountInput =  value;
                      },
                      onSubmitted: (_) => submitData(),
                      ),
                    FlatButton(
                      child:Text('Add Transaction'),
                      textColor: Colors.black,
                      onPressed: submitData
                    )
            
              ],
              )
              ),
              );
  }
}