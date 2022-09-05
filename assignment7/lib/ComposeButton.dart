import 'package:assignment7/Message.dart';
import 'package:assignment7/MessageCompose.dart';
import 'package:flutter/material.dart';

class ComposeButton extends StatelessWidget {
  final List<Message> messages ;
  ComposeButton(this.messages);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () async {
        Message message = await Navigator.push(
          context, 
         MaterialPageRoute(
                  builder: (BuildContext context)=> MessageCompose()
                  )
                  );
       
     if(message != null ){
       messages.add(message);
        Scaffold.of(context).showSnackBar(
        SnackBar(
        content: Text("Your Message has been sent with $message"),
        backgroundColor: Colors.green,
        ),
        );
     }
    
     
      },
    );
  }
}