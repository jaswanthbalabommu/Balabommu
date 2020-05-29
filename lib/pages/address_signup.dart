import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart'; 
class AddressPage extends StatefulWidget {
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
 
  String _locationMessage = ""; 

  void _getCurrentLocation() async {

    final position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);
   
    setState(() {
      _locationMessage = "${position.latitude}, ${position.longitude}";
    });

  }


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
             backgroundColor: Colors.green,
           centerTitle: true,
          title: Text("Location Services")
        ),
        body: Align(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            RaisedButton(
              color: Colors.green,
              onPressed: () {
                  _getCurrentLocation();
              },
               textColor: Colors.white,
              padding: const EdgeInsets.all(0.0),
              child: Text('Take my current location',style: TextStyle(fontSize: 20) ),
            ),  
            Text(_locationMessage), 
            TextFormField(
              style: new TextStyle(color: Colors.white),
              validator: (_locationMessage) {
                if (_locationMessage.isEmpty){
                  return 'Please give a Address';
                }
              },
              decoration: InputDecoration(
              fillColor: Colors.black, filled: true, 
               labelText: 'Location',
               labelStyle: TextStyle(color:Colors.white)
              ),
            ), 
          ]),
        )
      )
    );
  }
}