import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../flutter_flow/flutter_flow_theme.dart';

class MostPurchasedProductsPage extends StatefulWidget {
  const MostPurchasedProductsPage({Key? key}) : super(key: key);

  @override
  State<MostPurchasedProductsPage> createState() => _MostPurchasedProductsPageState();
}

class _MostPurchasedProductsPageState extends State<MostPurchasedProductsPage> {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    final TextEditingController _search = TextEditingController();
    DateTimeRange dateRange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now(),
  );
  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;
    return  Scaffold(
      
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
          'Most Purchased Products',
          style: FlutterFlowTheme.of(context).bodyText1,
        ),
        elevation: 0,
        
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
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
                    controller: _search,
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.black,
                    decoration:const InputDecoration(
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search,color: Colors.grey),
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

                Padding(
                  padding:const EdgeInsets.only(left: 15,right: 15,top: 20,bottom: 10),
                  child: Container(
                    width:double.infinity,
                    height: 85,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding:const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Image.asset(
                            'assets/images/c79oz_R.jpg',
                            width: 70,
                            height: 70,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 25),
                        Padding(
                          padding:const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Text(
                                  'UltraTech PPC Cement 25 Kg',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding:const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children:const [
                                        Text(
                                          'Quantity',
                                          style:  TextStyle(fontSize: 12,fontFamily: 'Poppins',fontWeight: FontWeight.normal),
                                        ),
                                        Text(
                                          '300',
                                          style:  TextStyle(fontSize: 12,fontFamily: 'Poppins'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:const EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                                    child: Image.asset(
                                      'assets/images/5QIOUZ.webp',
                                      width: 1,
                                      height: 40,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding:const EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children:const [
                                        Text(
                                          'Amount',
                                          style:  TextStyle(fontSize: 12,fontFamily: 'Poppins',fontWeight: FontWeight.normal),
                                       
                                        ),
                                        Text(
                                          '₹20000',
                                          style: TextStyle(fontSize: 12,fontFamily: 'Poppins',),
                                         
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 05),
                  Padding(
                  padding:const EdgeInsets.only(left: 15,right: 15,top: 20,bottom: 10),
                  child: Container(
                    width:double.infinity,
                    height: 85,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding:const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Image.asset(
                            'assets/images/cement.jpg',
                            width: 70,
                            height: 70,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 25),
                        Padding(
                          padding:const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Text(
                                  'UltraTech PPC Cement 25 Kg',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding:const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children:const [
                                        Text(
                                          'Quantity',
                                          style:  TextStyle(fontSize: 12,fontFamily: 'Poppins',fontWeight: FontWeight.normal),
                                        ),
                                        Text(
                                          '10',
                                          style:  TextStyle(fontSize: 12,fontFamily: 'Poppins'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:const EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                                    child: Image.asset(
                                      'assets/images/5QIOUZ.webp',
                                      width: 1,
                                      height: 40,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding:const EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children:const [
                                        Text(
                                          'Amount',
                                          style:  TextStyle(fontSize: 12,fontFamily: 'Poppins',fontWeight: FontWeight.normal),
                                       
                                        ),
                                        Text(
                                          '₹2000',
                                          style: TextStyle(fontSize: 12,fontFamily: 'Poppins',),
                                         
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
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