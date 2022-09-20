import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_application_1/flutter_flow/flutter_flow_theme.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class StoreProfilePage extends StatefulWidget {
  const StoreProfilePage({Key? key}) : super(key: key);

  @override
  State<StoreProfilePage> createState() => _StoreProfilePageState();
}

class _StoreProfilePageState extends State<StoreProfilePage> {
  final _sundaycontroller = ValueNotifier<bool>(false);
  final TextEditingController _start1Controller = TextEditingController();
  final TextEditingController _End1Controller = TextEditingController();

  final _mondaycontroller = ValueNotifier<bool>(false);
  final TextEditingController _start2Controller = TextEditingController();
  final TextEditingController _End2Controller = TextEditingController();

  final _tuesdaycontroller = ValueNotifier<bool>(false);
  final TextEditingController _start3Controller = TextEditingController();
  final TextEditingController _End3Controller = TextEditingController();

  final _wednesdaycontroller = ValueNotifier<bool>(false);
  final TextEditingController _start4Controller = TextEditingController();
  final TextEditingController _End4Controller = TextEditingController();

  final _Thursdaycontroller = ValueNotifier<bool>(false);
  final TextEditingController _start5Controller = TextEditingController();
  final TextEditingController _End5Controller = TextEditingController();

  final _Fridaycontroller = ValueNotifier<bool>(false);
  final TextEditingController _start6Controller = TextEditingController();
  final TextEditingController _End6Controller = TextEditingController();

  final _Saturdaycontroller = ValueNotifier<bool>(false);
  final TextEditingController _start7Controller = TextEditingController();
  final TextEditingController _End7Controller = TextEditingController();



 
  
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon:const Icon(Icons.arrow_back_ios,size: 25,color: Colors.black,),
        ),
        title:const Text("Store Profile",
        style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black,fontFamily: 'poppins'),),
        elevation: 0,
        ),

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  child: Container(
                    height: 350,
                    width: double.infinity,
                    decoration:const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                     boxShadow: [
                     BoxShadow(
                color: Colors.black54,
                blurRadius: 2.0,
                offset: Offset(0.0, 2)
            )
                     ],
                    ),
                    child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        SizedBox(
                          height: 100,
                          width: 500,
                          child: Image.asset('assets/images/logo_kcs.jpg',
                          fit: BoxFit.contain,),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15,right: 15,top: 10),
                          child: Text("Store Name: PlywoodStore",
                          style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.black),),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15,right: 15,top: 05),
                          child: Text("ID: 7863",
                          style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.black),),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15,right: 15,top: 05),
                          child: Text("Allotted Location: Shollinganallur",
                          style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.black),),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15,right: 15,top: 05,bottom: 25),
                          child: Text("Store Type: Hardware Store",
                          style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.black),),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15,right: 15,top: 05,bottom: 15),
                          child: Text("Approved Product Categories",
                          style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
                        ),
                        Row(
                          children: [
                            Padding(
                     padding:const EdgeInsetsDirectional.fromSTEB(10, 10, 0, 5),
                     child: Container(
                       width: 60,
                       height: 25,
                       decoration: BoxDecoration(
                       color: Color(0x71FFA000),
                       borderRadius: BorderRadius.circular(12),
                         ),
                         child:const Padding(
                         padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                         child: Text('Bricks',
                         textAlign: TextAlign.center,
                         style: TextStyle(fontSize: 12,fontFamily: 'Poppins'),
                          ),
                         ),
                        ),
                      ),
                     Padding(
                     padding:const EdgeInsetsDirectional.fromSTEB(10, 10, 0, 5),
                     child: Container(
                       width: 70,
                       height: 25,
                       decoration: BoxDecoration(
                       color: Color(0x71FFA000),
                       borderRadius: BorderRadius.circular(12),
                         ),
                         child:const Padding(
                         padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                         child: Text('Paint',
                         textAlign: TextAlign.center,
                         style: TextStyle(fontSize: 12,fontFamily: 'Poppins'),
                          ),
                         ),
                        ),
                      ),
                       Padding(
                     padding:const EdgeInsetsDirectional.fromSTEB(10, 10, 0, 5),
                     child: Container(
                       width: 70,
                       height: 25,
                       decoration: BoxDecoration(
                       color: Color(0x71FFA000),
                       borderRadius: BorderRadius.circular(12),
                         ),
                         child:const Padding(
                         padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                         child: Text('Wires',
                         textAlign: TextAlign.center,
                         style: TextStyle(fontSize: 12,fontFamily: 'Poppins'),
                          ),
                         ),
                        ),
                      ),
                       Padding(
                     padding:const EdgeInsetsDirectional.fromSTEB(10, 10, 0, 5),
                     child: Container(
                       width: 70,
                       height: 25,
                       decoration: BoxDecoration(
                       color: Color(0x71FFA000),
                       borderRadius: BorderRadius.circular(12),
                         ),
                         child:const Padding(
                         padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                         child: Text('Cement',
                         textAlign: TextAlign.center,
                         style: TextStyle(fontSize: 12,fontFamily: 'Poppins'),
                          ),
                         ),
                        ),
                      ),
                       ],
                      ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Padding(
                padding: const EdgeInsets.only(left: 20,top: 20,right: 15),
                child: Container(
                height: 50,
                width: double.infinity,
                decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: ElevatedButton(
              style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
              primary:  Colors.white,
                 ),
                onPressed: (){ },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:const[
                    Icon(Icons.cloud_upload_outlined,color: Color(0xFFFFA000)),
                    SizedBox(width: 15),
                    Text("Upload Logo",
                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
                  ],
                ),
              ),
            ),
          ),
         const SizedBox(height: 25),
          //Updated Logo
          _buildlogo('assets/images/logo_kcs.jpg'),
          const SizedBox(height: 05),
           Padding(
                padding: const EdgeInsets.only(left: 20,top: 20,right: 15),
                child: Container(
                height: 50,
                width: double.infinity,
                decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: ElevatedButton(
              style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
              primary:  Colors.white,
                 ),
                onPressed: (){ },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:const[
                    Icon(Icons.cloud_upload_outlined,color: Color(0xFFFFA000)),
                    SizedBox(width: 15),
                    Text("Upload Banner",
                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          _buildbanner('assets/images/material.jpg'),
         const Padding(
            padding:  EdgeInsets.only(left: 25,top: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
              'Working Hours',
               style: TextStyle(fontSize: 15,fontFamily: 'Poppins',fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:const [
              Padding(
                padding:  EdgeInsets.only(left: 100),
                child: Text('Start',
                style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
              ),
            
              Padding(
                padding: EdgeInsets.only(left: 25),
                child: Text('End',
                style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
              ),
            ],
          ),

          //Sunday Controller:
          Padding(
            padding: const EdgeInsets.only(left: 20,top: 10,bottom: 5),
            child: Row(
              children: [
                Column(
                  children: [
                   const Text("Sunday",
                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
                   const SizedBox(height: 05),
                
                   AdvancedSwitch(
                    width: 80.0,
                    height: 30.0,
                     controller: _sundaycontroller,
                     activeColor: Colors.grey,
                      inactiveColor: Color.fromARGB(255, 74, 213, 174),
                       activeChild:const Text('Close'),
                        inactiveChild:const Text('open'),
                        borderRadius:const BorderRadius.all(const Radius.circular(15)),
                         enabled: true,
                         disabledOpacity: 0.5
                         ),
                  ],
                ),
               const SizedBox(width: 25),
                      Container(
                       width: 100,
                      height: 40,
                      decoration:const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          blurRadius: 1,
                        ),
                      ],
                       ),
                     child: Padding(
                    padding:const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                     child: TextFormField(
                    controller: _start1Controller,
                     onChanged: (_) => EasyDebounce.debounce(
                       '_start1Controller',
                    Duration(milliseconds: 2000),
                            () => setState(() {}),
                        ),
                       autofocus: true,
                       obscureText: false,
                       decoration:const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                        color: Color(0x00000000),
                           width: 1,
                            ),
                       borderRadius:  BorderRadius.only(
                       topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                         ),
                             ),
                         focusedBorder: UnderlineInputBorder(
                         borderSide: BorderSide(
                         color: Color(0x00000000),
                          width: 1,
                            ),
                          borderRadius:  BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                           topRight: Radius.circular(4.0),
                           ),
                              ),
                              errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                              color: Color(0x00000000),
                               width: 1,
                                  ),
                           borderRadius:  BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                             topRight: Radius.circular(4.0),
                               ),
                            ),
                          focusedErrorBorder: UnderlineInputBorder(
                           borderSide: BorderSide(
                           color: Color(0x00000000),
                             width: 1,
                             ),
                           borderRadius:  BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                             topRight: Radius.circular(4.0),
                            ),
                                 ),
                                   ),
                             style: FlutterFlowTheme.of(context).bodyText1,
                             keyboardType: TextInputType.datetime,
                              ),
                                 ),
                                   ),
                                  const SizedBox(width: 15),
                                   //End Date 1
                        Container(
                       width: 100,
                      height: 40,
                      decoration:const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          blurRadius: 1,
                        ),
                      ],
                       ),
                     child: Padding(
                    padding:const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                     child: TextFormField(
                    controller: _End1Controller,
                     onChanged: (_) => EasyDebounce.debounce(
                       '_End1Controller',
                    Duration(milliseconds: 2000),
                            () => setState(() {}),
                        ),
                       autofocus: true,
                       obscureText: false,
                       decoration:const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                        color: Color(0x00000000),
                           width: 1,
                            ),
                       borderRadius:  BorderRadius.only(
                       topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                         ),
                             ),
                         focusedBorder: UnderlineInputBorder(
                         borderSide: BorderSide(
                         color: Color(0x00000000),
                          width: 1,
                            ),
                          borderRadius:  BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                           topRight: Radius.circular(4.0),
                           ),
                              ),
                              errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                              color: Color(0x00000000),
                               width: 1,
                                  ),
                           borderRadius:  BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                             topRight: Radius.circular(4.0),
                               ),
                            ),
                          focusedErrorBorder: UnderlineInputBorder(
                           borderSide: BorderSide(
                           color: Color(0x00000000),
                             width: 1,
                             ),
                           borderRadius:  BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                             topRight: Radius.circular(4.0),
                            ),
                                 ),
                                   ),
                             style: FlutterFlowTheme.of(context).bodyText1,
                             keyboardType: TextInputType.datetime,
                              ),
                                 ),
                                   ),
                           ],
            ),
          ),

          //Monday Controller:
          Padding(
            padding: const EdgeInsets.only(left: 20,top: 10,bottom: 5),
            child: Row(
              children: [
                Column(
                  children: [
                   const Text("Monday",
                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
                   const SizedBox(height: 05),
                   AdvancedSwitch(
                    width: 80.0,
                    height: 30.0,
                     controller: _mondaycontroller,
                     activeColor: Colors.grey,
                      inactiveColor: Color.fromARGB(255, 74, 213, 174),
                       activeChild:const Text('Close'),
                        inactiveChild:const Text('open'),
                        borderRadius:const BorderRadius.all(const Radius.circular(15)),
                         enabled: true,
                         disabledOpacity: 0.5
                         ),
                  ],
                ),
               const SizedBox(width: 25),
                      Container(
                       width: 100,
                      height: 40,
                      decoration:const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          blurRadius: 1,
                        ),
                      ],
                       ),
                     child: Padding(
                    padding:const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                     child: TextFormField(
                    controller: _start2Controller,
                     onChanged: (_) => EasyDebounce.debounce(
                       '_start2Controller',
                    Duration(milliseconds: 2000),
                            () => setState(() {}),
                        ),
                       autofocus: true,
                       obscureText: false,
                       decoration:const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                        color: Color(0x00000000),
                           width: 1,
                            ),
                       borderRadius:  BorderRadius.only(
                       topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                         ),
                             ),
                         focusedBorder: UnderlineInputBorder(
                         borderSide: BorderSide(
                         color: Color(0x00000000),
                          width: 1,
                            ),
                          borderRadius:  BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                           topRight: Radius.circular(4.0),
                           ),
                              ),
                              errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                              color: Color(0x00000000),
                               width: 1,
                                  ),
                           borderRadius:  BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                             topRight: Radius.circular(4.0),
                               ),
                            ),
                          focusedErrorBorder: UnderlineInputBorder(
                           borderSide: BorderSide(
                           color: Color(0x00000000),
                             width: 1,
                             ),
                           borderRadius:  BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                             topRight: Radius.circular(4.0),
                            ),
                                 ),
                                   ),
                             style: FlutterFlowTheme.of(context).bodyText1,
                             keyboardType: TextInputType.datetime,
                              ),
                                 ),
                                   ),
                                  const SizedBox(width: 15),
                                   //End Date 1
                        Container(
                       width: 100,
                      height: 40,
                      decoration:const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          blurRadius: 1,
                        ),
                      ],
                       ),
                     child: Padding(
                    padding:const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                     child: TextFormField(
                    controller: _End2Controller,
                     onChanged: (_) => EasyDebounce.debounce(
                       '_End2Controller',
                    Duration(milliseconds: 2000),
                            () => setState(() {}),
                        ),
                       autofocus: true,
                       obscureText: false,
                       decoration:const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                        color: Color(0x00000000),
                           width: 1,
                            ),
                       borderRadius:  BorderRadius.only(
                       topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                         ),
                             ),
                         focusedBorder: UnderlineInputBorder(
                         borderSide: BorderSide(
                         color: Color(0x00000000),
                          width: 1,
                            ),
                          borderRadius:  BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                           topRight: Radius.circular(4.0),
                           ),
                              ),
                              errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                              color: Color(0x00000000),
                               width: 1,
                                  ),
                           borderRadius:  BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                             topRight: Radius.circular(4.0),
                               ),
                            ),
                          focusedErrorBorder: UnderlineInputBorder(
                           borderSide: BorderSide(
                           color: Color(0x00000000),
                             width: 1,
                             ),
                           borderRadius:  BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                             topRight: Radius.circular(4.0),
                            ),
                                 ),
                                   ),
                             style: FlutterFlowTheme.of(context).bodyText1,
                             keyboardType: TextInputType.datetime,
                              ),
                                 ),
                                   ),
                           ],
            ),
          ),

          //Tuesday Controller

          Padding(
            padding: const EdgeInsets.only(left: 20,top: 10,bottom: 5),
            child: Row(
              children: [
                Column(
                  children: [
                   const Text("Tuesday",
                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
                   const SizedBox(height: 05),
                
                   AdvancedSwitch(
                    width: 80.0,
                    height: 30.0,
                     controller: _tuesdaycontroller,
                     activeColor: Colors.grey,
                      inactiveColor: Color.fromARGB(255, 74, 213, 174),
                       activeChild:const Text('Close'),
                        inactiveChild:const Text('open'),
                        borderRadius:const BorderRadius.all(const Radius.circular(15)),
                         enabled: true,
                         disabledOpacity: 0.5
                         ),
                  ],
                ),
               const SizedBox(width: 25),
                      Container(
                       width: 100,
                      height: 40,
                      decoration:const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          blurRadius: 1,
                        ),
                      ],
                       ),
                     child: Padding(
                    padding:const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                     child: TextFormField(
                    controller: _start3Controller,
                     onChanged: (_) => EasyDebounce.debounce(
                       '_start3Controller',
                    Duration(milliseconds: 2000),
                            () => setState(() {}),
                        ),
                       autofocus: true,
                       obscureText: false,
                       decoration:const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                        color: Color(0x00000000),
                           width: 1,
                            ),
                       borderRadius:  BorderRadius.only(
                       topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                         ),
                             ),
                         focusedBorder: UnderlineInputBorder(
                         borderSide: BorderSide(
                         color: Color(0x00000000),
                          width: 1,
                            ),
                          borderRadius:  BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                           topRight: Radius.circular(4.0),
                           ),
                              ),
                              errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                              color: Color(0x00000000),
                               width: 1,
                                  ),
                           borderRadius:  BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                             topRight: Radius.circular(4.0),
                               ),
                            ),
                          focusedErrorBorder: UnderlineInputBorder(
                           borderSide: BorderSide(
                           color: Color(0x00000000),
                             width: 1,
                             ),
                           borderRadius:  BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                             topRight: Radius.circular(4.0),
                            ),
                                 ),
                                   ),
                             style: FlutterFlowTheme.of(context).bodyText1,
                             keyboardType: TextInputType.datetime,
                              ),
                                 ),
                                   ),
                                  const SizedBox(width: 15),
                                   //End Date 1
                        Container(
                       width: 100,
                      height: 40,
                      decoration:const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          blurRadius: 1,
                        ),
                      ],
                       ),
                     child: Padding(
                    padding:const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                     child: TextFormField(
                    controller: _End3Controller,
                     onChanged: (_) => EasyDebounce.debounce(
                       '_End3Controller',
                    Duration(milliseconds: 2000),
                            () => setState(() {}),
                        ),
                       autofocus: true,
                       obscureText: false,
                       decoration:const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                        color: Color(0x00000000),
                           width: 1,
                            ),
                       borderRadius:  BorderRadius.only(
                       topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                         ),
                             ),
                         focusedBorder: UnderlineInputBorder(
                         borderSide: BorderSide(
                         color: Color(0x00000000),
                          width: 1,
                            ),
                          borderRadius:  BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                           topRight: Radius.circular(4.0),
                           ),
                              ),
                              errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                              color: Color(0x00000000),
                               width: 1,
                                  ),
                           borderRadius:  BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                             topRight: Radius.circular(4.0),
                               ),
                            ),
                          focusedErrorBorder: UnderlineInputBorder(
                           borderSide: BorderSide(
                           color: Color(0x00000000),
                             width: 1,
                             ),
                           borderRadius:  BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                             topRight: Radius.circular(4.0),
                            ),
                                 ),
                                   ),
                             style: FlutterFlowTheme.of(context).bodyText1,
                             keyboardType: TextInputType.datetime,
                              ),
                                 ),
                                   ),
                           ],
            ),
          ),
          
          //Wednesday Controller
          Padding(
            padding: const EdgeInsets.only(left: 20,top: 10,bottom: 5),
            child: Row(
              children: [
                Column(
                  children: [
                   const Text("Wednesday",
                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
                   const SizedBox(height: 05),
                
                   AdvancedSwitch(
                    width: 80.0,
                    height: 30.0,
                     controller: _wednesdaycontroller,
                     activeColor: Colors.grey,
                      inactiveColor:const Color.fromARGB(255, 74, 213, 174),
                       activeChild:const Text('Close'),
                        inactiveChild:const Text('open'),
                        borderRadius:const BorderRadius.all(const Radius.circular(15)),
                         enabled: true,
                         disabledOpacity: 0.5
                         ),
                  ],
                ),
               const SizedBox(width: 25),
                      Container(
                       width: 100,
                      height: 40,
                      decoration:const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          blurRadius: 1,
                        ),
                      ],
                       ),
                     child: Padding(
                    padding:const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                     child: TextFormField(
                    controller: _start4Controller,
                     onChanged: (_) => EasyDebounce.debounce(
                       '_start4Controller',
                    Duration(milliseconds: 2000),
                            () => setState(() {}),
                        ),
                       autofocus: true,
                       obscureText: false,
                       decoration:const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                        color: Color(0x00000000),
                           width: 1,
                            ),
                       borderRadius:  BorderRadius.only(
                       topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                         ),
                             ),
                         focusedBorder: UnderlineInputBorder(
                         borderSide: BorderSide(
                         color: Color(0x00000000),
                          width: 1,
                            ),
                          borderRadius:  BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                           topRight: Radius.circular(4.0),
                           ),
                              ),
                              errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                              color: Color(0x00000000),
                               width: 1,
                                  ),
                           borderRadius:  BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                             topRight: Radius.circular(4.0),
                               ),
                            ),
                          focusedErrorBorder: UnderlineInputBorder(
                           borderSide: BorderSide(
                           color: Color(0x00000000),
                             width: 1,
                             ),
                           borderRadius:  BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                             topRight: Radius.circular(4.0),
                            ),
                                 ),
                                   ),
                             style: FlutterFlowTheme.of(context).bodyText1,
                             keyboardType: TextInputType.datetime,
                              ),
                                 ),
                                   ),
                                  const SizedBox(width: 15),
                                   //End Date 1
                        Container(
                       width: 100,
                      height: 40,
                      decoration:const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          blurRadius: 1,
                        ),
                      ],
                       ),
                     child: Padding(
                    padding:const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                     child: TextFormField(
                    controller: _End4Controller,
                     onChanged: (_) => EasyDebounce.debounce(
                       '_End4Controller',
                    Duration(milliseconds: 2000),
                            () => setState(() {}),
                        ),
                       autofocus: true,
                       obscureText: false,
                       decoration:const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                        color: Color(0x00000000),
                           width: 1,
                            ),
                       borderRadius:  BorderRadius.only(
                       topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                         ),
                             ),
                         focusedBorder: UnderlineInputBorder(
                         borderSide: BorderSide(
                         color: Color(0x00000000),
                          width: 1,
                            ),
                          borderRadius:  BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                           topRight: Radius.circular(4.0),
                           ),
                              ),
                              errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                              color: Color(0x00000000),
                               width: 1,
                                  ),
                           borderRadius:  BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                             topRight: Radius.circular(4.0),
                               ),
                            ),
                          focusedErrorBorder: UnderlineInputBorder(
                           borderSide: BorderSide(
                           color: Color(0x00000000),
                             width: 1,
                             ),
                           borderRadius:  BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                             topRight: Radius.circular(4.0),
                            ),
                                 ),
                                   ),
                             style: FlutterFlowTheme.of(context).bodyText1,
                             keyboardType: TextInputType.datetime,
                              ),
                                 ),
                                   ),
                           ],
            ),
          ),

          //  Thursday Controller
          Padding(
            padding: const EdgeInsets.only(left: 20,top: 10,bottom: 5),
            child: Row(
              children: [
                Column(
                  children: [
                   const Text("Thursday",
                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
                   const SizedBox(height: 05),
                
                   AdvancedSwitch(
                    width: 80.0,
                    height: 30.0,
                     controller: _Thursdaycontroller,
                     activeColor: Colors.grey,
                      inactiveColor:const Color.fromARGB(255, 74, 213, 174),
                       activeChild:const Text('Close'),
                        inactiveChild:const Text('open'),
                        borderRadius:const BorderRadius.all(const Radius.circular(15)),
                         enabled: true,
                         disabledOpacity: 0.5
                         ),
                  ],
                ),
               const SizedBox(width: 25),
                      Container(
                       width: 100,
                      height: 40,
                      decoration:const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          blurRadius: 1,
                        ),
                      ],
                       ),
                     child: Padding(
                    padding:const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                     child: TextFormField(
                    controller: _start5Controller,
                     onChanged: (_) => EasyDebounce.debounce(
                       '_start5Controller',
                    Duration(milliseconds: 2000),
                            () => setState(() {}),
                        ),
                       autofocus: true,
                       obscureText: false,
                       decoration:const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                        color: Color(0x00000000),
                           width: 1,
                            ),
                       borderRadius:  BorderRadius.only(
                       topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                         ),
                             ),
                         focusedBorder: UnderlineInputBorder(
                         borderSide: BorderSide(
                         color: Color(0x00000000),
                          width: 1,
                            ),
                          borderRadius:  BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                           topRight: Radius.circular(4.0),
                           ),
                              ),
                              errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                              color: Color(0x00000000),
                               width: 1,
                                  ),
                           borderRadius:  BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                             topRight: Radius.circular(4.0),
                               ),
                            ),
                          focusedErrorBorder: UnderlineInputBorder(
                           borderSide: BorderSide(
                           color: Color(0x00000000),
                             width: 1,
                             ),
                           borderRadius:  BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                             topRight: Radius.circular(4.0),
                            ),
                                 ),
                                   ),
                             style: FlutterFlowTheme.of(context).bodyText1,
                             keyboardType: TextInputType.datetime,
                              ),
                                 ),
                                   ),
                                  const SizedBox(width: 15),
                                   //End Date 1
                        Container(
                       width: 100,
                      height: 40,
                      decoration:const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          blurRadius: 1,
                        ),
                      ],
                       ),
                     child: Padding(
                    padding:const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                     child: TextFormField(
                    controller: _End5Controller,
                     onChanged: (_) => EasyDebounce.debounce(
                       '_End5Controller',
                    Duration(milliseconds: 2000),
                            () => setState(() {}),
                        ),
                       autofocus: true,
                       obscureText: false,
                       decoration:const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                        color: Color(0x00000000),
                           width: 1,
                            ),
                       borderRadius:  BorderRadius.only(
                       topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                         ),
                             ),
                         focusedBorder: UnderlineInputBorder(
                         borderSide: BorderSide(
                         color: Color(0x00000000),
                          width: 1,
                            ),
                          borderRadius:  BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                           topRight: Radius.circular(4.0),
                           ),
                              ),
                              errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                              color: Color(0x00000000),
                               width: 1,
                                  ),
                           borderRadius:  BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                             topRight: Radius.circular(4.0),
                               ),
                            ),
                          focusedErrorBorder: UnderlineInputBorder(
                           borderSide: BorderSide(
                           color: Color(0x00000000),
                             width: 1,
                             ),
                           borderRadius:  BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                             topRight: Radius.circular(4.0),
                            ),
                                 ),
                                   ),
                             style: FlutterFlowTheme.of(context).bodyText1,
                             keyboardType: TextInputType.datetime,
                              ),
                                 ),
                                   ),
                           ],
            ),
          ),


          //Friday Controller
          Padding(
            padding: const EdgeInsets.only(left: 20,top: 10,bottom: 5),
            child: Row(
              children: [
                Column(
                  children: [
                   const Text("Friday",
                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
                   const SizedBox(height: 05),
                
                   AdvancedSwitch(
                    width: 80.0,
                    height: 30.0,
                     controller: _Fridaycontroller,
                     activeColor: Colors.grey,
                      inactiveColor:const Color.fromARGB(255, 74, 213, 174),
                       activeChild:const Text('Close'),
                        inactiveChild:const Text('open'),
                        borderRadius:const BorderRadius.all(const Radius.circular(15)),
                         enabled: true,
                         disabledOpacity: 0.5
                         ),
                  ],
                ),
               const SizedBox(width: 25),
                      Container(
                       width: 100,
                      height: 40,
                      decoration:const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          blurRadius: 1,
                        ),
                      ],
                       ),
                     child: Padding(
                    padding:const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                     child: TextFormField(
                    controller: _start6Controller,
                     onChanged: (_) => EasyDebounce.debounce(
                       '_start6Controller',
                    Duration(milliseconds: 2000),
                            () => setState(() {}),
                        ),
                       autofocus: true,
                       obscureText: false,
                       decoration:const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                        color: Color(0x00000000),
                           width: 1,
                            ),
                       borderRadius:  BorderRadius.only(
                       topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                         ),
                             ),
                         focusedBorder: UnderlineInputBorder(
                         borderSide: BorderSide(
                         color: Color(0x00000000),
                          width: 1,
                            ),
                          borderRadius:  BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                           topRight: Radius.circular(4.0),
                           ),
                              ),
                              errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                              color: Color(0x00000000),
                               width: 1,
                                  ),
                           borderRadius:  BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                             topRight: Radius.circular(4.0),
                               ),
                            ),
                          focusedErrorBorder: UnderlineInputBorder(
                           borderSide: BorderSide(
                           color: Color(0x00000000),
                             width: 1,
                             ),
                           borderRadius:  BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                             topRight: Radius.circular(4.0),
                            ),
                                 ),
                                   ),
                             style: FlutterFlowTheme.of(context).bodyText1,
                             keyboardType: TextInputType.datetime,
                              ),
                                 ),
                                   ),
                                  const SizedBox(width: 15),
                                   //End Date 1
                        Container(
                       width: 100,
                      height: 40,
                      decoration:const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          blurRadius: 1,
                        ),
                      ],
                       ),
                     child: Padding(
                    padding:const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                     child: TextFormField(
                    controller: _End6Controller,
                     onChanged: (_) => EasyDebounce.debounce(
                       '_End6Controller',
                    Duration(milliseconds: 2000),
                            () => setState(() {}),
                        ),
                       autofocus: true,
                       obscureText: false,
                       decoration:const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                        color: Color(0x00000000),
                           width: 1,
                            ),
                       borderRadius:  BorderRadius.only(
                       topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                         ),
                             ),
                         focusedBorder: UnderlineInputBorder(
                         borderSide: BorderSide(
                         color: Color(0x00000000),
                          width: 1,
                            ),
                          borderRadius:  BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                           topRight: Radius.circular(4.0),
                           ),
                              ),
                              errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                              color: Color(0x00000000),
                               width: 1,
                                  ),
                           borderRadius:  BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                             topRight: Radius.circular(4.0),
                               ),
                            ),
                          focusedErrorBorder: UnderlineInputBorder(
                           borderSide: BorderSide(
                           color: Color(0x00000000),
                             width: 1,
                             ),
                           borderRadius:  BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                             topRight: Radius.circular(4.0),
                            ),
                                 ),
                                   ),
                             style: FlutterFlowTheme.of(context).bodyText1,
                             keyboardType: TextInputType.datetime,
                              ),
                                 ),
                                   ),
                           ],
            ),
          ),

          //Saturday Controller

            
          Padding(
            padding: const EdgeInsets.only(left: 20,top: 10,bottom: 5),
            child: Row(
              children: [
                Column(
                  children: [
                   const Text("Saturday",
                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
                   const SizedBox(height: 05),
                
                   AdvancedSwitch(
                    width: 80.0,
                    height: 30.0,
                     controller: _Saturdaycontroller,
                     activeColor: Colors.grey,
                      inactiveColor:const Color.fromARGB(255, 74, 213, 174),
                       activeChild:const Text('Close'),
                        inactiveChild:const Text('open'),
                        borderRadius:const BorderRadius.all(const Radius.circular(15)),
                         enabled: true,
                         disabledOpacity: 0.5
                         ),
                  ],
                ),
               const SizedBox(width: 25),
                      Container(
                       width: 100,
                      height: 40,
                      decoration:const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          blurRadius: 1,
                        ),
                      ],
                       ),
                     child: Padding(
                    padding:const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                     child: TextFormField(
                    controller: _start7Controller,
                     onChanged: (_) => EasyDebounce.debounce(
                       '_start7Controller',
                    Duration(milliseconds: 2000),
                            () => setState(() {}),
                        ),
                       autofocus: true,
                       obscureText: false,
                       decoration:const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                        color: Color(0x00000000),
                           width: 1,
                            ),
                       borderRadius:  BorderRadius.only(
                       topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                         ),
                             ),
                         focusedBorder: UnderlineInputBorder(
                         borderSide: BorderSide(
                         color: Color(0x00000000),
                          width: 1,
                            ),
                          borderRadius:  BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                           topRight: Radius.circular(4.0),
                           ),
                              ),
                              errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                              color: Color(0x00000000),
                               width: 1,
                                  ),
                           borderRadius:  BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                             topRight: Radius.circular(4.0),
                               ),
                            ),
                          focusedErrorBorder: UnderlineInputBorder(
                           borderSide: BorderSide(
                           color: Color(0x00000000),
                             width: 1,
                             ),
                           borderRadius:  BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                             topRight: Radius.circular(4.0),
                            ),
                                 ),
                                   ),
                             style: FlutterFlowTheme.of(context).bodyText1,
                             keyboardType: TextInputType.datetime,
                              ),
                                 ),
                                   ),
                                  const SizedBox(width: 15),
                                   //End Date 1
                        Container(
                       width: 100,
                      height: 40,
                      decoration:const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          blurRadius: 1,
                        ),
                      ],
                       ),
                     child: Padding(
                    padding:const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                     child: TextFormField(
                    controller: _End7Controller,
                     onChanged: (_) => EasyDebounce.debounce(
                       '_End7Controller',
                    Duration(milliseconds: 2000),
                            () => setState(() {}),
                        ),
                       autofocus: true,
                       obscureText: false,
                       decoration:const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                        color: Color(0x00000000),
                           width: 1,
                            ),
                       borderRadius:  BorderRadius.only(
                       topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                         ),
                             ),
                         focusedBorder: UnderlineInputBorder(
                         borderSide: BorderSide(
                         color: Color(0x00000000),
                          width: 1,
                            ),
                          borderRadius:  BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                           topRight: Radius.circular(4.0),
                           ),
                              ),
                              errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                              color: Color(0x00000000),
                               width: 1,
                                  ),
                           borderRadius:  BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                             topRight: Radius.circular(4.0),
                               ),
                            ),
                          focusedErrorBorder: UnderlineInputBorder(
                           borderSide: BorderSide(
                           color: Color(0x00000000),
                             width: 1,
                             ),
                           borderRadius:  BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                             topRight: Radius.circular(4.0),
                            ),
                                 ),
                                   ),
                             style: FlutterFlowTheme.of(context).bodyText1,
                             keyboardType: TextInputType.datetime,
                              ),
                                 ),
                                   ),
                           ],
            ),
          ),

           Padding(
             padding: const EdgeInsets.only(left: 15,right: 15,top: 20,bottom: 10),
             child: Container(
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
                  onPressed: ()async{},
                  child: const Text("Login",
                  style: TextStyle(fontSize: 15,fontFamily: 'Poppins',fontWeight: FontWeight.bold,color: Colors.white),),
                ),
              ),
           ),

              ]
            )
          ),
        ),
    );
  }
    _buildlogo(image){
              return Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25,right: 15),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration:const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                   ),
                   child: Image(image: AssetImage(image),
                   fit: BoxFit.cover,),
                  ),
                ),
              );
            }

            _buildbanner(image){
              return Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25,right: 15),
                  child: Container(
                    height: 70,
                    width: 150,
                    decoration:const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                   ),
                   child: Image(image: AssetImage(image),
                   fit: BoxFit.cover,),
                  ),
                ),
              );
            }
}