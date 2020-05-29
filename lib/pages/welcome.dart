import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:register_shopping/pages/login_email.dart';
import 'package:register_shopping/pages/sign_up.dart';
import 'package:flutter/src/material/raised_button.dart';
class WelcomePage extends StatefulWidget {
  @override
_WelcomePageState createState()=>_WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
            appBar: AppBar(
        centerTitle: true,
        title: Text('Sample App'),
      ),
      body:new Stack(
         children: <Widget>[
      
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
           RaisedButton(
              color: Colors.green, 
                textColor: Colors.white,
              padding: const EdgeInsets.all(0.0),
              onPressed: navigateToSignUp,
              child: Text('Sign up',style: TextStyle(fontSize: 20)),
            ),
           new RaisedButton(
               color: Colors.green, 
              onPressed: navigateToSignIn,
              textColor: Colors.white,
              padding: const EdgeInsets.all(0.0),
           
            child: Text('Login', style: TextStyle(fontSize: 20)),
          
            ),
        ],
      ),
          ] 
          )
    );
    
  }
 Void navigateToSignIn(){
Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
  }
  Void navigateToSignUp(){
Navigator.push(context, MaterialPageRoute(builder: (context)=> SignupPage()));
  }
}