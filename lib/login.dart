import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  @override
  Widget build(BuildContext context) {
    String email='', password='';
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/login.png'),fit: BoxFit.cover)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35.0 , top: 170),
              child: Text('Happy Ester',style: TextStyle(
                color:  Colors.white,
                fontSize: 33.0,
              ),),

            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.5, right: 35, left: 35),
                child: Column(
                  children: [
                    TextField(
                      onChanged: (value){
                        email=value;
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.grey[100],
                        filled: true,
                        hintText: 'email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13)
                        )
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    TextField(
                      onChanged: (value){
                        password=value;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          fillColor: Colors.grey[100],
                          filled: true,
                          hintText: 'Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13)
                          )
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Sign In',style: TextStyle(
                          color:  Color(0xff4c505b),
                          fontSize: 27.0, fontWeight: FontWeight.w300
                        ),),
                        CircleAvatar(
                          radius: 30.0,
                          backgroundColor: Color(0xff4c505b),
                          child: IconButton(
                            color: Colors.white,
                            onPressed: () async{
                              try {
                                UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                                    email: email,
                                    password: password,
                                );
                                Navigator.pushNamed(context, 'home');
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'user-not-found') {
                                  print('No user found for that email.');
                                } else if (e.code == 'wrong-password') {
                                  print('Wrong password provided for that user.');
                                }
                              }
                            },
                            icon: Icon(Icons.arrow_forward ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 30.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        TextButton(onPressed : () {
                          Navigator.pushNamed(context, 'register');
                          },
                            child: Text('Sign Up',style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 22.0,
                          color: Color(0xff4c505b),
                          fontWeight: FontWeight.w300,
                        ),)),
                        TextButton(onPressed : () {}, child: Text('Forget password?',style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 22.0,
                          color: Color(0xff4c505b),
                          fontWeight: FontWeight.w300,
                        ),)),
                      ],

                    ),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
