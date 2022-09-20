// import 'package:page_transition/page_transition.dart';

// import '../flutter_flow/flutter_flow_drop_down.dart';
// import '../flutter_flow/flutter_flow_theme.dart';
// import '../flutter_flow/flutter_flow_util.dart';
// import '../flutter_flow/flutter_flow_widgets.dart';
// import 'package:easy_debounce/easy_debounce.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class AddNewProductWidget extends StatefulWidget {
//   const AddNewProductWidget({Key? key}) : super(key: key);

//   @override
//   _AddNewProductWidgetState createState() => _AddNewProductWidgetState();
// }

// class _AddNewProductWidgetState extends State<AddNewProductWidget> {
//   TextEditingController? textController10;

//   TextEditingController? textController8;

//   String? dropDownValue4;

//   TextEditingController? textController9;

//   TextEditingController? textController1;

//   TextEditingController? textController2;

//   String? dropDownValue1;

//   TextEditingController? textController3;

//   TextEditingController? textController4;

//   String? dropDownValue2;

//   TextEditingController? textController5;

//   String? dropDownValue3;

//   TextEditingController? textController6;

//   TextEditingController? textController7;

//   TextEditingController? textController11;

//   TextEditingController? textController12;

//   String? dropDownValue5;
//   final scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   void initState() {
//     super.initState();
//     textController1 = TextEditingController();
//     textController2 = TextEditingController();
//     textController3 = TextEditingController();
//     textController4 = TextEditingController();
//     textController5 = TextEditingController();
//     textController6 = TextEditingController();
//     textController7 = TextEditingController();
//     textController10 = TextEditingController();
//     textController8 = TextEditingController();
//     textController9 = TextEditingController();
//     textController11 = TextEditingController();
//     textController12 = TextEditingController();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: scaffoldKey,
//       appBar: AppBar(
//         backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
//         iconTheme: IconThemeData(color: Color(0xFF020000)),
//         automaticallyImplyLeading: false,
//         leading: InkWell(
//           onTap: () async {
//             Navigator.pop(context);
//           },
//           child: Icon(
//             Icons.arrow_back,
//             color: Colors.black,
//             size: 24,
//           ),
//         ),
//         title: Text(
//           'Add New Product',
//           style: FlutterFlowTheme.of(context).bodyText1,
//         ),
//         actions: [],
//         centerTitle: true,
//         elevation: 0,
//       ),
//       backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
//       body: SafeArea(
//         child: GestureDetector(
//           onTap: () => FocusScope.of(context).unfocus(),
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.max,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Row(
//                   mainAxisSize: MainAxisSize.max,
//                   children: [
//                     Padding(
//                       padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
//                       child: Text(
//                         'Product Name',
//                         style: FlutterFlowTheme.of(context).bodyText1,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Container(
//                   width: 350,
//                   height: 50,
//                   decoration: BoxDecoration(),
//                   child: Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
//                     child: TextFormField(
//                       controller: textController1,
//                       obscureText: false,
//                       decoration: InputDecoration(
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Color(0x00000000),
//                             width: 2,
//                           ),
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Color(0x00000000),
//                             width: 2,
//                           ),
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         errorBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Color(0x00000000),
//                             width: 2,
//                           ),
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         focusedErrorBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Color(0x00000000),
//                             width: 2,
//                           ),
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         filled: true,
//                         fillColor: Colors.white,
//                         contentPadding:
//                             EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
//                       ),
//                       style: FlutterFlowTheme.of(context).bodyText1.override(
//                             fontFamily: 'Poppins',
//                             color: FlutterFlowTheme.of(context).secondaryText,
//                             fontSize: 12,
//                             fontWeight: FontWeight.w500,
//                             fontStyle: FontStyle.italic,
//                           ),
//                       keyboardType: TextInputType.name,
//                     ),
//                   ),
//                 ),
//                 Row(
//                   mainAxisSize: MainAxisSize.max,
//                   children: [
//                     Row(
//                       mainAxisSize: MainAxisSize.max,
//                       children: [
//                         Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
//                           child: Text(
//                             'Size',
//                             textAlign: TextAlign.start,
//                             style:
//                                 FlutterFlowTheme.of(context).bodyText1.override(
//                                       fontFamily: 'Poppins',
//                                       color: Color(0xFF101817),
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(45, 5, 0, 0),
//                           child: Container(
//                             width: 80,
//                             height: 40,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(8),
//                               border: Border.all(
//                                 color: FlutterFlowTheme.of(context)
//                                     .primaryBackground,
//                                 width: 2,
//                               ),
//                             ),
//                             child: Padding(
//                               padding:
//                                   EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
//                               child: FlutterFlowDropDown(
//                                 options: ['Option 1'],
//                                 onChanged: (val) =>
//                                     setState(() => dropDownValue1 = val),
//                                 width: 180,
//                                 height: 50,
//                                 textStyle: FlutterFlowTheme.of(context)
//                                     .bodyText1
//                                     .override(
//                                       fontFamily: 'Poppins',
//                                       color: Color(0xFF020000),
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.normal,
//                                     ),
//                                 hintText: 'Unit',
//                                 fillColor: Colors.white,
//                                 elevation: 2,
//                                 borderColor: Colors.transparent,
//                                 borderWidth: 0,
//                                 borderRadius: 8,
//                                 margin: EdgeInsetsDirectional.fromSTEB(
//                                     12, 4, 12, 4),
//                                 hidesUnderline: true,
//                               ),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(10, 5, 0, 0),
//                           child: Container(
//                             width: 120,
//                             height: 50,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(8),
//                               border: Border.all(
//                                 color: FlutterFlowTheme.of(context)
//                                     .primaryBackground,
//                                 width: 2,
//                               ),
//                             ),
//                             child: Padding(
//                               padding:
//                                   EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
//                               child: TextFormField(
//                                 controller: textController2,
//                                 onChanged: (_) => EasyDebounce.debounce(
//                                   'textController2',
//                                   Duration(milliseconds: 2000),
//                                   () => setState(() {}),
//                                 ),
//                                 autofocus: true,
//                                 obscureText: false,
//                                 decoration: InputDecoration(
//                                   enabledBorder: UnderlineInputBorder(
//                                     borderSide: BorderSide(
//                                       color: Color(0x00000000),
//                                       width: 1,
//                                     ),
//                                     borderRadius: const BorderRadius.only(
//                                       topLeft: Radius.circular(4.0),
//                                       topRight: Radius.circular(4.0),
//                                     ),
//                                   ),
//                                   focusedBorder: UnderlineInputBorder(
//                                     borderSide: BorderSide(
//                                       color: Color(0x00000000),
//                                       width: 1,
//                                     ),
//                                     borderRadius: const BorderRadius.only(
//                                       topLeft: Radius.circular(4.0),
//                                       topRight: Radius.circular(4.0),
//                                     ),
//                                   ),
//                                   errorBorder: UnderlineInputBorder(
//                                     borderSide: BorderSide(
//                                       color: Color(0x00000000),
//                                       width: 1,
//                                     ),
//                                     borderRadius: const BorderRadius.only(
//                                       topLeft: Radius.circular(4.0),
//                                       topRight: Radius.circular(4.0),
//                                     ),
//                                   ),
//                                   focusedErrorBorder: UnderlineInputBorder(
//                                     borderSide: BorderSide(
//                                       color: Color(0x00000000),
//                                       width: 1,
//                                     ),
//                                     borderRadius: const BorderRadius.only(
//                                       topLeft: Radius.circular(4.0),
//                                       topRight: Radius.circular(4.0),
//                                     ),
//                                   ),
//                                 ),
//                                 style: FlutterFlowTheme.of(context)
//                                     .bodyText1
//                                     .override(
//                                       fontFamily: 'Poppins',
//                                       color: FlutterFlowTheme.of(context)
//                                           .primaryText,
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.normal,
//                                     ),
//                                 keyboardType: TextInputType.number,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 Row(
//                   mainAxisSize: MainAxisSize.max,
//                   children: [
//                     Padding(
//                       padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
//                       child: Text(
//                         'Price',
//                         textAlign: TextAlign.start,
//                         style: FlutterFlowTheme.of(context).bodyText1.override(
//                               fontFamily: 'Poppins',
//                               color: Color(0xFF101817),
//                               fontWeight: FontWeight.bold,
//                             ),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsetsDirectional.fromSTEB(40, 5, 0, 0),
//                       child: Container(
//                         width: 250,
//                         height: 50,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(8),
//                           border: Border.all(
//                             color:
//                                 FlutterFlowTheme.of(context).primaryBackground,
//                             width: 2,
//                           ),
//                         ),
//                         child: Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
//                           child: TextFormField(
//                             controller: textController3,
//                             onChanged: (_) => EasyDebounce.debounce(
//                               'textController3',
//                               Duration(milliseconds: 2000),
//                               () => setState(() {}),
//                             ),
//                             autofocus: true,
//                             obscureText: false,
//                             decoration: InputDecoration(
//                               enabledBorder: UnderlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: Color(0x00000000),
//                                   width: 1,
//                                 ),
//                                 borderRadius: const BorderRadius.only(
//                                   topLeft: Radius.circular(4.0),
//                                   topRight: Radius.circular(4.0),
//                                 ),
//                               ),
//                               focusedBorder: UnderlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: Color(0x00000000),
//                                   width: 1,
//                                 ),
//                                 borderRadius: const BorderRadius.only(
//                                   topLeft: Radius.circular(4.0),
//                                   topRight: Radius.circular(4.0),
//                                 ),
//                               ),
//                               errorBorder: UnderlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: Color(0x00000000),
//                                   width: 1,
//                                 ),
//                                 borderRadius: const BorderRadius.only(
//                                   topLeft: Radius.circular(4.0),
//                                   topRight: Radius.circular(4.0),
//                                 ),
//                               ),
//                               focusedErrorBorder: UnderlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: Color(0x00000000),
//                                   width: 1,
//                                 ),
//                                 borderRadius: const BorderRadius.only(
//                                   topLeft: Radius.circular(4.0),
//                                   topRight: Radius.circular(4.0),
//                                 ),
//                               ),
//                             ),
//                             style: FlutterFlowTheme.of(context)
//                                 .bodyText1
//                                 .override(
//                                   fontFamily: 'Poppins',
//                                   color:
//                                       FlutterFlowTheme.of(context).primaryText,
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.normal,
//                                 ),
//                             keyboardType: TextInputType.number,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   mainAxisSize: MainAxisSize.max,
//                   children: [
//                     Padding(
//                       padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
//                       child: Text(
//                         'Weight ',
//                         textAlign: TextAlign.start,
//                         style: FlutterFlowTheme.of(context).bodyText1.override(
//                               fontFamily: 'Poppins',
//                               color: Color(0xFF101817),
//                               fontWeight: FontWeight.bold,
//                             ),
//                       ),
//                     ),
//                     Row(
//                       mainAxisSize: MainAxisSize.max,
//                       children: [
//                         Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(20, 5, 0, 0),
//                           child: Container(
//                             width: 80,
//                             height: 40,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(8),
//                               border: Border.all(
//                                 color: FlutterFlowTheme.of(context)
//                                     .primaryBackground,
//                                 width: 2,
//                               ),
//                             ),
//                             child: FlutterFlowDropDown(
//                               options: ['Option 1'],
//                               onChanged: (val) =>
//                                   setState(() => dropDownValue2 = val),
//                               width: 180,
//                               height: 50,
//                               textStyle: FlutterFlowTheme.of(context)
//                                   .bodyText1
//                                   .override(
//                                     fontFamily: 'Poppins',
//                                     color: Color(0xFF020000),
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.normal,
//                                   ),
//                               hintText: 'Unit',
//                               fillColor: Colors.white,
//                               elevation: 2,
//                               borderColor: Colors.transparent,
//                               borderWidth: 0,
//                               borderRadius: 8,
//                               margin:
//                                   EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
//                               hidesUnderline: true,
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(10, 5, 0, 0),
//                           child: Container(
//                             width: 120,
//                             height: 50,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(8),
//                               border: Border.all(
//                                 color: FlutterFlowTheme.of(context)
//                                     .primaryBackground,
//                                 width: 2,
//                               ),
//                             ),
//                             child: Padding(
//                               padding:
//                                   EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
//                               child: TextFormField(
//                                 controller: textController4,
//                                 onChanged: (_) => EasyDebounce.debounce(
//                                   'textController4',
//                                   Duration(milliseconds: 2000),
//                                   () => setState(() {}),
//                                 ),
//                                 autofocus: true,
//                                 obscureText: false,
//                                 decoration: InputDecoration(
//                                   enabledBorder: UnderlineInputBorder(
//                                     borderSide: BorderSide(
//                                       color: Color(0x00000000),
//                                       width: 1,
//                                     ),
//                                     borderRadius: const BorderRadius.only(
//                                       topLeft: Radius.circular(4.0),
//                                       topRight: Radius.circular(4.0),
//                                     ),
//                                   ),
//                                   focusedBorder: UnderlineInputBorder(
//                                     borderSide: BorderSide(
//                                       color: Color(0x00000000),
//                                       width: 1,
//                                     ),
//                                     borderRadius: const BorderRadius.only(
//                                       topLeft: Radius.circular(4.0),
//                                       topRight: Radius.circular(4.0),
//                                     ),
//                                   ),
//                                   errorBorder: UnderlineInputBorder(
//                                     borderSide: BorderSide(
//                                       color: Color(0x00000000),
//                                       width: 1,
//                                     ),
//                                     borderRadius: const BorderRadius.only(
//                                       topLeft: Radius.circular(4.0),
//                                       topRight: Radius.circular(4.0),
//                                     ),
//                                   ),
//                                   focusedErrorBorder: UnderlineInputBorder(
//                                     borderSide: BorderSide(
//                                       color: Color(0x00000000),
//                                       width: 1,
//                                     ),
//                                     borderRadius: const BorderRadius.only(
//                                       topLeft: Radius.circular(4.0),
//                                       topRight: Radius.circular(4.0),
//                                     ),
//                                   ),
//                                 ),
//                                 style: FlutterFlowTheme.of(context)
//                                     .bodyText1
//                                     .override(
//                                       fontFamily: 'Poppins',
//                                       color: FlutterFlowTheme.of(context)
//                                           .primaryText,
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.normal,
//                                     ),
//                                 keyboardType: TextInputType.number,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 Row(
//                   mainAxisSize: MainAxisSize.max,
//                   children: [
//                     Padding(
//                       padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
//                       child: Text(
//                         'Product Dimensions',
//                         textAlign: TextAlign.start,
//                         style: FlutterFlowTheme.of(context).bodyText1.override(
//                               fontFamily: 'Poppins',
//                               color: Color(0xFF101817),
//                               fontWeight: FontWeight.w600,
//                             ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Padding(
//                         padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
//                         child: Container(
//                           width: 80,
//                           height: 40,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(8),
//                             border: Border.all(
//                               color: FlutterFlowTheme.of(context)
//                                   .secondaryBackground,
//                               width: 2,
//                             ),
//                           ),
//                           child: FlutterFlowDropDown(
//                             options: ['Option 1'],
//                             onChanged: (val) =>
//                                 setState(() => dropDownValue3 = val),
//                             width: 180,
//                             height: 50,
//                             textStyle:
//                                 FlutterFlowTheme.of(context).bodyText1.override(
//                                       fontFamily: 'Poppins',
//                                       color: Colors.black,
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.normal,
//                                     ),
//                             hintText: 'Unit',
//                             fillColor: Colors.white,
//                             elevation: 2,
//                             borderColor: Colors.transparent,
//                             borderWidth: 0,
//                             borderRadius: 8,
//                             margin:
//                                 EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
//                             hidesUnderline: true,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsetsDirectional.fromSTEB(10, 5, 0, 0),
//                         child: Container(
//                           width: 80,
//                           height: 50,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(8),
//                             border: Border.all(
//                               color: FlutterFlowTheme.of(context)
//                                   .secondaryBackground,
//                               width: 2,
//                             ),
//                           ),
//                           child: Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
//                             child: TextFormField(
//                               controller: textController5,
//                               onChanged: (_) => EasyDebounce.debounce(
//                                 'textController5',
//                                 Duration(milliseconds: 2000),
//                                 () => setState(() {}),
//                               ),
//                               autofocus: true,
//                               obscureText: false,
//                               decoration: InputDecoration(
//                                 labelText: 'Height',
//                                 enabledBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Color(0x00000000),
//                                     width: 1,
//                                   ),
//                                   borderRadius: const BorderRadius.only(
//                                     topLeft: Radius.circular(4.0),
//                                     topRight: Radius.circular(4.0),
//                                   ),
//                                 ),
//                                 focusedBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Color(0x00000000),
//                                     width: 1,
//                                   ),
//                                   borderRadius: const BorderRadius.only(
//                                     topLeft: Radius.circular(4.0),
//                                     topRight: Radius.circular(4.0),
//                                   ),
//                                 ),
//                                 errorBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Color(0x00000000),
//                                     width: 1,
//                                   ),
//                                   borderRadius: const BorderRadius.only(
//                                     topLeft: Radius.circular(4.0),
//                                     topRight: Radius.circular(4.0),
//                                   ),
//                                 ),
//                                 focusedErrorBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Color(0x00000000),
//                                     width: 1,
//                                   ),
//                                   borderRadius: const BorderRadius.only(
//                                     topLeft: Radius.circular(4.0),
//                                     topRight: Radius.circular(4.0),
//                                   ),
//                                 ),
//                               ),
//                               style: FlutterFlowTheme.of(context)
//                                   .bodyText1
//                                   .override(
//                                     fontFamily: 'Poppins',
//                                     color: FlutterFlowTheme.of(context)
//                                         .primaryText,
//                                     fontSize: 11,
//                                     fontWeight: FontWeight.normal,
//                                   ),
//                               textAlign: TextAlign.center,
//                               keyboardType: TextInputType.number,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsetsDirectional.fromSTEB(5, 5, 0, 0),
//                         child: Container(
//                           width: 80,
//                           height: 50,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(8),
//                             border: Border.all(
//                               color: FlutterFlowTheme.of(context)
//                                   .secondaryBackground,
//                               width: 2,
//                             ),
//                           ),
//                           child: Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
//                             child: TextFormField(
//                               controller: textController6,
//                               onChanged: (_) => EasyDebounce.debounce(
//                                 'textController6',
//                                 Duration(milliseconds: 2000),
//                                 () => setState(() {}),
//                               ),
//                               autofocus: true,
//                               obscureText: false,
//                               decoration: InputDecoration(
//                                 labelText: ' Width',
//                                 enabledBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Color(0x00000000),
//                                     width: 1,
//                                   ),
//                                   borderRadius: const BorderRadius.only(
//                                     topLeft: Radius.circular(4.0),
//                                     topRight: Radius.circular(4.0),
//                                   ),
//                                 ),
//                                 focusedBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Color(0x00000000),
//                                     width: 1,
//                                   ),
//                                   borderRadius: const BorderRadius.only(
//                                     topLeft: Radius.circular(4.0),
//                                     topRight: Radius.circular(4.0),
//                                   ),
//                                 ),
//                                 errorBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Color(0x00000000),
//                                     width: 1,
//                                   ),
//                                   borderRadius: const BorderRadius.only(
//                                     topLeft: Radius.circular(4.0),
//                                     topRight: Radius.circular(4.0),
//                                   ),
//                                 ),
//                                 focusedErrorBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Color(0x00000000),
//                                     width: 1,
//                                   ),
//                                   borderRadius: const BorderRadius.only(
//                                     topLeft: Radius.circular(4.0),
//                                     topRight: Radius.circular(4.0),
//                                   ),
//                                 ),
//                               ),
//                               style: FlutterFlowTheme.of(context)
//                                   .bodyText1
//                                   .override(
//                                     fontFamily: 'Poppins',
//                                     color: FlutterFlowTheme.of(context)
//                                         .primaryText,
//                                     fontSize: 11,
//                                     fontWeight: FontWeight.normal,
//                                   ),
//                               textAlign: TextAlign.center,
//                               keyboardType: TextInputType.number,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsetsDirectional.fromSTEB(5, 5, 0, 0),
//                         child: Container(
//                           width: 80,
//                           height: 50,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(8),
//                             border: Border.all(
//                               color: FlutterFlowTheme.of(context)
//                                   .secondaryBackground,
//                               width: 2,
//                             ),
//                           ),
//                           child: Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
//                             child: TextFormField(
//                               controller: textController7,
//                               onChanged: (_) => EasyDebounce.debounce(
//                                 'textController7',
//                                 Duration(milliseconds: 2000),
//                                 () => setState(() {}),
//                               ),
//                               autofocus: true,
//                               obscureText: false,
//                               decoration: InputDecoration(
//                                 labelText: 'Length',
//                                 enabledBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Color(0x00000000),
//                                     width: 1,
//                                   ),
//                                   borderRadius: const BorderRadius.only(
//                                     topLeft: Radius.circular(4.0),
//                                     topRight: Radius.circular(4.0),
//                                   ),
//                                 ),
//                                 focusedBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Color(0x00000000),
//                                     width: 1,
//                                   ),
//                                   borderRadius: const BorderRadius.only(
//                                     topLeft: Radius.circular(4.0),
//                                     topRight: Radius.circular(4.0),
//                                   ),
//                                 ),
//                                 errorBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Color(0x00000000),
//                                     width: 1,
//                                   ),
//                                   borderRadius: const BorderRadius.only(
//                                     topLeft: Radius.circular(4.0),
//                                     topRight: Radius.circular(4.0),
//                                   ),
//                                 ),
//                                 focusedErrorBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Color(0x00000000),
//                                     width: 1,
//                                   ),
//                                   borderRadius: const BorderRadius.only(
//                                     topLeft: Radius.circular(4.0),
//                                     topRight: Radius.circular(4.0),
//                                   ),
//                                 ),
//                               ),
//                               style: FlutterFlowTheme.of(context)
//                                   .bodyText1
//                                   .override(
//                                     fontFamily: 'Poppins',
//                                     color: FlutterFlowTheme.of(context)
//                                         .primaryText,
//                                     fontSize: 11,
//                                     fontWeight: FontWeight.normal,
//                                   ),
//                               keyboardType: TextInputType.number,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Row(
//                   mainAxisSize: MainAxisSize.max,
//                   children: [
//                     Padding(
//                       padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
//                       child: Text(
//                         'Package Dimensions',
//                         textAlign: TextAlign.start,
//                         style: FlutterFlowTheme.of(context).bodyText1.override(
//                               fontFamily: 'Poppins',
//                               color: Color(0xFF101817),
//                               fontWeight: FontWeight.w600,
//                             ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Padding(
//                         padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
//                         child: Container(
//                           width: 80,
//                           height: 40,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(8),
//                             border: Border.all(
//                               color: FlutterFlowTheme.of(context)
//                                   .secondaryBackground,
//                               width: 2,
//                             ),
//                           ),
//                           child: FlutterFlowDropDown(
//                             options: ['Option 1'],
//                             onChanged: (val) =>
//                                 setState(() => dropDownValue4 = val),
//                             width: 180,
//                             height: 50,
//                             textStyle:
//                                 FlutterFlowTheme.of(context).bodyText1.override(
//                                       fontFamily: 'Poppins',
//                                       color: Colors.black,
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.normal,
//                                     ),
//                             hintText: 'Unit',
//                             fillColor: Colors.white,
//                             elevation: 2,
//                             borderColor: Colors.transparent,
//                             borderWidth: 0,
//                             borderRadius: 8,
//                             margin:
//                                 EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
//                             hidesUnderline: true,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsetsDirectional.fromSTEB(10, 5, 0, 0),
//                         child: Container(
//                           width: 80,
//                           height: 50,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(8),
//                             border: Border.all(
//                               color: FlutterFlowTheme.of(context)
//                                   .secondaryBackground,
//                               width: 2,
//                             ),
//                           ),
//                           child: Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
//                             child: TextFormField(
//                               controller: textController8,
//                               onChanged: (_) => EasyDebounce.debounce(
//                                 'textController8',
//                                 Duration(milliseconds: 2000),
//                                 () => setState(() {}),
//                               ),
//                               autofocus: true,
//                               obscureText: false,
//                               decoration: InputDecoration(
//                                 labelText: 'Height',
//                                 enabledBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Color(0x00000000),
//                                     width: 1,
//                                   ),
//                                   borderRadius: const BorderRadius.only(
//                                     topLeft: Radius.circular(4.0),
//                                     topRight: Radius.circular(4.0),
//                                   ),
//                                 ),
//                                 focusedBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Color(0x00000000),
//                                     width: 1,
//                                   ),
//                                   borderRadius: const BorderRadius.only(
//                                     topLeft: Radius.circular(4.0),
//                                     topRight: Radius.circular(4.0),
//                                   ),
//                                 ),
//                                 errorBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Color(0x00000000),
//                                     width: 1,
//                                   ),
//                                   borderRadius: const BorderRadius.only(
//                                     topLeft: Radius.circular(4.0),
//                                     topRight: Radius.circular(4.0),
//                                   ),
//                                 ),
//                                 focusedErrorBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Color(0x00000000),
//                                     width: 1,
//                                   ),
//                                   borderRadius: const BorderRadius.only(
//                                     topLeft: Radius.circular(4.0),
//                                     topRight: Radius.circular(4.0),
//                                   ),
//                                 ),
//                               ),
//                               style: FlutterFlowTheme.of(context)
//                                   .bodyText1
//                                   .override(
//                                     fontFamily: 'Poppins',
//                                     color: FlutterFlowTheme.of(context)
//                                         .primaryText,
//                                     fontSize: 11,
//                                     fontWeight: FontWeight.normal,
//                                   ),
//                               textAlign: TextAlign.center,
//                               keyboardType: TextInputType.number,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsetsDirectional.fromSTEB(5, 5, 0, 0),
//                         child: Container(
//                           width: 80,
//                           height: 50,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(8),
//                             border: Border.all(
//                               color: FlutterFlowTheme.of(context)
//                                   .secondaryBackground,
//                               width: 2,
//                             ),
//                           ),
//                           child: Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
//                             child: TextFormField(
//                               controller: textController9,
//                               onChanged: (_) => EasyDebounce.debounce(
//                                 'textController9',
//                                 Duration(milliseconds: 2000),
//                                 () => setState(() {}),
//                               ),
//                               autofocus: true,
//                               obscureText: false,
//                               decoration: InputDecoration(
//                                 labelText: ' Width',
//                                 enabledBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Color(0x00000000),
//                                     width: 1,
//                                   ),
//                                   borderRadius: const BorderRadius.only(
//                                     topLeft: Radius.circular(4.0),
//                                     topRight: Radius.circular(4.0),
//                                   ),
//                                 ),
//                                 focusedBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Color(0x00000000),
//                                     width: 1,
//                                   ),
//                                   borderRadius: const BorderRadius.only(
//                                     topLeft: Radius.circular(4.0),
//                                     topRight: Radius.circular(4.0),
//                                   ),
//                                 ),
//                                 errorBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Color(0x00000000),
//                                     width: 1,
//                                   ),
//                                   borderRadius: const BorderRadius.only(
//                                     topLeft: Radius.circular(4.0),
//                                     topRight: Radius.circular(4.0),
//                                   ),
//                                 ),
//                                 focusedErrorBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Color(0x00000000),
//                                     width: 1,
//                                   ),
//                                   borderRadius: const BorderRadius.only(
//                                     topLeft: Radius.circular(4.0),
//                                     topRight: Radius.circular(4.0),
//                                   ),
//                                 ),
//                               ),
//                               style: FlutterFlowTheme.of(context)
//                                   .bodyText1
//                                   .override(
//                                     fontFamily: 'Poppins',
//                                     color: FlutterFlowTheme.of(context)
//                                         .primaryText,
//                                     fontSize: 11,
//                                     fontWeight: FontWeight.normal,
//                                   ),
//                               textAlign: TextAlign.center,
//                               keyboardType: TextInputType.number,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsetsDirectional.fromSTEB(5, 5, 0, 0),
//                         child: Container(
//                           width: 80,
//                           height: 50,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(8),
//                             border: Border.all(
//                               color: FlutterFlowTheme.of(context)
//                                   .secondaryBackground,
//                               width: 2,
//                             ),
//                           ),
//                           child: Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
//                             child: TextFormField(
//                               controller: textController10,
//                               onChanged: (_) => EasyDebounce.debounce(
//                                 'textController10',
//                                 Duration(milliseconds: 2000),
//                                 () => setState(() {}),
//                               ),
//                               autofocus: true,
//                               obscureText: false,
//                               decoration: InputDecoration(
//                                 labelText: 'Length',
//                                 enabledBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Color(0x00000000),
//                                     width: 1,
//                                   ),
//                                   borderRadius: const BorderRadius.only(
//                                     topLeft: Radius.circular(4.0),
//                                     topRight: Radius.circular(4.0),
//                                   ),
//                                 ),
//                                 focusedBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Color(0x00000000),
//                                     width: 1,
//                                   ),
//                                   borderRadius: const BorderRadius.only(
//                                     topLeft: Radius.circular(4.0),
//                                     topRight: Radius.circular(4.0),
//                                   ),
//                                 ),
//                                 errorBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Color(0x00000000),
//                                     width: 1,
//                                   ),
//                                   borderRadius: const BorderRadius.only(
//                                     topLeft: Radius.circular(4.0),
//                                     topRight: Radius.circular(4.0),
//                                   ),
//                                 ),
//                                 focusedErrorBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Color(0x00000000),
//                                     width: 1,
//                                   ),
//                                   borderRadius: const BorderRadius.only(
//                                     topLeft: Radius.circular(4.0),
//                                     topRight: Radius.circular(4.0),
//                                   ),
//                                 ),
//                               ),
//                               style: FlutterFlowTheme.of(context)
//                                   .bodyText1
//                                   .override(
//                                     fontFamily: 'Poppins',
//                                     color: FlutterFlowTheme.of(context)
//                                         .primaryText,
//                                     fontSize: 11,
//                                     fontWeight: FontWeight.normal,
//                                   ),
//                               keyboardType: TextInputType.number,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
//                   child: FFButtonWidget(
//                     onPressed: () async {
//                       await Navigator.push(
//                         context,
//                         PageTransition(
//                           type: PageTransitionType.fade,
//                           duration: Duration(milliseconds: 0),
//                           reverseDuration: Duration(milliseconds: 0),
//                           child: UnitVariationWidget(),
//                         ),
//                       );
//                     },
//                     text: 'Edit  SizeOptions',
//                     options: FFButtonOptions(
//                       width: 330,
//                       height: 40,
//                       color: FlutterFlowTheme.of(context).primaryColor,
//                       textStyle:
//                           FlutterFlowTheme.of(context).subtitle2.override(
//                                 fontFamily: 'Poppins',
//                                 color: Colors.white,
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.normal,
//                               ),
//                       elevation: 2,
//                       borderSide: BorderSide(
//                         color: FlutterFlowTheme.of(context).primaryColor,
//                         width: 1,
//                       ),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Padding(
//                         padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
//                         child: Text(
//                           'Product Description',
//                           textAlign: TextAlign.start,
//                           style:
//                               FlutterFlowTheme.of(context).bodyText1.override(
//                                     fontFamily: 'Poppins',
//                                     color: Color(0xFF101817),
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
//                   child: Container(
//                     width: 350,
//                     height: 100,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(8),
//                       border: Border.all(
//                         color: FlutterFlowTheme.of(context).secondaryBackground,
//                       ),
//                     ),
//                     child: Padding(
//                       padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
//                       child: TextFormField(
//                         controller: textController11,
//                         onChanged: (_) => EasyDebounce.debounce(
//                           'textController11',
//                           Duration(milliseconds: 2000),
//                           () => setState(() {}),
//                         ),
//                         autofocus: true,
//                         obscureText: false,
//                         decoration: InputDecoration(
//                           enabledBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Color(0x00000000),
//                               width: 1,
//                             ),
//                             borderRadius: const BorderRadius.only(
//                               topLeft: Radius.circular(4.0),
//                               topRight: Radius.circular(4.0),
//                             ),
//                           ),
//                           focusedBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Color(0x00000000),
//                               width: 1,
//                             ),
//                             borderRadius: const BorderRadius.only(
//                               topLeft: Radius.circular(4.0),
//                               topRight: Radius.circular(4.0),
//                             ),
//                           ),
//                           errorBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Color(0x00000000),
//                               width: 1,
//                             ),
//                             borderRadius: const BorderRadius.only(
//                               topLeft: Radius.circular(4.0),
//                               topRight: Radius.circular(4.0),
//                             ),
//                           ),
//                           focusedErrorBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Color(0x00000000),
//                               width: 1,
//                             ),
//                             borderRadius: const BorderRadius.only(
//                               topLeft: Radius.circular(4.0),
//                               topRight: Radius.circular(4.0),
//                             ),
//                           ),
//                         ),
//                         style: FlutterFlowTheme.of(context).bodyText1.override(
//                               fontFamily: 'Poppins',
//                               color: FlutterFlowTheme.of(context).primaryColor,
//                               fontSize: 12,
//                               fontWeight: FontWeight.normal,
//                             ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Padding(
//                         padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
//                         child: Text(
//                           'Product Specifications',
//                           textAlign: TextAlign.start,
//                           style:
//                               FlutterFlowTheme.of(context).bodyText1.override(
//                                     fontFamily: 'Poppins',
//                                     color: Color(0xFF101817),
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
//                   child: Container(
//                     width: 350,
//                     height: 100,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(8),
//                       border: Border.all(
//                         color: FlutterFlowTheme.of(context).secondaryBackground,
//                       ),
//                     ),
//                     child: Padding(
//                       padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
//                       child: TextFormField(
//                         controller: textController12,
//                         onChanged: (_) => EasyDebounce.debounce(
//                           'textController12',
//                           Duration(milliseconds: 2000),
//                           () => setState(() {}),
//                         ),
//                         autofocus: true,
//                         obscureText: false,
//                         decoration: InputDecoration(
//                           enabledBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Color(0x00000000),
//                               width: 1,
//                             ),
//                             borderRadius: const BorderRadius.only(
//                               topLeft: Radius.circular(4.0),
//                               topRight: Radius.circular(4.0),
//                             ),
//                           ),
//                           focusedBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Color(0x00000000),
//                               width: 1,
//                             ),
//                             borderRadius: const BorderRadius.only(
//                               topLeft: Radius.circular(4.0),
//                               topRight: Radius.circular(4.0),
//                             ),
//                           ),
//                           errorBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Color(0x00000000),
//                               width: 1,
//                             ),
//                             borderRadius: const BorderRadius.only(
//                               topLeft: Radius.circular(4.0),
//                               topRight: Radius.circular(4.0),
//                             ),
//                           ),
//                           focusedErrorBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Color(0x00000000),
//                               width: 1,
//                             ),
//                             borderRadius: const BorderRadius.only(
//                               topLeft: Radius.circular(4.0),
//                               topRight: Radius.circular(4.0),
//                             ),
//                           ),
//                         ),
//                         style: FlutterFlowTheme.of(context).bodyText1.override(
//                               fontFamily: 'Poppins',
//                               color: FlutterFlowTheme.of(context).primaryColor,
//                               fontSize: 12,
//                               fontWeight: FontWeight.normal,
//                             ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Padding(
//                         padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
//                         child: Text(
//                           'Select a Product Category',
//                           textAlign: TextAlign.start,
//                           style:
//                               FlutterFlowTheme.of(context).bodyText1.override(
//                                     fontFamily: 'Poppins',
//                                     color: Color(0xFF101817),
//                                     fontWeight: FontWeight.normal,
//                                   ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsetsDirectional.fromSTEB(15, 5, 0, 0),
//                   child: Container(
//                     width: 350,
//                     height: 40,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(8),
//                       border: Border.all(
//                         color: Color(0xFFDBE2E7),
//                         width: 2,
//                       ),
//                     ),
//                     child: FlutterFlowDropDown(
//                       options: ['Option 1'],
//                       onChanged: (val) => setState(() => dropDownValue5 = val),
//                       width: 180,
//                       height: 50,
//                       textStyle:
//                           FlutterFlowTheme.of(context).bodyText1.override(
//                                 fontFamily: 'Poppins',
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.w300,
//                               ),
//                       hintText: 'Please select...',
//                       fillColor: Colors.white,
//                       elevation: 2,
//                       borderColor: Colors.transparent,
//                       borderWidth: 0,
//                       borderRadius: 8,
//                       margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
//                       hidesUnderline: true,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
//                   child: Container(
//                     width: double.infinity,
//                     height: 40,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(8),
//                       border: Border.all(
//                         color: FlutterFlowTheme.of(context).secondaryBackground,
//                         width: 2,
//                       ),
//                     ),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.max,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
//                           child: Text(
//                             'GST %',
//                             style: FlutterFlowTheme.of(context).bodyText1,
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(0, 10, 20, 0),
//                           child: Text(
//                             '18',
//                             style: FlutterFlowTheme.of(context).bodyText1,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
//                   child: Material(
//                     color: Colors.transparent,
//                     elevation: 1,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Container(
//                       width: 350,
//                       height: 40,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(12),
//                         border: Border.all(
//                           color: FlutterFlowTheme.of(context).primaryBackground,
//                           width: 1,
//                         ),
//                       ),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.max,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Padding(
//                             padding:
//                                 EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
//                             child: Icon(
//                               Icons.add_a_photo_sharp,
//                               color: FlutterFlowTheme.of(context).primaryColor,
//                               size: 20,
//                             ),
//                           ),
//                           Padding(
//                             padding:
//                                 EdgeInsetsDirectional.fromSTEB(10, 5, 0, 0),
//                             child: Text(
//                               'Upload Photos',
//                               style: FlutterFlowTheme.of(context)
//                                   .bodyText1
//                                   .override(
//                                     fontFamily: 'Poppins',
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Padding(
//                         padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
//                         child: Image.asset(
//                           'assets/images/c79oz_R.jpg',
//                           width: 60,
//                           height: 60,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
//                         child: Image.asset(
//                           'assets/images/c79oz_R.jpg',
//                           width: 60,
//                           height: 60,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 10),
//                   child: FFButtonWidget(
//                     onPressed: () {
//                       print('Button pressed ...');
//                     },
//                     text: 'Send For Approval',
//                     options: FFButtonOptions(
//                       width: 330,
//                       height: 40,
//                       color: FlutterFlowTheme.of(context).primaryColor,
//                       textStyle:
//                           FlutterFlowTheme.of(context).subtitle2.override(
//                                 fontFamily: 'Poppins',
//                                 color: Colors.white,
//                                 fontSize: 14,
//                               ),
//                       elevation: 2,
//                       borderSide: BorderSide(
//                         color: Colors.transparent,
//                         width: 1,
//                       ),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
