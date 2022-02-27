import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../services/db_service.dart';
import 'model/user.dart';

class SignUp extends StatefulWidget {
  static final String id = 'sign_up';
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailController = TextEditingController();
  final numberController = TextEditingController();
  final addressController = TextEditingController();
  doLogin() async{
    String email = emailController.text.toString().trim();
    String number = numberController.text.toString().trim();
    String address = addressController.text.toString().trim();

    var user = new User.account( email: email,number: number, address: address);

    HiveDB().storeUser(user);
    var user2 = HiveDB().loadUser();
    print(user2.email);
    print(user2.number);
    print(user2.address);
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
                  Text("Welcome", style: TextStyle(color: Colors.grey[300], fontSize: 18),),
                  SizedBox(height: 10,),
                  Text('Sign Up', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),),
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
                        Text("Number", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                        SizedBox(height: 10,),
                        TextField(
                          controller: numberController,
                          decoration: InputDecoration(
                            hintText: "Enter Number",
                          ),
                        ),
                        SizedBox(height: 30,),
                        Text("Address", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                        SizedBox(height: 10,),
                        TextField(
                          controller: addressController,
                          decoration: InputDecoration(
                            hintText: "Enter Address",
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
                              child: Text("Sign Up", style: TextStyle(color: Colors.white,fontSize: 20),),
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
