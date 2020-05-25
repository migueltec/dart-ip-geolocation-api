import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ip_geolocation_api/ip_geolocation_api.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Hola page',
            home: HomePage(),
        );
    }
}

class HomePage extends StatefulWidget{

    @override
    _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    String text = '';
    GeolocationData geolocationData;

    @override
    void initState() {
        super.initState();
        getIp();
    }
    Future<void> getIp() async{
        geolocationData = await GeolocationAPI.getData();
        if (geolocationData!=null){
            setState(() {
                text = geolocationData.ip;
            });
        }
    }

    @override
    Widget build(BuildContext context){
        return Scaffold(
            body: Center(
                child: Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                            Text(text),
                            FlatButton(
                                child: Text('toJSON'),
                                onPressed: (){
                                    if ( geolocationData==null ) return;
                                    setState(() {
                                        text = jsonEncode(geolocationData.toJson());
                                    });
                                }, 
                            ),
                        ],
                    ),
                ),
            ),
        );
    }
}