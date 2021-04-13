import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment 1',
      
      theme: ThemeData(
       primarySwatch: Colors.pink[200],
      ),
     
      home: MyHomePage(title: 'Calculate Prime or Composite Number'),
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

 int integer;

final myController = TextEditingController();

 bool check(int n) {
  for (int a = 2; a <= n / 2; a++) {
      if (n % a == 0) {
        return false;
      } 
      else {
        return true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
       
        title: Text(widget.title),
      ),
      body: Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
     child: Container(
             decoration: BoxDecoration(
                color: Colors.grey.shade100,     
                border: Border.all(
                color: Colors.pink.shade800,
               width: 8,
    ),
    borderRadius: BorderRadius.circular(8),
  ),
         width: 600.0,  
         height: 500.0,    
         padding: EdgeInsets.all(35),  
         margin: EdgeInsets.all(40),  
         alignment: Alignment.topLeft,  
         child: Column(
           
                 children: [
                
                  Text("Please Enter an Integer to Conclude whether the Integer is Prime or Composite.", 
                  style: TextStyle(fontSize: 25,color: Colors.pink)
                  
                  ), 
                   new Container(
                      margin: EdgeInsets.all(54),
                     child:  new TextFormField(
                 keyboardType: TextInputType.number,
               inputFormatters: [new FilteringTextInputFormatter.allow(RegExp("[0-9.]")),],
                 controller: myController,
                decoration: new InputDecoration(
                  contentPadding: new EdgeInsets.fromLTRB(10, 10.0, 40.0, 10.0),
                  labelText: 'Enter Integer' ,
                  hoverColor: Colors.pink,
                  fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                          ),
                        ),
                       
                  ),
                
                validator: (val) =>
                    val.isEmpty ?"Please Enter Integer Number" : null,
                onSaved: (val) => integer = int.parse(val),
              ),
              ),
                   
              new Container(
                margin: EdgeInsets.all(12),
                
                
                 child: ElevatedButton(
                    
                     child: Text('Submit',
                     
                     style: TextStyle(fontSize: 14)),
                     style: ElevatedButton.styleFrom(
                primary: Colors.pink.shade400,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
               shape: RoundedRectangleBorder(),
                textStyle: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
                     onPressed: () {
                      
                      check(int.parse(myController.text));
                       return showDialog(
                            context: context,
                             builder: (context) { 
                              if((int.parse(myController.text)==1) || (int.parse(myController.text)==0)){
                       return AlertDialog(
                             content: Text(myController.text+" is neither a prime number nor a composite"),
                           );
                         }
                            else if(check(int.parse(myController.text))){
                              return AlertDialog(
                             content: Text(myController.text+" is a prime number"),
                           );
                            }
                           else{
                              return AlertDialog(
                              content: Text(myController.text+" is a Composite number"),
                            );
                           }
              },  );
              },
            
              ),
                 ),
                    
                 ],
         ),
      ),
      ),
      ),
    );
  }
}
