import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  HomePage({super.key});
  final user = FirebaseAuth.instance.currentUser!;
  void signOut(){
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        
        actions: [
          IconButton(onPressed: signOut,
          icon: Icon(Icons.logout)),
        ]
      ),
      body: Center(
        child: Text("LOGGED IN AS: "+ user.email!),
      ),
    );
  }
}