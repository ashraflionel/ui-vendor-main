import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Constants/apiurls.dart';
import 'package:flutter_application_1/Constants/exception_string.dart';
import 'package:flutter_application_1/Handlers/NetworkHandler.dart';
import 'package:flutter_application_1/Models/login_invaliduser.dart' as logincheckmodel;
import 'package:flutter_application_1/Pages/otp_page.dart';
import 'package:flutter_application_1/Pages/register_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tuple/tuple.dart';
import '../Models/exception_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String countrycode = "+91";
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _phoneno = TextEditingController();

  ValueNotifier<Tuple4> loginValueNotifier = ValueNotifier<Tuple4>(Tuple4(-1, exceptionFromJson(alert), "Null", null));

  Future logincheckuser() async {
    return await ApiHandler().apiHandler(
      valueNotifier: loginValueNotifier,
      jsonModel: logincheckmodel.logincheckFromJson,
      url: logincheckurl,
      requestMethod: 1,
      body: {"language_id": "1", "mobile": _phoneno.text},
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  void FormValidate() {
    if (_formkey.currentState!.validate()) {
      print("Validated");
      //logincheckuser();
      //login();
    } else {
      print("Not Validated");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //Body:
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: 220),
              Row(
                children: const [
                  Text(
                    "Login",
                    style: TextStyle(fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  SizedBox(width: 15),
                  Icon(Icons.fire_truck_sharp, size: 35)
                ],
              ),
              const SizedBox(height: 25),
              const Text(
                "Phone Number",
                style: TextStyle(fontSize: 15, fontFamily: 'Poppins', color: Colors.black),
              ),
              const SizedBox(height: 10),
              Container(
                height: 75,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                    width: 1,
                    color: Colors.grey, //
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: TextFormField(
                      maxLength: 10,
                      controller: _phoneno,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: "Enter a Phone Number",
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(top: 12, left: 10),
                          child: Text(
                            countrycode,
                            style: const TextStyle(color: Color(0xFFFFA000), fontFamily: 'Poppins', fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value!.isEmpty || !RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                          return "Enter Correct phone number";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (Phoneno) {
                        Phoneno = Phoneno!;
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 35),
              Container(
                height: 50,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                    primary: const Color(0xFFFFA000),
                  ),
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      return await logincheckuser().then((value) {
                        if (loginValueNotifier.value.item1 == 1) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OtpPage(
                                      phoneNumber: _phoneno.text,
                                      countryCode: countrycode,
                                    )),
                          );

                          Fluttertoast.showToast(
                            msg: loginValueNotifier.value.item4['success']['message'],
                            toastLength: Toast.LENGTH_LONG,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.amber,
                            textColor: Colors.white,
                            fontSize: 15.0,
                          );
                        } else {
                            Fluttertoast.showToast( 
                             msg: loginValueNotifier.value.item4['error']['message'],
                             toastLength: Toast.LENGTH_LONG,
                             timeInSecForIosWeb: 1,
                             backgroundColor: Colors.amber,
                             textColor: Colors.white,
                              fontSize: 15.0,
                               );
                          log(loginValueNotifier.value.item4['error']['message']);
                        }
                      });
                    }
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 15, fontFamily: 'Poppins', fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage()));
                      },
                      child: const Text(
                        "SignUp",
                        style: TextStyle(fontSize: 15, fontFamily: 'Poppins', fontWeight: FontWeight.bold, color: Colors.black),
                      )),
                  const Text("With US As A Vendor", style: TextStyle(fontSize: 15, fontFamily: 'Poppins', fontWeight: FontWeight.bold, color: Colors.grey)),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
