import 'package:flutter/material.dart';

class BankDetailsPage extends StatefulWidget {
  const BankDetailsPage({Key? key}) : super(key: key);

  @override
  State<BankDetailsPage> createState() => _BankDetailsPageState();
}

class _BankDetailsPageState extends State<BankDetailsPage> {
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
        title:const Text("Bank Details",
        style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
        elevation: 0,
      ),

      //Body
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

            //Holder's name
             const SizedBox(height: 25),  
            _buildbanktitle('Account Holders Name'), 
            const SizedBox(height: 10),
            _buildbankTextFormField('Enter a Name'),
             const SizedBox(height: 10),

             //Account Number
             _buildbanktitle('Account Number'),
             const SizedBox(height: 10),
            _buildbankTextFormField('Enter a Account No'),
             

            //Bank's Name
            const SizedBox(height: 10),
            _buildbanktitle('Bank Name'),
             const SizedBox(height: 10),
            _buildbankTextFormField('Enter Bank Name'),


            //Bank Address
            const SizedBox(height: 10),
            _buildbanktitle('Bank Address'), 
            const SizedBox(height: 10),
            _buildbankTextFormField('Enter a Bank Address'),
             

             //SWIFT Code
             const SizedBox(height: 10),
            _buildbanktitle('SWIFT Code'), 
            const SizedBox(height: 10),
            _buildbankTextFormField('Enter a SWIFT Code'),
            

             //IFSC Code
            const SizedBox(height: 10),
            _buildbanktitle('IFSC Code'), 
            const SizedBox(height: 10),
            _buildbankTextFormField('Enter a IFSC Code'),
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
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
              ),
            ),
            ],
          ),
        ),
      ),
    ); 
  }
  _buildbanktitle(String title){
    return Text(title,
    style:const TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),);
  }

  _buildbankTextFormField(String hinttext,){
    return Container(
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