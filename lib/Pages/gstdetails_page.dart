import 'package:flutter/material.dart';

class GstDetailsPage extends StatefulWidget {
  const GstDetailsPage({Key? key}) : super(key: key);

  @override
  State<GstDetailsPage> createState() => _GstDetailsPageState();
}

class _GstDetailsPageState extends State<GstDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      //AppBar
        appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon:const Icon(Icons.arrow_back_ios,size: 25,color: Colors.black,),
        ),
        title:const Text("GST Details",
        style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
        elevation: 0,
      ),

      //body:
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

            //GSTIN Number
             const SizedBox(height: 25),  
            _buildtitle('GSTIN Number'), 
            const SizedBox(height: 10),
            _buildTextFormField('Enter a GSTIN Number'),
             const SizedBox(height: 10),

             //Business NAme
             _buildtitle('Business Name'),
             const SizedBox(height: 10),
            _buildTextFormField('Business Name'),
             const SizedBox(height: 05),
            const Text("As Per Your GST Certificate",
            style: TextStyle(fontSize: 12,color: Colors.grey),),

            //Business Address
            const SizedBox(height: 10),
            _buildtitle('Business Address'),
             const SizedBox(height: 10),
            _buildTextFormField('Business Address'),
            const SizedBox(height: 05),
            const Text("Enter the Same Address As Shown On Your GST\nRegistration Certificate",
            style: TextStyle(fontSize: 12,color: Colors.grey),),

            //PinCode
            const SizedBox(height: 10),
            _buildtitle('Pincode'), 
            const SizedBox(height: 10),
            _buildTextFormField('Enter Pincode'),
             

             //city
             const SizedBox(height: 10),
            _buildtitle('City'), 
            const SizedBox(height: 10),
            _buildTextFormField('Enter City'),
            

             //State
            const SizedBox(height: 10),
            _buildtitle('State'), 
            const SizedBox(height: 10),
            _buildTextFormField('Enter State'),
             const SizedBox(height: 10),


            const SizedBox(height: 30),

              Container(
              height: 50,
              width: double.infinity,
              decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFFFFA000),
              ),
                onPressed: (){},
                child: const Text("Submit",
                style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),
              ),
            ),

            ],
          ),
        ),
      ),
    ); 
  }
  
  _buildtitle(String title){
    return Text(title,
    style:const TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),);
  }

  _buildTextFormField(String hinttext,){
    return  Container(
                padding:const EdgeInsets.only(left: 15,top: 5,bottom: 5),
                height: 50,
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
                keyboardType: TextInputType.text,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                hintText: hinttext,
                border: InputBorder.none,
                ),
              ),
            );
  }
}