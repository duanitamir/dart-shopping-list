import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Shopping(),
));

class Shopping extends StatefulWidget {
  @override
  _TestCompState createState() => _TestCompState();
}

class _TestCompState extends State<Shopping> {

  int color = 100;
  String title = "SHOPPING LIST APP";
  String itemTitle;
  List shoppingList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.grey[150],
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(
            letterSpacing: 2
          ),),
        centerTitle: true,
          backgroundColor: Colors.indigo[700],
      ),
      body: ListView(
        children: <Widget>[
                for(var item in shoppingList )
                  Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                        SizedBox(
                        width: 200,
                        child: Padding(
                              padding:  EdgeInsets.all(8.0),
                              child: Text(
                             item.name,
                             textAlign: TextAlign.left,
                             style: TextStyle(
                               fontSize: 15,
                               color:Colors.grey[800]
                             ),)
                          ),
                        ),
                         Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: <Widget>[
                             Padding(
                               padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                               child: Text(item.amount.toString(),
                                 style: TextStyle(
                                     fontWeight: FontWeight.bold
                                 ),),
                             ),
                            SizedBox(
                              width: 50,
                              child: Padding(
                               padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                               child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  color: Colors.transparent,
                                  textColor: Colors.white,
                                  padding: EdgeInsets.all(8.0),
                                 child: Text('+1'),
                                  onPressed: () {
                                    setState(() {
                                      item.amount = item.amount + 1;
                                    });
                                  }),
                             ),
                            ),
                               item.amount!=0? SizedBox(
                                 width: 50,
                                 child: Padding(
                                   padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                                   child: RaisedButton(
                                       shape: RoundedRectangleBorder(
                                         borderRadius: BorderRadius.circular(10.0),
                                       ),
                                       color: Colors.transparent,
                                       textColor: Colors.white,
                                       padding: EdgeInsets.all(8.0),
                                       child: Text('-1'),
                                       onPressed: () {
                                         if( item.amount > 0){
                                           setState(() {
                                             item.amount = item.amount - 1;
                                           });
                                         }
                                       }),
                                 ),
                               ) : Container(),
                               SizedBox(
                                 width: 50,
                                 child: Padding(
                                   padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                                   child: RaisedButton(
                                       shape: RoundedRectangleBorder(
                                         borderRadius: BorderRadius.circular(10.0),
                                       ),
                                       color: Colors.transparent,
                                       textColor: Colors.grey[800],
                                       padding: EdgeInsets.all(8.0),
                                       child: Text('X'),
                                       onPressed: () {
                                           setState(() {
                                             shoppingList.removeWhere((listItem) => listItem.name == item.name);
                                           });
                                       }),
                                 ),
                               )


                            ]
                          )
                        ],
                      ),
                      color: item.amount == 0 ? Colors.grey[200] : Colors.grey[50] ,
                    ),
                  ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: TextStyle(
                fontSize: 18,
              ),
              onChanged: (text) { itemTitle = text;},
              decoration: InputDecoration(
                border: new UnderlineInputBorder(
                  borderSide: new BorderSide(
                  color: Colors.indigo
                  )
                  ),
                hintText: shoppingList.length > 0 ? 'What else do you need?' : 'Add item to shopping list',
              ),
            ),
          ),

          new RaisedButton(
            padding: const EdgeInsets.all(8.0),
            textColor: Colors.white,
            color: Colors.indigo[700],
            onPressed: (){
              if(itemTitle.length > 0){
                setState(() {
                  color = color + 100;
                  Item item = new Item(itemTitle, color);
                  itemTitle = "";
                  shoppingList.add(item);
                });
              }
            },
            child: new Text("Add"),
          ),

        ],
      )
    );
  }
}


class Item {
  String name;
  int colorShade;
  int amount;

  Item(String name, int colorShade){
    this.colorShade = colorShade;
    this.name = name;
    this.amount = 1;
  }
}

