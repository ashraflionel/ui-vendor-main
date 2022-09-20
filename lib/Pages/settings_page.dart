import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/bankdetails_page.dart';
import 'package:flutter_application_1/Pages/gstdetails_page.dart';
import 'package:flutter_application_1/Pages/home_page.dart';
import 'package:flutter_application_1/Pages/login_page.dart';


class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
          icon:const Icon(Icons.arrow_back_ios,size: 25,color: Colors.black,),
        ),
        title:const Text("Settings",
        style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15,right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25,top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                   Container(
                          width: 60,
                          height: 60,
                          clipBehavior: Clip.antiAlias,
                          decoration:const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/images/profile.png',
                          ),
                        ),
                        const SizedBox(width: 25),
                        Column(
                          children: [
                            const Text("Shri SMP Hardwares",
                            style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
                            const SizedBox(height: 10),
                             Row(
                               children:const [
                               Icon(Icons.edit,
                               color: Colors.black),
                               Text("Edit Profile",
                                                       style: TextStyle(fontSize: 15,color: Color(0xFFFFA000) ),),
                               ],
                             ),
                          ],
                        ),
                ],
              ),
            ),
            const SizedBox(height: 35),
            buildSettingsListTile( Icons.call, "Contact Us",null),
            const SizedBox(height: 20),
            buildSettingsListTile( Icons.message, "Terms Of use",null),
            const SizedBox(height: 20),
            buildSettingsListTile( Icons.lock, "Privacy Policy",null),
            const SizedBox(height: 20),
            buildSettingsListTile( Icons.account_balance_wallet_outlined, "Bank Details",BankDetailsPage()),
            const SizedBox(height: 20),
            buildSettingsListTile( Icons.document_scanner_outlined, "GST Details",GstDetailsPage()),
            const SizedBox(height: 20),
            buildSettingsListTile( Icons.logout, "Logout",null),

          ],
        ),
      ),
    );
  }


  buildSettingsListTile(IconData icon,String text, NavigationPagename){
      return Padding(
        padding: const EdgeInsets.only(left: 15),
        child: ListTile(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>NavigationPagename));
          },
        leading:  CircleAvatar(
        radius: 25,
        backgroundColor:const Color(0xFFFFA000),
        child: Icon(icon,color: Colors.white,)),
        title: Text(text),
    ),
      );
  }
}