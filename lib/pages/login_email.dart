import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:register_shopping/pages/login_phone.dart';
import 'package:register_shopping/pages/signup_phone.dart';

import 'address_signup.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email,_password;
  final GlobalKey<FormState> _formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title:Text('Login'),
      ),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(
              "assets/images/morning.jpg"
            ),
            fit: BoxFit.cover),
          ),
        child:  
        Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,  
        children: <Widget>[ 
        Center( 
        child:Form(
        key: _formkey,
        //TODO: Implementing key
        child: Column(
          children: <Widget>[
            TextFormField(
              style: new TextStyle(color: Colors.white),
              validator: (input) {
                if (input.isEmpty){
                  return 'Please give an Email';
                }
              },
              onSaved: (input)=> _email=input,
              decoration: InputDecoration(
              fillColor: Colors.black, filled: true, 
               labelText: 'Email',
               labelStyle: TextStyle(color:Colors.white)
              ),
            ),
            TextFormField(
              style: new TextStyle(color: Colors.white),
              validator: (input) {
                if (input.isEmpty){
                  return 'Please give a Password';
                }
                if (input.length<8){
                  return 'you are password must contain atleast 8 characters';
                }
              },
              onSaved: (input)=> _password=input,
              decoration: InputDecoration(
               fillColor: Colors.black, filled: true, 
               labelText: 'Password',
                labelStyle: TextStyle(color:Colors.white)
              ),
              obscureText: true,
            ),
            new RaisedButton(
              color: Colors.green,
              onPressed: signupp,
               textColor: Colors.white,
              padding: const EdgeInsets.all(0.0),
              child: Text('Phone number Login',style: TextStyle(fontSize: 20) ),
            ),
            RaisedButton(
              color: Colors.green,
              onPressed: logIn,
               textColor: Colors.white,
              padding: const EdgeInsets.all(0.0),
              child: Text('Login',style: TextStyle(fontSize: 20) ),
            ),
        //TODO: Implementing Fields
          ],
        ),
        ),
        )
        ]
        )
      )
    
      );
      
  }
    void signupp(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignuppPage()));
  }

  
  Future<void> logIn() async{
    final formState= _formkey.currentState;
    if(formState.validate()){
      formState.save();
      try{
       final FirebaseUser currentUser = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email , password: _password)).user;
    //TODO: Validate Fileds and login to firebase
      Navigator.push(context, MaterialPageRoute(builder: (context)=> AddressPage()));
    
      }
      catch(e){
          print(e.message);
      }
    }
  }
}