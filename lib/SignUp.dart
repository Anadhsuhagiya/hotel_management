import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Login_Page.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  TextEditingController Name = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController PhoneNumber = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController DatePick = TextEditingController();

  bool nameerror = false;
  bool namevalid = false;
  bool emailerror = false;
  bool passerror = false;
  bool contacterror = false;
  bool hidepass = true;
  bool photoerror = false;

  int textLength = 0;
  int maxLength = 10;

  String contactmsg = "";
  String emailmsg = "";
  String passmsg = "";
  String ImagePath = "";

  String NAME = "";
  String EMAIL = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Sign Up",style: TextStyle(color: Colors.black),),
          backgroundColor: Color(0xffdabb00),
        ),

        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                height: 130,
                width: 130,
                decoration: BoxDecoration(
                    color: Color(0xffdabb00),
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(image: NetworkImage('https://img.freepik.com/free-vector/customers-sharing-references-earning-money_74855-5231.jpg?w=2000'),fit: BoxFit.cover)
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
                    if (nameerror) {
                      if (value.isNotEmpty) {
                        nameerror = false;
                        setState(() {});
                      }
                    }
                  },
                  controller: Name,
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  style: TextStyle(color: Color(0xff000000)),
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(0xffdabb00), width: 3)),
                      border: OutlineInputBorder(),
                      hintText: "Enter Name",
                      labelText: "Name",
                      labelStyle: TextStyle(color: Color(0xff000000)),
                      errorText:
                      nameerror ? "Please Enter Valid Name" : null,
                      prefixIcon: Icon(
                        Icons.person,
                        color: Color(0xff000000),
                      )),
                ),
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
                  controller: Email,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.sentences,
                  style: TextStyle(color: Color(0xff000000)),
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(0xffdabb00), width: 3)),
                      border: OutlineInputBorder(),
                      hintText: "Enter Email Address",
                      labelText: "Email",
                      labelStyle: TextStyle(color: Color(0xff000000)),
                      errorText: emailerror ? emailmsg : null,
                      prefixIcon: Icon(
                        Icons.email_rounded,
                        color: Color(0xff000000),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  onChanged: (value) {
                    textLength = value.length;
                    if (contacterror) {
                      if (value.isNotEmpty) {
                        setState(() {
                          contacterror = false;
                        });
                      }
                    }
                  },
                  controller: PhoneNumber,
                  keyboardType: TextInputType.phone,
                  textCapitalization: TextCapitalization.sentences,
                  style: TextStyle(color: Color(0xff000000)),
                  maxLength: 10,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xffdabb00))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(0xffdabb00), width: 3)),
                      counter: Offstage(),
                      suffixText:
                      '${textLength.toString()}/${maxLength.toString()}',
                      hintText: "Enter Your Contact",
                      labelText: "Contact",
                      labelStyle: TextStyle(color: Color(0xff000000)),
                      errorText: contacterror ? contactmsg : null,
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Color(0xff000000),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, bottom: 15),
                child: TextField(
                  onTap: () async {
                    DateTime? date = await showDatePicker(
                        context: context,
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: ColorScheme.light(
                                primary: Color(0xffdabb00),
                                // header background color
                                onPrimary: Colors.white,
                                // header text color
                                onSurface:
                                Colors.black, // body text color
                              ),
                              textButtonTheme: TextButtonThemeData(
                                style: TextButton.styleFrom(
                                  primary: Color(
                                      0xffdabb00), // button text color
                                ),
                              ),
                            ),
                            child: child!,
                          );
                        },
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1960),
                        lastDate: DateTime(2024));
                    DatePick.text =
                    "${date?.day} - ${date?.month} - ${date?.year}";
                    setState(() {});
                  },
                  controller: DatePick,
                  keyboardType: TextInputType.text,
                  autofocus: false,
                  readOnly: true,
                  textCapitalization: TextCapitalization.sentences,
                  style: TextStyle(color: Color(0xff000000)),
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(0xffdabb00), width: 3)),
                      border: OutlineInputBorder(),
                      hintText: "Pick Your BirthDate",
                      suffixIcon: IconButton(
                          onPressed: () async {
                            DateTime? date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1960),
                                lastDate: DateTime(2024));
                            DatePick.text =
                            "${date?.day} / ${date?.month} / ${date?.year} / ";
                            setState(() {});
                          },
                          icon: Icon(
                            Icons.calendar_today,
                            color: Color(0xff000000),
                          )),
                      labelText: "BirthDate",
                      labelStyle: TextStyle(color: Color(0xff000000)),
                      errorText: emailerror ? emailmsg : null,
                      prefixIcon: Icon(
                        Icons.date_range,
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
                  textCapitalization: TextCapitalization.sentences,
                  style: TextStyle(color: Color(0xff000000)),
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
                            color: Color(0xff000000),
                          )),
                      errorText: passerror ? passmsg : null,
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Color(0xff000000),
                      )),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already Registered ? ",
                    style: TextStyle(
                          color: Color(0xff7e7e7e), fontSize: 16),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Login();
                              },
                            ));
                      },
                      child: Text("Login",
                          style: TextStyle(
                                  color: Color(0xff000000),
                                  fontSize: 20))),
                  SizedBox(
                    width: 30,
                  ),
                  InkWell(
                    onTap: () async {
                      String name = Name.text.trim();
                      String Phone = PhoneNumber.text.trim();
                      String email = Email.text.trim();
                      String pass = Password.text.trim();
                      String Date = DatePick.text.trim();

                      // Map m = {'name': Name, 'phone': Phone, 'email': Email, 'pass': pass};

                      bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(email);
                      bool passValid = RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$')
                          .hasMatch(pass);

                      if (name.isEmpty) {
                        Fluttertoast.showToast(
                            msg: "Please Insert Name",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 15.0);
                        setState(() {
                          nameerror = true;
                        });
                      } else if (email.isEmpty) {
                        Fluttertoast.showToast(
                            msg: "Please Insert Email",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 15.0);
                        setState(() {
                          emailerror = true;
                          emailmsg = "Enter Email Address";
                        });
                      } else if (!emailValid) {
                        setState(() {
                          emailerror = true;
                          emailmsg = "Please Enter Valid Email Address";
                        });
                      } else if (Phone.isEmpty) {
                        Fluttertoast.showToast(
                            msg: "Please Insert Mobile Number",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 15.0);
                        setState(() {
                          contacterror = true;
                          contactmsg = "Enter your Contact";
                        });
                      } else if (Phone.length < 10) {
                        setState(() {
                          contacterror = true;
                          contactmsg = "Please Enter 10 digit Contact";
                        });
                      } else if (pass.isEmpty) {
                        Fluttertoast.showToast(
                            msg: "Please Create your own Password",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 15.0);
                        setState(() {
                          passerror = true;
                          passmsg = "Enter your password";
                        });
                      } else if (!passValid) {
                        setState(() {
                          passerror = true;
                          passmsg =
                          "Please Enter Valid Formatted password";
                        });
                      } else {

                        showDialog(context: context, builder: (context) {
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
                        },);

                        // String? key = database.ref('User').push().key;
                        // database.ref('User').child(key!).set({
                        //   'name': name,
                        //   'Phone': Phone,
                        //   'email': email,
                        //   'pass': pass,
                        //   'key': key
                        // });
                        //
                        // DatabaseEvent dv =
                        // await database.ref('User').once();
                        // Map temp = dv.snapshot.value as Map;
                        // data.clear();
                        // temp.forEach((key, value) {
                        //   data.add(value);
                        //   print(data);
                        // });
                        // setState(() {});
                        //
                        // String NAME = "";
                        // String EMAIL = "";
                        // for (int i = 0; i < data.length; i++) {
                        //   if(name == data[i]['name'] && email == data[i]['email'])
                        //   {
                        //     NAME = data[i]['name'];
                        //     EMAIL = data[i]['email'];
                        //     print("NAME : $NAME");
                        //     print("EMAIL : $EMAIL");
                        //   }
                        //
                        // }
                        // await Model.prefs!
                        //     .setString('Name', NAME);
                        // await Model.prefs!
                        //     .setString('Email', EMAIL);
                        // // await Model.prefs!.setString('Mobile', Mobile!);
                        // await Model.prefs!.setInt('registered', 1);
                        // Navigator.pushReplacement(
                        //     context,
                        //     PageRouteBuilder(
                        //       transitionDuration: Duration(milliseconds: 500),
                        //       pageBuilder:
                        //           (context, animation, secondaryAnimation) =>
                        //           drawerScreen(),
                        //       transitionsBuilder: (context, animation,
                        //           secondaryAnimation, child) {
                        //         return FadeTransition(opacity: animation,child: child,);
                        //       },
                        //     ));
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
                        "SignUp",
                        style: TextStyle(
                                color: Color(0xff000000),
                                fontSize: 20),
                      ),
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
