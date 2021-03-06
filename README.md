# ip_geolocation_api

A dart package to get your geolocation data from your IP.

## Example

```dart
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ip_geolocation_api_mtec/ip_geolocation_api_mtec.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Geolocation Demo',
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
```