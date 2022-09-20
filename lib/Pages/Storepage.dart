
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class StorePage extends StatefulWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  TextEditingController? textController;
  bool? switchListTileValue;
  bool isSwitched = false;
   final TextEditingController _searchcontroller = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize:const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          title:const Text('Playwood Store',
          style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
          iconTheme:const IconThemeData(color: Color(0xFF020000)),
          automaticallyImplyLeading: true,
          actions: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30,
                  borderWidth: 1,
                  buttonSize: 60,
                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                  icon:const Icon(
                    Icons.support_agent_rounded,
                    color: Color(0xFF020000),
                    size: 30,
                  ),
                  onPressed: () {
                    print('IconButton pressed ...');
                  },
                ),
              
              ],
            ),
          ],
          elevation: 0,
        ),
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      //Drawer:
       drawer: Drawer(
        elevation: 10,
        child: Padding(
          padding:const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 05,top: 25),
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      clipBehavior: Clip.antiAlias,
                      decoration:const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset('assets/images/logo_kcs.jpg'),
                    ),


                    Padding(
                      padding:const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '[ Store Name ]',
                            style:   TextStyle(fontSize: 12,fontFamily: 'Poppins')),
                          const Text(
                            '9884857261',
                            style:   TextStyle(fontSize: 15,fontFamily: 'Poppins', fontWeight:FontWeight.w500)),
                          Container(
                            width: 200,
                            decoration:const BoxDecoration(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),


              SwitchListTile.adaptive(
                value: switchListTileValue ??= true,
                onChanged: (newValue) => setState(() => switchListTileValue = newValue),
                title:const Text(
                  'Recieve Orders',
                style: TextStyle(fontSize: 12,fontFamily: 'Poppins')),
                tileColor: FlutterFlowTheme.of(context).primaryBackground,
                activeColor: Colors.white,
                activeTrackColor: FlutterFlowTheme.of(context).secondaryColor,
                dense: false,
                controlAffinity: ListTileControlAffinity.trailing,
              ),


              ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [

                  Padding(
                    padding:const EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                    child: ListTile(
                      leading: Icon(
                        Icons.settings_outlined,
                        color: FlutterFlowTheme.of(context).lineColor),
                      title:const  Text(
                        'Settings',
                        style: TextStyle(fontSize: 12,fontFamily: 'Poppins')),
                        trailing:const Icon(
                        Icons.arrow_right,
                        color: Color(0xFF303030),
                        size: 20,
                      ),
                      tileColor: Colors.white,
                      dense: true,
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1),
                      ),
                    ),
                  ),


                  Padding(
                    padding:const EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
                    child: ListTile(
                    leading: Icon(
                        Icons.home,
                        color: FlutterFlowTheme.of(context).lineColor,
                        size: 20,
                      ),
                      title:const Text(
                        'Home',
                        style:TextStyle(fontSize: 12, fontFamily: 'Poppins'),
                      ),
                      trailing:const Icon(
                        Icons.arrow_right,
                        color: Color(0xFF303030),
                        size: 20,
                      ),
                      tileColor: Colors.white,
                      dense: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1),
                      ),
                    ),
                  ),


                  Padding(
                    padding:const EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
                    child: ListTile(
                      leading: Icon(
                        Icons.menu_outlined,
                        color: FlutterFlowTheme.of(context).lineColor,
                      ),
                      title:const Text(
                        'Item Menu',
                        style:  TextStyle(fontSize: 12, fontFamily: 'Poppins'),
                      ),
                      trailing:const Icon(
                        Icons.arrow_right,
                        color: Color(0xFF303030),
                        size: 20,
                      ),
                      tileColor: Colors.white,
                      dense: true,
                    ),
                  ),


                  Padding(
                    padding:const EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
                    child: ListTile(
                      leading: Icon(
                        Icons.list_alt,
                        color: FlutterFlowTheme.of(context).lineColor,
                      ),
                      title:const Text(
                        'My Orders',
                        style:  TextStyle(fontSize: 12,fontFamily: 'Poppins', ),
                         
                      ),
                      trailing:const Icon(
                        Icons.arrow_right,
                        color: Color(0xFF303030),
                        size: 20,
                      ),
                      tileColor: Colors.white,
                      dense: true,
                    ),
                  ),


                  Padding(
                    padding:const EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
                    child: ListTile(
                      leading: Icon(
                        Icons.favorite_border,
                        color: FlutterFlowTheme.of(context).lineColor,
                      ),
                      title:const Text(
                        'Most Purchased items',
                        style:   TextStyle(fontSize: 12,fontFamily: 'Poppins',),
                        
                      ),
                      trailing:const Icon(
                        Icons.arrow_right,
                        color: Color(0xFF303030),
                        size: 20,
                      ),
                      tileColor: Colors.white,
                      dense: true,
                    ),
                  ),


                  Padding(
                    padding:const EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
                    child: ListTile(
                      leading: Icon(
                        Icons.credit_card,
                        color: FlutterFlowTheme.of(context).lineColor,
                      ),
                      title:const Text(
                        'Payouts & Finances',
                         style:   TextStyle(fontSize: 12,fontFamily: 'Poppins')),
                         trailing:const  Icon(
                        Icons.arrow_right,
                        color: Color(0xFF303030),
                        size: 20,
                      ),
                      tileColor: Colors.white,
                      dense: true,
                    ),
                  ),


                  Padding(
                    padding:const EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
                    child: ListTile(
                      leading: Icon(
                        Icons.message_outlined,
                        color: FlutterFlowTheme.of(context).lineColor),
                      title:const Text(
                        'Requests',
                        style:   TextStyle(fontSize: 12,fontFamily: 'Poppins')),
                      trailing:const Icon(
                        Icons.arrow_right,
                        color: Color(0xFF303030),
                        size: 20,
                      ),
                      tileColor: Colors.white,
                      dense: true,
                    ),
                  ),


                  Padding(
                    padding:const EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
                    child: GestureDetector(
                      onTap: ()async{
                       // await signOut();
                        print("Signout");
                      },
                      child: ListTile(
                        leading: Icon(
                          Icons.logout,
                          color: FlutterFlowTheme.of(context).lineColor,
                        ),
                        title: const Text(
                          'Logout',
                          style:   TextStyle(fontSize: 12,fontFamily: 'Poppins')),
                        trailing:const Icon(
                          Icons.arrow_right,
                          color: Color(0xFF303030),
                          size: 20,
                        ),
                        tileColor: Colors.white,
                        dense: true,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:const EdgeInsets.only(right: 15,bottom: 25,top: 25),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                      height: 50,
                      width:150,
                      decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                      primary: const Color(0xFFFFA000),
                      ),
                        onPressed: (){
                    
                        },
                        child: const Text("Add New Item",
                        style: TextStyle(fontSize: 15,fontFamily: 'Poppins',fontWeight: FontWeight.bold,color: Colors.white),),
                      ),
                                ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                  child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                 
                  ),
                  child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: TextFormField( 
                          controller: _searchcontroller,
                          keyboardType: TextInputType.text,
                          cursorColor: Colors.black,
                          decoration:const InputDecoration(
                            hintText: "Order ID",
                            prefixIcon: Icon(Icons.search,color: Colors.grey,),
                            suffixIcon: Icon(Icons.menu,color: Colors.grey,),
                            border: InputBorder.none,
                          ),
                            validator: (value) {},
                        ),
                      ),
                  ),
                ),
                    ),
                 const SizedBox(height: 05),
                  GestureDetector(
                    onTap: (){
                      print("Print ");
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                      child: Container(
                        padding:const EdgeInsets.all(10),
                        width: double.infinity,
                        height: 120,
                        decoration:const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding:EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                                      child: Image.asset(
                                        'assets/images/c79oz_R.jpg',
                                        width: 70,
                                        height: 70,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 15),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:const [
                                    Padding(
                                      padding: EdgeInsets.only(top: 15,left: 5),
                                      child: Text(
                                       'UltraTech PPC Cement \n25 Kg',
                                        style: TextStyle(fontFamily: 'poppins',color: Colors.black,  fontWeight: FontWeight.w500,),
                                       
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                                      child: Text(
                                        ' ₹279.95',
                                        style: TextStyle(fontFamily: 'poppins',color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                                 
                               Padding(
                                 padding: const EdgeInsets.only(top: 13,left: 40),
                                 child: Icon(
                                   Icons.keyboard_arrow_right,
                                   color: Colors.black,
                                   size: 24,
                                 ),
                               ),
                              ],
                            ),
                          ],
                        ),
                        

                      ),
                    ),
                  ),
            
            
                
            
                 
                  // Container(
                  //   padding:const EdgeInsets.all(10),
                  //   width: 350,
                  //   height: 100,
                  //   decoration:const BoxDecoration(
                  //     color: Colors.white,
                  //     borderRadius: BorderRadius.only(
                  //       bottomLeft: Radius.circular(12),
                  //       bottomRight: Radius.circular(12),
                  //       topLeft: Radius.circular(0),
                  //       topRight: Radius.circular(0),
                  //     ),
                  //   ),
                  //   child: Column(
                  //     mainAxisSize: MainAxisSize.max,
                  //     children: [
                  //       Image.asset(
                  //         'assets/images/5QIOUZ.webp',
                  //         width: 350,
                  //         height: 1,
                  //         fit: BoxFit.cover,
                  //       ),
                  //       Padding(
                  //         padding: const EdgeInsets.only(top: 20,right: 10),
                  //         child: Align(
                  //           alignment: Alignment.centerRight,
                  //           child: Container(
                  //             height: 40,
                  //             child: ClipRRect(
                  //               borderRadius:const BorderRadius.only(
                  //                 bottomLeft: Radius.circular(12),
                  //                 bottomRight: Radius.circular(12),
                  //                 topLeft: Radius.circular(0),
                  //                 topRight: Radius.circular(0),
                  //               ),
                  //             child:LiteRollingSwitch(
                  //               value: true,
                  //               textOn: "Out stock",
                  //               textOff: "InStock",
                  //               iconOn:Icons.close,
                  //               iconOff: Icons.verified_rounded,
                  //               colorOn: Colors.red,
                  //               colorOff: Colors.blueGrey,
                  //               onTap:(){} , 
                  //               onDoubleTap: (){}, 
                  //               onSwipe: (){}, 
                  //               onChanged: (bool position){
                  //               print("The buttton is $position");
                  //               },
                  //               ),
                              
                                           
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
