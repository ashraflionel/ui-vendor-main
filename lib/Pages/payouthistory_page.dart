import 'package:intl/intl.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class PayoutHistoryPage extends StatefulWidget {
  const PayoutHistoryPage({Key? key}) : super(key: key);

  @override
  _PayoutHistoryPageState createState() => _PayoutHistoryPageState();
}

class _PayoutHistoryPageState extends State<PayoutHistoryPage> {

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
          'Your Payouts',
          style: FlutterFlowTheme.of(context).bodyText1,
        ),
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                //From & TO
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
             
                //Pick Date and Time:
                    //Choose Date and Time:
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
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
               const SizedBox(height: 15),
               Padding(
                 padding: const EdgeInsets.only(right: 10,bottom: 30,top: 10),
                 child: Align(
                  alignment: Alignment.centerRight,
                   child: SizedBox(
                    height: 50,
                    width: 150,
                     child: OutlinedButton(
                     onPressed: () {},
                     // ignore: sort_child_properties_last
                     child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children:const [
                         Icon(Icons.cloud_download_outlined,color: Colors.black),
                         Text('Download',
                         style: TextStyle(fontSize: 14,color: Colors.black),)
                       ],
                     ),
                     style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      side:const BorderSide(width: 1.0, color: Colors.black),
                      ),
                              ),
                   ),
                 ),
               ),
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15),
                  child: Container(
                    padding:const EdgeInsets.only(top: 15,bottom: 10),
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow:const [
                        BoxShadow(color: Colors.black87),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding:const EdgeInsets.only(left: 20,right: 10,bottom: 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 50,
                                height: 20,
                                decoration:const BoxDecoration(),
                                child:const Text(
                                  'Date',
                                  style: TextStyle(fontSize: 12,fontWeight:FontWeight.w600,fontFamily: 'poppins')
                               
                                ),
                              ),
                              Container(
                                width: 50,
                                height: 30,
                                decoration:const BoxDecoration(),
                                child:const Text(
                                  'Order ID',
                                  style: TextStyle(fontSize: 12,fontWeight:FontWeight.w600,fontFamily: 'poppins')
                                ),
                              ),
                            const SizedBox(width: 4),
                              Container(
                                width: 60,
                                height: 20,
                                decoration:const BoxDecoration(),
                                child:const Text(
                                  'Amount',
                                  style: TextStyle(fontSize: 12,fontWeight:FontWeight.w600,fontFamily: 'poppins')
                                ),
                              ),
                              Container(
                                width: 50,
                                height: 30,
                                decoration:const BoxDecoration(),
                                child:const Text(
                                  'Service\nCharge',
                                  style:  TextStyle(fontSize: 12,fontWeight:FontWeight.w600,fontFamily: 'poppins')
                                ),
                              ),
                              Container(
                                width: 90,
                                height: 30,
                                decoration:const BoxDecoration(),
                                child:const Text(
                                  'Transaction ID',
                                  style:  TextStyle(fontSize: 12,fontWeight:FontWeight.w600,fontFamily: 'poppins'),
                                ),
                              ),
                            ],
                          ),
                        ),

                           Padding(
                          padding:const EdgeInsets.only(left:10,top: 5,bottom: 5,right: 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 50,
                                height: 20,
                                decoration: BoxDecoration(),
                                child:const Text(
                                  '10/2/22',
                                  style:  TextStyle(fontSize: 12,fontWeight: FontWeight.normal,fontFamily: 'poppins'),
                                ),
                              ),
          
                              Container(
                                width: 50,
                                height: 30,
                                decoration:const BoxDecoration(),
                                child:const Text(
                                  '121213143',
                                  style:  TextStyle(fontSize: 12,fontWeight: FontWeight.normal,fontFamily: 'poppins'),
                                ),
                              ),
          
                              Container(
                                width: 60,
                                height: 20,
                                decoration:const BoxDecoration(),
                                child:const Text(
                                  '₹279.55',
                                  style:  TextStyle(fontSize: 12,fontWeight: FontWeight.normal,fontFamily: 'poppins'),
                                ),
                              ),
          
                              Container(
                                width: 50,
                                height: 30,
                                decoration:const BoxDecoration(),
                                child:const Text(
                                  '₹27',
                                  style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,fontFamily: 'poppins'),
                                 
                                ),
                              ),
                              Container(
                                width: 70,
                                height: 30,
                                decoration:const BoxDecoration(),
                                child:const Text(
                                '121213133',
                                style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,fontFamily: 'poppins'),
                                ),
                              ),
                            ],
                          ),
                        ),




                        /////////////////
                       
                        Padding(
                          padding:const EdgeInsets.only(left:10,top: 5,bottom: 5,right: 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 50,
                                height: 20,
                                decoration: BoxDecoration(),
                                child:const Text(
                                  '10/2/22',
                                  style:  TextStyle(fontSize: 12,fontWeight: FontWeight.normal,fontFamily: 'poppins'),
                                ),
                              ),
          
                              Container(
                                width: 50,
                                height: 30,
                                decoration:const BoxDecoration(),
                                child:const Text(
                                  '121213143',
                                  style:  TextStyle(fontSize: 12,fontWeight: FontWeight.normal,fontFamily: 'poppins'),
                                ),
                              ),
          
                              Container(
                                width: 60,
                                height: 20,
                                decoration:const BoxDecoration(),
                                child:const Text(
                                  '₹279.55',
                                  style:  TextStyle(fontSize: 12,fontWeight: FontWeight.normal,fontFamily: 'poppins'),
                                ),
                              ),
          
                              Container(
                                width: 50,
                                height: 30,
                                decoration:const BoxDecoration(),
                                child:const Text(
                                  '₹27',
                                  style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,fontFamily: 'poppins'),
                                 
                                ),
                              ),
                              Container(
                                width: 70,
                                height: 30,
                                decoration:const BoxDecoration(),
                                child:const Text(
                                '121213133',
                                style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,fontFamily: 'poppins'),
                                ),
                              ),
                            ],
                          ),
                        ),

                           Padding(
                          padding:const EdgeInsets.only(left:10,top: 5,bottom: 5,right: 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 50,
                                height: 20,
                                decoration: BoxDecoration(),
                                child:const Text(
                                  '10/2/22',
                                  style:  TextStyle(fontSize: 12,fontWeight: FontWeight.normal,fontFamily: 'poppins'),
                                ),
                              ),
          
                              Container(
                                width: 50,
                                height: 30,
                                decoration:const BoxDecoration(),
                                child:const Text(
                                  '121213143',
                                  style:  TextStyle(fontSize: 12,fontWeight: FontWeight.normal,fontFamily: 'poppins'),
                                ),
                              ),
          
                              Container(
                                width: 60,
                                height: 20,
                                decoration:const BoxDecoration(),
                                child:const Text(
                                  '₹279.55',
                                  style:  TextStyle(fontSize: 12,fontWeight: FontWeight.normal,fontFamily: 'poppins'),
                                ),
                              ),
          
                              Container(
                                width: 50,
                                height: 30,
                                decoration:const BoxDecoration(),
                                child:const Text(
                                  '₹27',
                                  style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,fontFamily: 'poppins'),
                                 
                                ),
                              ),
                              Container(
                                width: 70,
                                height: 30,
                                decoration:const BoxDecoration(),
                                child:const Text(
                                '121213133',
                                style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,fontFamily: 'poppins'),
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
