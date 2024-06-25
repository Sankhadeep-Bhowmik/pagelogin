import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pagelogin/components/my_button.dart';
import 'package:pagelogin/components/textfield.dart';
import 'package:pagelogin/pages/sevices/auth_service.dart';
import 'package:pagelogin/pages/squareTile.dart';
import 'package:firebase_core/firebase_core.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  RegisterPage(
    {
      super.key,
      required this.onTap
    }
  );

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Controllers:
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();

  // Sign in method
  void signUp() async {
    // Show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    );

    try {
      //check if confirm password & password same
      if(passwordController.text == confirmpasswordcontroller.text)
      {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userNameController.text,
        password: passwordController.text,
      );
      }
      else{
        //show error
        showErrorMessage("PASSWORDS DO NOT MATCH");
      }
      
      // Close loading dialog on successful sign in
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //pop loading circle
      Navigator.pop(context);
      //Show the Error Message
      showErrorMessage(e.code); 
    } 
  }
  
  // Error display
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey,
          title: Center(
            child: Text(
              message,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 239, 239),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Container(
                  height: 120,
                  width: 120,
                  child: Center(
                    child: Image.asset(
                      'lib/images/logo.png',
                      height: 200,
                      width: 200,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                // Welcome back text
                const Text(
                  "W E L C O M E  T O  T H E  F A M I L Y",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 49, 48, 48),
                  ),
                ),
                // Username textfield
                SizedBox(height: 25),
                textfield(
                  controller: userNameController,
                  hintText: "U S E R N A M E / E M A I L",
                  obscureText: false,
                ),
                // Password textfield
                SizedBox(height: 25),
                textfield(
                  controller: passwordController,
                  hintText: "P A S S W O R D",
                  obscureText: true,
                ),
                //confirm password
                SizedBox(height: 25),
                textfield(
                  controller: confirmpasswordcontroller,
                  hintText: "C O N F I R M   P A S S W O R D",
                  obscureText: true,
                ),
                // Sign in button
                SizedBox(height: 20),
                my_button(
                  text: "S I G N  U P",
                  onTap: signUp,
                ),
                // Or continue with
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Color.fromARGB(255, 237, 233, 233),
                        ),
                      ),
                      Text("OR CONTINUE WITH"),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Color.fromARGB(255, 237, 233, 233),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                // Google button and Apple button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      square_tile(imgPath: "lib/images/google.png",
                      onTap: () => AuthService().signInWithGoogle(),
                      ),
                    SizedBox(width: 48),
                    square_tile(imgPath: "lib/images/Apple.png",
                    onTap: (){},),
                  ],
                ),
                // Not a member sign up
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("ALREADY HAVE AN ACCOUNT?"),
                      SizedBox(width: 6),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          "LOGIN NOW",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
