

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:register_shopping/pages/address_signup.dart';

class SignuppPage extends StatelessWidget {
  final _phoneController = TextEditingController();
  final _codeController = TextEditingController();

  Future<bool> loginUser(String phone, BuildContext context) async{
    FirebaseAuth _auth = FirebaseAuth.instance;

    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async{
          Navigator.of(context).pop();

          AuthResult result = await _auth.signInWithCredential(credential);

          FirebaseUser user = result.user;

          if(user != null){
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => AddressPage()
            ));
          }else{
            print("Error");
          }

          //This callback would gets called when verification is done auto maticlly
        },
        verificationFailed: (AuthException exception){
          print(exception);
        },
        codeSent: (String verificationId, [int forceResendingToken]){
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                title: Text("Give the code?"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextField(
                      controller: _codeController,
                    ),
                  ],
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text("Confirm"),
                    textColor: Colors.white,
                    color: Colors.blue,
                    onPressed: () async{
                      final code = _codeController.text.trim();
                      AuthCredential credential = PhoneAuthProvider.getCredential(verificationId: verificationId, smsCode: code);

                      AuthResult result = await _auth.signInWithCredential(credential);

                      FirebaseUser user = result.user;

                      if(user != null){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => AddressPage()
                        ));
                      }else{
                        print("Error");
                      }
                    },
                  )
                ],
              );
            }
          );
        },
        codeAutoRetrievalTimeout: null
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home:Scaffold(
         appBar:AppBar(
             backgroundColor: Colors.green,
           centerTitle: true,
          title: Text("Phone Login")
        ),
       body:  SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(32),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                     style: new TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      fillColor: Colors.black, filled: true, 
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color: Colors.grey[200])
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color: Colors.grey[300])
                        ),
                        labelText: "Mobile Number",
                        labelStyle: TextStyle(color:Colors.white)
                    ),
                    controller: _phoneController,
                  ),

                  SizedBox(height: 16,),


                  Container(
                    width: double.infinity,
                    child:FlatButton(
                      child: Text("LOGIN",style: TextStyle(fontSize: 20)),
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(0.0),
                      onPressed: () {
                        final phone = _phoneController.text.trim();

                        loginUser(phone, context);

                      },
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    )
    );
  }
   
}
