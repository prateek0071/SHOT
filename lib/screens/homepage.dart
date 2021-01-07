import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SHOT - Super Hero Training'
        ),
      ),
      body: MyHomeBody(),
    );
  }
}


class MyHomeBody extends StatefulWidget {
  @override
  _MyHomeBodyState createState() => _MyHomeBodyState();
}

class _MyHomeBodyState extends State<MyHomeBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          color: Colors.deepPurpleAccent,
          child: Column(children: <Widget>[

              Padding(
                padding: EdgeInsets.all(28),
                child: Text('Welcome to Shot',
                style: TextStyle(
                  color: Colors.pink,
                  fontSize: 30,
                  fontFamily: "Times New Roman"
                ),
                ),
              ),


              RaisedButton(
                onPressed: (){
                  Navigator.pushReplacementNamed(context, '/signin');
                },

                child: Text('SignIn'),
              ),

          ]),
        ),
      
      
    );
  }
}