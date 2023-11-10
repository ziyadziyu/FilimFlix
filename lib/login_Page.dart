import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/components/my_button.dart';
import 'package:movieapp/components/sqaure%20tile.dart';
import 'package:movieapp/components/text_feild.dart';
import 'package:movieapp/homescreen.dart';


class Loginpage extends StatefulWidget {
  final Function()? onTap;
  const Loginpage({super.key, this.onTap});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void SignInUserIn() async {
// show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return Center(child: CircularProgressIndicator());
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Homescreen(),));
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
// show error message
      ShowErrorMessage(e.code);
    }

//pop loading ciricle
  }

  //wrongemail message popup
  void ShowErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Text(message),
            backgroundColor: Colors.red,
            icon: Icon((Icons.error_outline)));
      },
    );
  }

  //wrongPassword popup

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: ClipRRect(
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Icon(
                      Icons.lock,
                      size: 100,
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Welcome back you've been missed!",
                      style: GoogleFonts.dmSerifDisplay(
                          color: Colors.black87, fontSize: 16),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Mytextfeild(
                      hintText: "username",
                      obscuretext: false,
                      controller: emailController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Mytextfeild(
                      hintText: "paswword",
                      obscuretext: true,
                      controller: passwordController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Forget Password?",
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Mybutton(
                      text: "Sign In",
                      onTap: SignInUserIn,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        children: [
                          Expanded(
                              child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          )),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Text(
                              "Or continue with",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey[700]),
                            ),
                          ),
                          Expanded(
                              child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SqaurTile(
                          imagePath: "lib/images/google.png",
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        SqaurTile(imagePath: "lib/images/apple logo.png")
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Not a member?",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        GestureDetector(
                          onTap:widget.onTap,
                          child: Text(
                            "Register Now",
                            style: TextStyle(
                                color: Colors.blue, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
