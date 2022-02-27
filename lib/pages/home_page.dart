import 'package:datademo1/pages/sign_up.dart';
import 'package:datademo1/services/db_service.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:line_icons/line_icons.dart';
import 'model/user.dart';

class HomePage extends StatefulWidget {
  static final String id = 'home_page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  doLogin() async{
    String email = emailController.text.toString().trim();
    String password = passwordController.text.toString().trim();

    var user = new User.from( email: email,password: password);

    HiveDB().storeUser(user);
     var user2 = HiveDB().loadUser();
     print(user2.email);
     print(user2.password);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[800],
      body: Container(
        child: Column(
          children: [
            //#header
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   SizedBox(height: 20,),
                   Container(
                     height: 50,
                     width: 50,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(25),
                       image: DecorationImage(
                         image: NetworkImage("https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cG9ydHJhaXQlMjBnaXJsfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"),
                        fit: BoxFit.cover,
                       ),
                     ),
                   ),
                   SizedBox(height: 20,),
                   Text("Welcome", style: TextStyle(color: Colors.grey[300], fontSize: 18),),
                   SizedBox(height: 10,),
                   Text('Sign In', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),),
                   SizedBox(height: 20,),
                   //#body
                   
                 ],
               ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),

                ),
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 20,),
                        Text("Email", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                        SizedBox(height: 10,),
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: "Email",
                          ),
                        ),
                        SizedBox(height: 30,),
                        Text("Password", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                        SizedBox(height: 10,),
                        TextField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            hintText: "Enter Password",
                          ),
                        ),
                        SizedBox(height: 30,),
                        Center(child: Text('Forgot password ?', style: TextStyle(color: Colors.grey[400]),)),
                        SizedBox(height: 30,),
                        GestureDetector(
                          onTap: () {
                            doLogin();
                          },
                          child: Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.teal[800],

                            ),
                            child: Center(
                              child: Text("Sign in", style: TextStyle(color: Colors.white,fontSize: 20),),
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            SizedBox(width: MediaQuery.of(context).size.width/2 -70,
                            child: Divider(),),
                            SizedBox(width: 30,),
                            Text("OR", style: TextStyle(color: Colors.grey[400]),),
                            SizedBox(width: 30,),
                            SizedBox(width: MediaQuery.of(context).size.width/2 - 70,
                            child: Divider(),
                            )

                          ],
                        ),
                        SizedBox(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            Icon(Icons.facebook, color: Colors.blue,),
                            SizedBox(width: 40,),
                            Icon(Icons.telegram, color: Colors.blueAccent,),
                            SizedBox(width: 40,),
                            Icon(LineIcons.instagram, color: Colors.deepOrange),
                          ],
                        ),
                        SizedBox(height: 40,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don`t have an account ?"),
                            SizedBox(width: 5,),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed(SignUp.id);
                              },
                                child: Text("Sign Up", style: TextStyle(color: Colors.teal[800]),)),
                          ],
                        )


                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
