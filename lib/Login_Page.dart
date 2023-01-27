import 'package:flutter/material.dart';
import 'package:hotel_management/first.dart';

import 'SignUp.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController Username = TextEditingController();
  TextEditingController Password = TextEditingController();

  bool emailerror = false;
  bool passerror = false;
  bool hidepass = true;

  String ImagePath = "";

  String emailmsg = "";
  String passmsg = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login",style: TextStyle(color: Colors.black),),
        backgroundColor: Color(0xffdabb00),
      ),
      
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 60,
            ),
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: Color(0xffdabb00),
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(image: NetworkImage('https://media.istockphoto.com/id/1281150061/vector/register-account-submit-access-login-password-username-internet-online-website-concept.jpg?s=612x612&w=0&k=20&c=9HWSuA9IaU4o-CK6fALBS5eaO1ubnsM08EOYwgbwGBo='),fit: BoxFit.cover)
              ),
            ),

            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onChanged: (value) {
                  print(value);
                  if (emailerror) {
                    if (value.isNotEmpty) {
                      setState(() {
                        emailerror = false;
                      });
                    }
                  }
                },
                controller: Username,
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(0xffdabb00), width: 3)),
                    border: OutlineInputBorder(),
                    hintText: "Enter Username",
                    labelText: "Username",
                    labelStyle: TextStyle(color: Color(0xff000000)),
                    errorText: emailerror ? emailmsg : null,
                    prefixIcon: Icon(
                      Icons.email_rounded,
                      color: Color(0xff000000),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, bottom: 10, top: 3),
              child: TextField(
                onChanged: (value) {
                  print(value);
                  if (passerror) {
                    if (value.isNotEmpty) {
                      setState(() {
                        passerror = false;
                      });
                    }
                  }
                },
                controller: Password,
                obscureText: hidepass,
                style: TextStyle(color: Colors.black),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(0xffdabb00), width: 3)),
                    border: OutlineInputBorder(),
                    hintText: "Enter Your Password",
                    labelText: "Password",
                    labelStyle: TextStyle(color: Color(0xff000000)),
                    suffixIcon: IconButton(
                        onPressed: () {
                          hidepass = !hidepass;
                          setState(() {});
                        },
                        icon: hidepass
                            ? Icon(
                          Icons.visibility,
                          color: Color(0xff000000),
                        )
                            : Icon(
                          Icons.visibility_off,
                          color: Color(0xff676767),
                        )),
                    errorText: passerror ? passmsg : null,
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Color(0xff000000),
                    )),
              ),
            ),
            SizedBox(
              height: 10,
            ),

            InkWell(
              onTap: () async {
                String username = Username.text.trim();
                String password = Password.text.trim();

                String Username_Compare = "";
                String Password_Compare = "";
                String Name_Login = "";

                if (username.isEmpty) {
                  emailerror = true;
                  emailmsg = "Enter Uesrname ";
                  setState(() {});
                } else if (password.isEmpty) {
                  passerror = true;
                  passmsg = "Enter your password";
                  setState(() {});
                } else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return SimpleDialog(
                        children: [
                          Container(
                            height: 60,
                            child: ListTile(
                              leading: Container(
                                height: 45,
                                width: 45,
                                alignment: Alignment.center,
                                child: CircularProgressIndicator(),
                              ),
                              title: Text(
                                "Please Wait ...",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  );
                }
              },
              child: Container(
                height: 50,
                width: 120,
                alignment: Alignment.center,
                decoration: ShapeDecoration(
                    color: Color(0xffdabb00),
                    shadows: [
                      BoxShadow(
                          blurRadius: 7,
                          spreadRadius: 1,
                          offset: Offset(0, 3),
                          color: Colors.black.withOpacity(0.4))
                    ],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "You have no Account ? ",
                  style: TextStyle(color: Color(0xff7e7e7e), fontSize: 15,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SignUp();
                          },
                        ));
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: Color(0xff040065)),
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Goto Home ",
                  style: TextStyle(color: Color(0xff7e7e7e), fontSize: 15,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(
                          builder: (context) {
                            return first();
                          },
                        ));
                  },
                  child: Text(
                    "Home",
                    style: TextStyle(color: Color(0xff040065)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
