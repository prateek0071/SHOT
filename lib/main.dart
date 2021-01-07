import 'package:flutter/material.dart';
import 'screens/homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/loading.dart';
import 'screens/signin.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override 
  Widget build(BuildContext context){
    return FutureBuilder(future: _initialization,
    builder: (context, snapshot){
      if(snapshot.hasError){
        return SomethingWentWrong();
      }
     if (snapshot.connectionState == ConnectionState.done) {
          return MyAwessomeApp();
        }

        return Loading();
    },
    );
  }
}

class MyAwessomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      routes: {
        '/home': (context)=> HomePage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),
      home: HomePage(),
    );

  }
}



class SomethingWentWrong extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Error - 404'),
        
      ),
      body: Center(
        child: Text('Something Went Wrong'),
      ),
    );
  }
}    