import 'package:intl/intl.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class RequestListPage extends StatefulWidget {
  const RequestListPage({Key? key}) : super(key: key);

  @override
  _RequestListPageState createState() =>_RequestListPageState();
}

class _RequestListPageState extends State<RequestListPage> {
  final TextEditingController _orderno = TextEditingController();
  DateTimeRange dateRange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now(),
  );
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;
    return Scaffold(
      key: scaffoldKey,
      //AppBar:
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        iconTheme:const IconThemeData(color: Color(0xFF020000)),
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child:const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 24,
          ),
        ),
        title: Text(
          'Requests',
          style: FlutterFlowTheme.of(context).bodyText1,
        ),
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      
      //body:
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                  child: Container(
              height: 60,
              width: double.infinity,
              decoration:const BoxDecoration(
                  color: Colors.white,
                  borderRadius:  BorderRadius.all(Radius.circular(10)),
              ),
              child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: TextFormField( 
                      controller: _orderno,
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.black,
                      decoration:const InputDecoration(
                        hintText: "Order ID",
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                      ),
                        validator: (value) {},
        
                    ),
                  ),
              ),
            ),
                ),
                 Padding(
                   padding: const EdgeInsets.only(left: 20,top: 10),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:const [
                      Text('From',
                      style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,),),
                      SizedBox(width: 165),
                       Text('To',
                      style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,),),
                    ],
                   ),
                 ),

                //Choose Date and Time:
                Padding(
                  padding:const EdgeInsetsDirectional.fromSTEB(16, 10, 16, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:const EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                        child: GestureDetector(
                          onTap: (){
                            pickDateRange();
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.44,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: const Color(0xFFCFD4DB),
                                width: 1,
                              ),
                            ),
                            child: Padding(
                              padding:const EdgeInsetsDirectional.fromSTEB(12, 5, 12, 5),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                 Text(DateFormat('dd/MM/yyyy').format(start),
                                    //'${start.year}/${start.month}/${start.day}',
                                    style:const TextStyle(fontSize: 14,fontFamily: 'poppins',fontWeight: FontWeight.normal,color: Color(0xFF090F13) ),
                                  ),
                                  Icon(
                                    Icons.date_range_outlined,
                                    color: FlutterFlowTheme.of(context).secondaryText,
                                    size: 24,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: (){
                          pickDateRange();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.44,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: const Color(0xFFCFD4DB),
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding:const EdgeInsetsDirectional.fromSTEB(12, 5, 12, 5),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                               Text(DateFormat('dd/MM/yyyy').format(end),
                                  style:const TextStyle(fontSize: 14,fontFamily: 'poppins',fontWeight: FontWeight.normal),
                                ),
                                Icon(
                                  Icons.date_range_outlined,
                                  color:FlutterFlowTheme.of(context).secondaryText,
                                  size: 24,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Align(
                  alignment:const AlignmentDirectional(0, 0.05),
                  child: Padding(
                    padding:const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:[
                        Padding(
                          padding:const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 5),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.92,
                            height: 150,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding:const EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding:const EdgeInsetsDirectional.fromSTEB(12, 10, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:MainAxisAlignment.start,
                                        crossAxisAlignment:CrossAxisAlignment.start,
                                        children: [

                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                            children: [
                                             const Text(
                                                'Requests Type 2232',
                                                style:  TextStyle(fontSize: 14,fontFamily: 'poppins',fontWeight: FontWeight.w500,color: Color(0xFF090F13)),
                                              ),
                                              Container(
                                                width: 90,
                                                height: 25,
                                                decoration: BoxDecoration(
                                                  color:const Color(0xFFFFA000),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                child:const Padding(
                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                  child: Text(
                                                    'Requested',
                                                    textAlign: TextAlign.center,
                                                    style:  TextStyle(fontSize: 12,fontFamily: 'poppins'),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),

                                          const Text(
                                            '12/02/2022 @ 3:10 Pm',
                                            style:  TextStyle(fontSize: 12,fontFamily: 'poppins',fontWeight: FontWeight.w300),
                                          ),

                                          Padding(
                                            padding:const EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  mainAxisSize:MainAxisSize.max,
                                                  crossAxisAlignment:CrossAxisAlignment.start,
                                                  children:const [

                                                    Padding(
                                                      padding:EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                      child: Text(
                                                        'Product Name',
                                                        style:  TextStyle(fontSize: 14,fontFamily: 'poppins',fontWeight: FontWeight.w300)),
                                                    ),

                                                    Padding(
                                                      padding:EdgeInsetsDirectional.fromSTEB(5, 5, 0, 0),
                                                      child: Text(
                                                        'Outside Corner',
                                                        style:  TextStyle(fontSize: 14,fontFamily: 'poppins')),
                                                    ),
                                                  ],
                                                ),
                                                Image.asset(
                                                  'assets/images/5QIOUZ.webp',
                                                  width: 1,
                                                  height: 30,
                                                  fit: BoxFit.cover,
                                                ),
                                                Padding(
                                                  padding:const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                                  child: Column(
                                                    mainAxisSize:MainAxisSize.max,
                                                    crossAxisAlignment:CrossAxisAlignment.start,
                                                    children:const [

                                                      Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                        child: Text(
                                                          'Request id',
                                                          style:  TextStyle(fontSize: 13,fontFamily: 'poppins',fontWeight: FontWeight.w300))
                                                          ),

                                                      Padding(
                                                        padding:EdgeInsetsDirectional.fromSTEB(5, 5, 0, 0),
                                                        child: Text(
                                                          '11314142',
                                                          style: TextStyle(fontSize: 14,fontFamily: 'poppins'),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),


                
                Align(
                  alignment:const AlignmentDirectional(0, 0.05),
                  child: Padding(
                    padding:const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:[
                        Padding(
                          padding:const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 5),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.92,
                            height: 150,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding:const EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding:const EdgeInsetsDirectional.fromSTEB(12, 10, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:MainAxisAlignment.start,
                                        crossAxisAlignment:CrossAxisAlignment.start,
                                        children: [

                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                            children: [
                                             const Text(
                                                'Requests Type 2233',
                                                style:  TextStyle(fontSize: 14,fontFamily: 'poppins',fontWeight: FontWeight.w500,color: Color(0xFF090F13)),
                                              ),
                                              Container(
                                                width: 90,
                                                height: 25,
                                                decoration: BoxDecoration(
                                                  color:const Color(0x7EC5F5C5),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                child:const Padding(
                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                  child: Text(
                                                    'Completed',
                                                    textAlign: TextAlign.center,
                                                    style:  TextStyle(fontSize: 12,fontFamily: 'poppins'),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),

                                          const Text(
                                            '14/02/2022 @ 6:10 Pm',
                                            style:  TextStyle(fontSize: 12,fontFamily: 'poppins',fontWeight: FontWeight.w300),
                                          ),

                                          Padding(
                                            padding:const EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  mainAxisSize:MainAxisSize.max,
                                                  crossAxisAlignment:CrossAxisAlignment.start,
                                                  children:const [

                                                    Padding(
                                                      padding:EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                      child: Text(
                                                        'Product Name',
                                                        style:  TextStyle(fontSize: 14,fontFamily: 'poppins',fontWeight: FontWeight.w300)),
                                                    ),

                                                    Padding(
                                                      padding:EdgeInsetsDirectional.fromSTEB(5, 5, 0, 0),
                                                      child: Text(
                                                        'Inside Corner',
                                                        style:  TextStyle(fontSize: 14,fontFamily: 'poppins')),
                                                    ),
                                                  ],
                                                ),
                                                Image.asset(
                                                  'assets/images/5QIOUZ.webp',
                                                  width: 1,
                                                  height: 30,
                                                  fit: BoxFit.cover,
                                                ),
                                                Padding(
                                                  padding:const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                                  child: Column(
                                                    mainAxisSize:MainAxisSize.max,
                                                    crossAxisAlignment:CrossAxisAlignment.start,
                                                    children:const [

                                                      Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                        child: Text(
                                                          'Request id',
                                                          style:  TextStyle(fontSize: 13,fontFamily: 'poppins',fontWeight: FontWeight.w300))
                                                          ),

                                                      Padding(
                                                        padding:EdgeInsetsDirectional.fromSTEB(5, 5, 0, 0),
                                                        child: Text(
                                                          '253434534',
                                                          style: TextStyle(fontSize: 14,fontFamily: 'poppins'),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    
  }
  Future pickDateRange() async{
    DateTimeRange? newDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate:  DateTime(2100),
      );
    showDateRangePicker(
      context: context,
      initialDateRange: dateRange,
      firstDate: DateTime(1900),
      lastDate:  DateTime(1900),
      );
      //Cancel Function:
      if(newDateRange == null) return;
      setState(() {
        dateRange = newDateRange;
      });
  }
}
