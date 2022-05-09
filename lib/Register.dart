import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  @override
  Widget build(BuildContext context) {
    String email='', password='',name='';
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/register.png'),fit: BoxFit.cover)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35.0 , top: 170),
              child: Text('Create\n New',style: TextStyle(
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
                        name=value;
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.grey[100],
                          filled: true,
                          hintText: 'Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13)
                          )
                      ),
                    ),
                    SizedBox(height: 20.0),
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
                        Text('Sign Up',style: TextStyle(
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
                                UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                    email: email,
                                    password: password,
                                );
                                Navigator.pushNamed(context, 'home');
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'weak-password') {
                                  print('The password provided is too weak.');
                                } else if (e.code == 'email-already-in-use') {
                                  print('The account already exists for that email.');
                                }
                              } catch (e) {
                                print(e);
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
                          Navigator.pushNamed(context, 'login');
                        },
                            child: Text('Sign In',style: TextStyle(
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
