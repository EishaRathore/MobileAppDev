import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
 String to = "";
 String subject = "";
 String body = "";

  bool checkboxValue = true;

  final _formKey = GlobalKey<FormState>();

 
  @override
 Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
              ),
         backgroundColor: Colors.white,
      ),
      body: Container(
         decoration: new BoxDecoration(
          color: Colors.white,
        ),
          child: Form( 
            key: _formKey,
         child: ListView(
             padding: EdgeInsets.all(16),
            children: [
              ListTile(
                isThreeLine: true,
                title : Text('Registre', style:  TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 22,
                ),
                ),
                subtitle: Text('Signup to experience new ways' ),
            ),
           Theme(
             child:ListTile(
                title : TextFormField(
                  autofocus: false,
                   validator: (value) {
                      int len = value.length;
                if (len == 0) {
                  return 'User Name cannot be empty!';
                }
                return null;
              },
                 decoration: new InputDecoration(  
                 // filled: true,
                   //fillColor: Colors.grey,
                    hintText: 'User Name',
                   prefixIcon: Icon(Icons.person_outline),
                border: const OutlineInputBorder(
               borderRadius: BorderRadius.all(Radius.circular(50.0)),
               borderSide: const BorderSide(
                       color: Colors.grey,
                       ),
                    ),
                   ),
                   
                   
              
                    ),
            ),
              data: Theme.of(context)
                                    .copyWith(primaryColor: Colors.red,),
             ),
           
           SizedBox(
             height: 5,
           ),
              Theme(
           child:  ListTile(
                title : TextFormField(
                decoration: const InputDecoration(
                 hintText: 'Email Id',
                     prefixIcon: Icon(Icons.alternate_email),
                     border: const OutlineInputBorder(
                       borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      borderSide: const BorderSide(
                      color: Colors.grey,
                   ),
                  ),
                 ),
               
                validator: (value) {

               if (value.isEmpty) {
          return 'Email is Required';
        }

        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }

        return null;
                },

             ),
            ),
              data: Theme.of(context)
                                    .copyWith(primaryColor: Colors.red,),
            ),
            SizedBox(
             height: 5,
           ),
           Theme(
             child: ListTile(
               
                title : TextFormField(
                  keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                   prefixIcon: Icon(Icons.phone_outlined,),
                 hintText: 'Mobile No',
                 
                  border: const OutlineInputBorder(
                       borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      borderSide: const BorderSide(
                      color: Colors.grey,
                   ),
                  ),
                 ),
              
                 validator: (value) {
                   if (value.isEmpty || value.length != 11)
                 return 'Mobile Number must be of 11 digit';
                   else
                    return null;
                },
               
             ),
            ),
             data: Theme.of(context)
                                    .copyWith(primaryColor: Colors.red,),
            ),
             SizedBox(
             height: 5,
           ),
           Theme(
             child:  ListTile(
              
                title : TextFormField(
                   obscureText: true,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline_rounded,),
                 hintText: 'Password',
                 
                  border: const OutlineInputBorder(
                       borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      borderSide: const BorderSide(
                      color: Colors.grey,
                   ),
                  ),
                 ),
               
               validator: (value) {

               if (value.isEmpty) {
          return 'Password is Required';
        }
      
        if (!RegExp(
               r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{5,}$")
            .hasMatch(value)) {
          return 'Password must be at least of 5 characters';
        }

        return null;
                },
             ),
            ),
             data: Theme.of(context)
                                    .copyWith(primaryColor: Colors.red,),
            ),
             SizedBox(
             height: 20,
           ),
          SizedBox(
             width: 50,
           ),
             
          ElevatedButton(
              onPressed: () {
                    if (this._formKey.currentState.validate()) {
                      return;
                    }
                    else{
                       
                    }
                    showAlertDialog(BuildContext context) {

                      // set up the button
                       Widget okButton = FlatButton(
                          child: Text("OK"),
                         onPressed: () { 

                         },
                            );

                           // set up the AlertDialog
                          AlertDialog alert = AlertDialog(
                       title: Text("Successfuly Registered!"),
                       actions: [
                             okButton,
                             ],
                           );

                         // show the dialog
                           showDialog(
                        context: context,
                          builder: (BuildContext context) {
                            return alert;
                             },
                             );
                          }
                    },
              child: Text("Register", style: TextStyle(fontSize: 30),),
              //isButtonEnabled?(){ print("Successful!");}:null,
              style: ElevatedButton.styleFrom( 
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),// returns ButtonStyle
                primary: Colors.green,
               onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.all(Radius.circular(50.0)),
              ),
              ),
               
            ),
            SizedBox(
             height: 10,
           ),
            SizedBox(
             width: 50,
           ),
             FormField<bool>(
               builder: (state) {
                return Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                           Checkbox(
                           value: checkboxValue,

                               onChanged: (value) {
                                    setState(() {
                                //save checkbox value to variable that store terms and notify form that state changed
                                     checkboxValue = value;
                                     state.didChange(value);
                                       });
                                        }),
                                    Text('  I accept the ',
                                    style: TextStyle(color: Colors.grey),
                                    ), Text('Term & Conditions',
                                    style: TextStyle(color: Colors.black),
                                    ),

                                       ],
                                   ),
                                //display error in matching theme
                                  Text(
                                  state.errorText ?? '',
                                    style: TextStyle(
                                    color: Theme.of(context).errorColor,
          ),
        )
      ],
    );
  },
    //output from validation will be displayed in state.errorText (above)
  validator: (value) {
    if (!checkboxValue) {
      return 'You need to accept terms';
    } else {
      return null;
    }
  },
), 
           ],
           ),
          
           ),
          
      ),
    );
  }
}
