import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/Gstdetails_page.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}


class _RegisterPageState extends State<RegisterPage> {
late String name,email,phone;
bool isChecked = false;
bool GstChecked = false;
final TextEditingController username= TextEditingController();
final TextEditingController emailid= TextEditingController();
final TextEditingController contactno= TextEditingController();
final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  // ignore: non_constant_identifier_names
  FormValidate(){
  if(_formkey.currentState!.validate()){
    return;
  }
  else
  { }
}

//  register(String  username, emailid, contactno) async
//  {
//     Map data = {
//       'username': username,
//       'Email': emailid,
//       'Mobile': contactno,
//     };
//     print(data);
//     String body = json.encode(data);
//     var url = 'http://34.226.226.234/index.php?route=app/account/edit';
//     var response = await http.post( Uri.parse(url),
//       body: {"firstname":"Ashok","lastname":"Kumar","email":"testing@exlcart.com","telephone":"+918526622900",
//       "exists":"0","image":"","fax":"","language_id":"1","password":"123456","push_id":"6eaa3298-b573-11ec-8555-000000000000",
//       "device_type":"1","gender":"1","dob":"20/04/1983"},
//       headers: {
//         "Content-Type": "application/json",
//         "accept": "application/json",
//         "Access-Control-Allow-Origin": "*"
//       },
//     );
//     print(response.body);
//     print(response.statusCode);
//     if (response.statusCode == 200) {
//          //jsonResponse = json.decode(response.body.toString());
//          //ScaffoldMessenger.of(context)
//          //showSnackBar(SnackBar(content:Text(" ${jsonResponse['Message']}")));
//       print('success');
//     setState(() {
//     Navigator.push(context, MaterialPageRoute(builder: (context)=>const GstDetailsPage()));
//       });
//       print('success');
//     } else {
//       print('error');
//     }
//   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              const Text("Sign Up",
              style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),),
              const SizedBox(height: 30),
              const  Text("User Name",
              style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
              const SizedBox(height: 10),
              //UserName
              Container(
              padding:const EdgeInsets.all(10.0),
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(
              width: 1, 
              color: Colors.grey,//                  
                ),
              ),
              child: TextFormField( 
              controller: username,
              keyboardType: TextInputType.text,
              cursorColor: Colors.black,
              decoration:const InputDecoration(
              border: InputBorder.none,
              ),
                 validator: (value){
                  if(value!.isEmpty){
                    return "Please Enter Username";
                  }
                return null;
                },
                onSaved: (username){
                name = username!;
                },
              ),
            ),
            const SizedBox(height: 25),
            //Email address:
             const  Text("Email Address",
                style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
                const SizedBox(height: 10),
                 Container(
                padding:const EdgeInsets.all(10.0),
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                width: 1, 
                color: Colors.grey,//                  
                    ),
              ),
              child: TextFormField(
                controller: emailid,
                keyboardType: TextInputType.text,
                cursorColor: Colors.black,
                decoration:const InputDecoration(
                border: InputBorder.none,
                ),
                 validator: (value){
                  if(value!.isEmpty){
                    return "Please Enter EmailId";
                  }
                  return null;
                },
                onSaved: (emailid){
                  email = emailid!;
                },
              ),
            ),
            //Phone Number
              const SizedBox(height: 25),
            //E mail address:
             const  Text("Phone Number",
                style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
                const SizedBox(height: 10),
                 Container(
                padding:const EdgeInsets.all(10.0),
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                width: 1, 
                color: Colors.grey,//                  
                    ),
              ),
              child: TextFormField(
                maxLength: 10,
                controller: contactno,
                keyboardType: TextInputType.number,
                cursorColor: Colors.black,
                decoration:const InputDecoration(
                border: InputBorder.none,
                ),
                  validator: (value){
                  if(value!.isEmpty){
                    return "Please Enter PhoneNo";
                  }
                  return null;
                  },
                onSaved: (Phoneno){
                  Phoneno = Phoneno!;
                },
              ),
            ),
                  const SizedBox(height: 15),
                  CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title:const Text('Yes, I agree to the Terms of Service and Privacy Policy',
                  style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black),), 
                  value: isChecked,
                  onChanged: (value){
            setState(() {
              isChecked = value!;
            },
            );
                  },
                  activeColor:  const Color(0xFFFFA000),
                  checkColor: Colors.white,),
                  //Gst Checked :
                  CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title:const Text('I have GST',
                  style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black),), 
                  value: GstChecked,
                  onChanged: (value){
            setState(() {
              GstChecked = value!;
            },
            );
                  },
                  activeColor:  const Color(0xFFFFA000),
                  checkColor: Colors.white,),
                  const SizedBox(height: 25),
                  Container(
            height: 50,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                primary:  const Color(0xFFFFA000),
            ),
              onPressed: (){
                setState(() {
                  FormValidate();
                });
              },
              child: const Text("Submit",
              style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),
            ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
   InputDecoration buildInputDecoration(IconData icons,String hinttext) {
  return InputDecoration(
    hintText: hinttext,
    prefixIcon: Icon(icons),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide:const BorderSide(
          color: Colors.green,
          width: 1.5
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide:const BorderSide(
        color: Colors.blue,
        width: 1.5,
      ),
    ),
    enabledBorder:OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide:const BorderSide(
        color: Colors.blue,
        width: 1.5,
      ),
    ),
  );
}
}