import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sign-In flutter')
      ),
      body: SignInBody(),
    );
  }



Widget SignIn(String hint, String label, String helper){
  return Padding(
    padding: const EdgeInsets.all(18.0),
    child: TextField(
      decoration: InputDecoration(
        hintText: "$hint",
        labelText: "$label",
        helperText: "$helper",
        hoverColor: Colors.red
      ),

    ),
  );
}

class SignInBody extends StatefulWidget {
  @override
  _SignInBodyState createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: <Widget>[
          Center(child: ListTile(title: Text('SignIn'),)),

          SizedBox(height:20,),

          SignIn('username', 'your username', ''),
          SignIn('password', 'your password', 'min 8 letters or numbers'),
          Padding(padding: EdgeInsets.all(25),
          child: RaisedButton(
            //firebase method to check if the user is logged in or logged out
            onPressed: (){
                                FirebaseAuth.instance
                    .authStateChanges()
                    .listen((User user) {
                      if (user == null) {
                        print('User is currently signed out!');
                      } else {
                        print('User is signed in!');
                      }
                    });
            },
          ),),

          Padding(padding: EdgeInsets.all(25),
          child: RaisedButton(
            //firebase method to check if the user is logged in or logged out
            onPressed: (){
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),),
       
       
       
       
        //main listview ending ------------------------------------------
        ],
      ),
    );
  }
}