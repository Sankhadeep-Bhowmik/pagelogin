import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pagelogin/components/my_button.dart';
import 'package:pagelogin/components/textfield.dart';
import 'package:pagelogin/pages/forgotPassword.dart';
import 'package:pagelogin/pages/squareTile.dart';
import 'package:firebase_core/firebase_core.dart';

class loginpage extends StatefulWidget {
  final Function()? onTap;
  loginpage(
    {
      super.key,
      required this.onTap
    }
  );

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  // Controllers:
  final userEmailcontroller=TextEditingController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  // Sign in method
  void signIn() async {
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
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userNameController.text,
        password: passwordController.text,
      );
      
      // Close loading dialog on successful sign in
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context); 
      
      showErrorMessage(e.code,);
    } 
  }
  
  // Error display
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return Container(
          width: 100,
          height: 100,
          child: AlertDialog(
            backgroundColor: Colors.grey,
            title: Center(
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                ),
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
      backgroundColor:const Color.fromARGB(255, 242, 239, 239),
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
                  "Welcome back....You have been missed!",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 49, 48, 48),
                  ),
                ),
              
                // Username textfield
                SizedBox(height: 25),
                textfield(
                  controller: userEmailcontroller,
                  hintText: "U S E R N A M E",
                  obscureText: false,
                ),

                //E-MAIL
                SizedBox(height: 25),
                textfield(
                  controller: userNameController,
                  hintText: "E M A I L",
                  obscureText: false,
                ),
                // Password textfield
                SizedBox(height: 25),
                textfield(
                  controller: passwordController,
                  hintText: "P A S S W O R D",
                  obscureText: true,
                ),
                // Forgot password
                SizedBox(height: 12),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)
                          {
                            return ForgotPassword(); 
                          }));
                        },
                        child: const Text(
                          "F O R G O T   P A S S W O R D",
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                // Sign in button
                SizedBox(height: 16),
                my_button(
                  text: "S I G N  I N",
                  onTap: signIn,
                ),
                // Or continue with
                SizedBox(height: 20),
                const Padding(
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    square_tile(imgPath: "lib/images/google.png"),
                    SizedBox(width: 48),
                    square_tile(imgPath: "lib/images/Apple.png"),
                  ],
                ),
                // Not a member sign up
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("NOT A MEMBER?"),
                      SizedBox(width: 6),
                      GestureDetector(
                        onTap: widget.onTap,
                        child:const Text(
                          "REGISTER NOW",
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