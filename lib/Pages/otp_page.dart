import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Handlers/FirebaseAutentication.dart';
import 'package:flutter_application_1/Pages/home_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:http/http.dart' as http;

class OtpPage extends StatefulWidget {
  final String countryCode;
  final String phoneNumber;
  const OtpPage({Key? key, required this.phoneNumber, required this.countryCode}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  String? otp;
  Timer? _timer;
  int _counter = 60;
  OtpFieldController otpController = OtpFieldController();
  var statusCode = null;


  Future login() async{ 
    try{ 
      print(widget.phoneNumber);
      var datas= jsonEncode({
         "language_id":"1",
          "language_code":"en",
          "mobile":widget.phoneNumber,
          "push_id":"68253c26-a746-4ec4-8a60-826e030188f6",
          "device_type":"1"
          });
        
        Response response = await http.post(
        Uri.parse('http://34.226.226.234/index.php?route=store/store/login'),
        body: datas
        );

print(response.body);
var data = jsonDecode(response.body.toString());
statusCode = response.statusCode;
      if(response.statusCode == 200){
        log('Login successfully');
       //LoginSuccess
       // Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage()));
      }else {
        print('failed');
        Fluttertoast.showToast( 
          msg:data['error']['message'],
          toastLength: Toast.LENGTH_LONG,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.amber,
          textColor: Colors.white,
          fontSize: 15.0,
          );
      }
    }catch(e){
      print(e.toString());
    }
  }

  @override
  void initState() {
    verifyPhone(phoneNumber: "${widget.countryCode} ${widget.phoneNumber}");
    _startTimer();
    super.initState();
  }

  @override
  void dispose() {
    // otpController.clear();
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
         backgroundColor: Colors.white,
        //AppBar
        appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon:const Icon(Icons.arrow_back,size: 25,color: Colors.black,),
        ),
        elevation: 0,
      ),


      //body:
      body: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("OTP",
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Poppins',color: Colors.black)),
                  const SizedBox(height: 25),
                   const Text("Enter the One Time Password sent to your\nPhone number.",
                   style: TextStyle(fontSize: 15,color: Colors.black),),
                   const SizedBox(height: 25),

              Text((_counter == 60) ? "01:00" : "00:$_counter"),

              OTPTextField(
                  controller: otpController,
                  length: 6,
                  width: MediaQuery.of(context).size.width,
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldWidth: 50,
                  fieldStyle: FieldStyle.underline,
                  outlineBorderRadius: 15,
                  style:const TextStyle(fontSize: 15,),
                  onChanged: (value)async{
                    if(value.length == 6){
                      await FirebaseVerify();
                    }
                  },
                  onCompleted: (pin) {
                  otp = pin;
                  }),


                  const SizedBox(height: 35),

                Container(
                height: 50,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: const Color(0xFFFFA000),
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
                 onPressed: () async {
                 await FirebaseVerify();
                  },
                  child: const Text("Submit",
                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,fontFamily: 'Poppins',color: Colors.white),),
                ),
              ),

              const SizedBox(height: 20),

              Center(
              child: TextButton(
                  onPressed: ()async{
                    //Wait till the timer ends
                    if(!_timer!.isActive){
                       await verifyPhone(phoneNumber: "${widget.countryCode} ${widget.phoneNumber}");
                       _startTimer();
                    }
                }, 
                    child:  const Text("Resend OTP",
                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,fontFamily: 'Poppins',color: Colors.black),)),
              ),
            ],
          ),
        ),
      ),
    )));
  }

  void _startTimer() {
    _counter = 60;
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          _timer!.cancel();
        }
      });
    });
  }

Future FirebaseVerify()async{
  if (otp != null) {
          var authCredential = await phoneCredential(otp!);
          UserCredential userCredential = await signIn(authCredential);
          try {
          if (userCredential.user!.uid != null) {
           //FireStore CreateDB
           await login().then((value) {
           if(statusCode==200){
           return Navigator.pushAndRemoveUntil(
           context,
           MaterialPageRoute(builder: (context) =>const HomePage()),
          (route) => false,
          );
          }
          });
// ignore: use_build_context_synchronously
          }
        } catch (e) {
           log(e.toString());
       }
    }
}
}




