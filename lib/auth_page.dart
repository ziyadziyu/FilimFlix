import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/homescreen.dart';
import 'package:movieapp/login_Page.dart';

import 'loginorregisterpage.dart';

class Authpage extends StatelessWidget {
  const Authpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            // user is logged in
            return Homescreen();
          }
      // user is not logeed in
          else {
            return LoginorRegisterPage();
          }
        },
      ),
    );
  }
}
