import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void getLocation()async{
    Position position = await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print('Printing $position');
  }


  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/sky.jpg'))
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0,sigmaY: 0),
          child: Scaffold(
              backgroundColor: Colors.black.withOpacity(0.1),
              body: Center(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top:200),
                        child: Text("25°C",style:TextStyle(color:Colors.white,fontSize: 50)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.location_on,color: Colors.white,),
                            Text("NYC,USA",style: TextStyle(color:Colors.white),)
                          ],
                        ),
                      ),

                      Padding(
                          padding: EdgeInsets.only(top:200),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  // decoration: BoxDecoration(
                                  //   border: Border.all(color: Colors.purple[600],width: 2),
                                  //   borderRadius: BorderRadius.circular(25),
                                  // ),
                                    child: RaisedButton(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('Get Location',style:TextStyle(color:Colors.blue),),
                                      onPressed: (){
                                        getLocation();
                                      },
                                    )
                                ),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child: Container(
                              //     decoration: BoxDecoration(
                              //       border: Border.all(color: Colors.blue[600],width: 2),
                              //       borderRadius: BorderRadius.circular(25),
                              //     ),
                              //     child: Padding(
                              //       padding: const EdgeInsets.all(8.0),
                              //       child: Icon(Icons.wb_sunny,color:Colors.blue[600],size: 35,),
                              //     )
                              //   ),
                              // ),



                            ],
                          )
                      )
                    ],
                  )
              )
          ),
        )
    );
  }
}
