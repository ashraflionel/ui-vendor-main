import 'dart:developer';

import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:flutter_application_1/Constants/apiurls.dart';
import 'package:flutter_application_1/Handlers/LottieAnimation.dart';
import 'package:flutter_application_1/Handlers/NetworkHandler.dart';
import 'package:flutter_application_1/Models/exception_model.dart';
import 'package:flutter_application_1/Others/utils.dart';
import 'package:flutter_application_1/Pages/ReadyOrderPage.dart';
import 'package:flutter_application_1/Pages/cancelorderpage.dart';
import 'package:lottie/lottie.dart';
import 'package:tuple/tuple.dart';
import '../Constants/exception_string.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import '../Models/order_infomodel.dart' as orderInfoModel;
import '../Models/cancel_reason.dart' as cancelordermodel;
import '../Models/order_updatemodel.dart' as orderupdatemodel;
import '../Models/default_model.dart' as defaultModel;

class PrepaingOrderPage extends StatefulWidget {
  final String orderid;
  const PrepaingOrderPage({Key? key, required this.orderid}) : super(key: key);
  @override
  _PrepaingOrderPageState createState() => _PrepaingOrderPageState();
}

class _PrepaingOrderPageState extends State<PrepaingOrderPage> {
  List<String> reportList = [
    "10 Mins",
    "20 Mins",
    "30 Mins",
  ];

  List<StepperData> stepperData = [];

  List<String> selectedReportList = [];

  showReportDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          //Here we will build the content of the dialog
          return AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text("Delay Time"),
                SizedBox(width: 100),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      size: 18,
                      color: Colors.black,
                    ))
              ],
            ),
            content: MultiSelectChip(
              reportList,
              onSelectionChanged: (selectedList) {
                setState(() {
                  selectedReportList = selectedList;
                });
              },
              maxSelection: 1,
            ),
            actions: <Widget>[
              Container(
                height: 40,
                width: 100,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    primary: const Color(0xFFFFA000),
                  ),
                  onPressed: () async {
                    return await orderUpdateDelayApi(delay: selectedReportList[0], orderId: preparingOrderValueNotifier.value.item2.orderStatusId).then((value) async {
                      Navigator.pop(context);
                      await preparingOrderAPI();
                    });
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(fontSize: 15, fontFamily: 'Poppins', fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ],
          );
        });
  }

  ValueNotifier<Tuple4> cancelordervalueNotifier = ValueNotifier<Tuple4>(Tuple4(-1, exceptionFromJson(alert), "Null", null));
  ValueNotifier<Tuple4> orderUpdateValueNotifier = ValueNotifier<Tuple4>(Tuple4(-1, exceptionFromJson(alert), "Null", null));
  ValueNotifier<Tuple4> orderUpdateDelayValueNotifier = ValueNotifier<Tuple4>(Tuple4(-1, exceptionFromJson(alert), "Null", null));

  Future orderUpdateDelayApi({required String delay, required String orderId}) async {
    return await ApiHandler().apiHandler(
        valueNotifier: orderUpdateDelayValueNotifier,
        jsonModel: defaultModel.defaultFromJson,
        url: '$ip?route=store/order/update_delay',
        headers: {"Store-Authorization": "WEhnQytzeWI4c3VHVzZFTjVPNjh1QT09..8"},
        requestMethod: 1,
        body: {
          "delay": delay,
          "order_id": orderId,
          "language_id": "1",
        });
  }

//CancelOrderReason Api:
  Future cancelOrderReason() async {
    return await ApiHandler().apiHandler(
      valueNotifier: cancelordervalueNotifier,
      jsonModel: cancelordermodel.cancelReasonFromJson,
      url: '$ip?route=store/local/cancel_reason&language_id=1',
      requestMethod: 0,
    );
  }

  //Order Update-status Api
  Future orderUpdateApi({required String statusid, required String comment}) async {
    return await ApiHandler().apiHandler(
      valueNotifier: orderUpdateValueNotifier,
      jsonModel: orderupdatemodel.orderUpdateModelFromJson,
      url: '$ip?route=store/order/update_status',
      requestMethod: 1,
      headers: {"Store-Authorization": "WEhnQytzeWI4c3VHVzZFTjVPNjh1QT09..8"},
      body: {
        "order_id": widget.orderid,
        "order_status_id": statusid,
        "comment": comment,
        "notify": "true",
        "language_id": "1",
      },
    );
  }

  dynamic _chosenValue;
  void _showDecline() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Cancel Order"),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.close)),
                ],
              ),
              content: SizedBox(
                height: 100,
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text("Reason For Cancellation"),
                    DropdownButton<String>(
                      hint: const Text('Select one option'),
                      value: _chosenValue,
                      underline: Container(),
                      items: List<String>.generate(cancelordervalueNotifier.value.item2.reasons.length, (index) => cancelordervalueNotifier.value.item2.reasons[index].reason)
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                        );
                      }).toList(),
                      onChanged: (dynamic value) {
                        setState(() {
                          _chosenValue = value;
                        });
                      },
                    )
                  ],
                ),
              ),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                Container(
                  height: 50,
                  width: 100,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                      primary: const Color(0xFFFFA000),
                    ),
                    onPressed: () async {
                      return await orderUpdateApi(statusid: orderStatuses.inverse["Cancelled"].toString(), comment: _chosenValue.toString()).then((value) {
                        if (orderUpdateValueNotifier.value.item1 == 1) {
                          Navigator.of(context).popUntil((route) => route.isFirst);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CancelOrderPage(orderid: widget.orderid)));
                        } else {
                          log(orderUpdateValueNotifier.value.item3);
                        }
                      });
                    },
                    child: const Text(
                      "Confirm",
                      style: TextStyle(fontSize: 15, fontFamily: 'Poppins', fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  //  void _showdelaytime() {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return StatefulBuilder(
  //         builder: (BuildContext context, StateSetter setState){
  //           return AlertDialog(
  //           title: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               const Text("Delay"),
  //               IconButton(onPressed: (){
  //                 Navigator.of(context).pop();
  //               },
  //               icon: const Icon(Icons.close)),
  //             ],
  //           ),
  //             content: SizedBox(
  //             height: 100,
  //             width: 300,
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: <Widget>[
  //                const Text("Delay Time"),
  //               const SizedBox(height: 05),

  //               ],
  //             ),
  //           ),
  //           actions: <Widget>[
  //             // usually buttons at the bottom of the dialog
  //             Container(
  //             height: 50,
  //             width:100,
  //             decoration: const BoxDecoration(
  //               borderRadius: BorderRadius.all(Radius.circular(25)),
  //             ),
  //             child: ElevatedButton(
  //             style: ElevatedButton.styleFrom(
  //             shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
  //             primary: const Color(0xFFFFA000),
  //             ),
  //               onPressed: (){

  //               },
  //             child: const Text("Confirm",
  //             style: TextStyle(fontSize: 15,fontFamily: 'Poppins',fontWeight: FontWeight.bold,color: Colors.white),),
  //             ),
  //           ),
  //           ],
  //         );
  //         },
  //       );
  //     },
  //   );
  // }

  String totalamount = '';
  int currentStep = 0;
  ValueNotifier<Tuple4> preparingOrderValueNotifier = ValueNotifier<Tuple4>(Tuple4(-1, exceptionFromJson(alert), "Null", null));

  Future preparingOrderAPI() async {
    return await ApiHandler().apiHandler(
        valueNotifier: preparingOrderValueNotifier,
        jsonModel: orderInfoModel.orderInfoModelFromJson,
        url: '$ip?route=store/order/info&order_id=${widget.orderid}&language_id=1',
        headers: {"Store-Authorization": "WEhnQytzeWI4c3VHVzZFTjVPNjh1QT09..8"},
        requestMethod: 0);
  }

  @override
  void initState() {
    preparingOrderAPI();
    cancelOrderReason();
    super.initState();
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        iconTheme: const IconThemeData(color: Color(0xFF020000)),
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 24,
          ),
        ),
        title: Text(
          'Preparing Order',
          style: FlutterFlowTheme.of(context).bodyText1,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: AnimatedBuilder(
            animation: Listenable.merge([preparingOrderValueNotifier]),
            builder: (context, _) {
              if (preparingOrderValueNotifier.value.item1 == 1 && cancelordervalueNotifier.value.item1 == 1) {
                if (mounted) {
                  var temp = 0.0;
                  for (int i = 0; i < preparingOrderValueNotifier.value.item2.info.products.length; i++) {
                    temp += double.parse(preparingOrderValueNotifier.value.item2.info.products[i].total.substring(2));
                  }
                  totalamount = temp.toString();
                  stepperData = List<StepperData>.generate(
                    preparingOrderValueNotifier.value.item2.info.histories.length,
                    (index) => StepperData(
                      title: preparingOrderValueNotifier.value.item2.info.histories[index].status,
                      subtitle: preparingOrderValueNotifier.value.item2.info.histories[index].dateAdded,
                    ),
                  );
                }
                return RefreshIndicator(
                  onRefresh: () async => await preparingOrderAPI(),
                  child: GestureDetector(
                    onTap: () => FocusScope.of(context).unfocus(),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: Container(
                              width: 350,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 60,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.asset(
                                        'assets/images/logo_kcs.jpg',
                                      ),
                                    ),
                                    const SizedBox(width: 25),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            preparingOrderValueNotifier.value.item2.info.firstname.toString(),
                                            style: const TextStyle(fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            preparingOrderValueNotifier.value.item2.info.dateAdded.toString(),
                                            style: const TextStyle(fontSize: 12, fontFamily: 'Poppins', fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 75),
                                    Text(
                                      'Order id:${widget.orderid}',
                                      style: const TextStyle(fontSize: 12, color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: const [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                  child: Text(
                                    'Item List',
                                    style: TextStyle(fontSize: 15, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(10, 5, 10, 0),
                            child: Container(
                              width: 350,
                              height: 40,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0),
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 25, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      'S.N',
                                      style: TextStyle(fontSize: 12, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
                                    ),
                                    Text('Product Name', style: TextStyle(fontSize: 12, fontFamily: 'Poppins', fontWeight: FontWeight.bold)),
                                    Text(
                                      'Qty',
                                      style: TextStyle(fontSize: 12, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Price',
                                      style: TextStyle(fontSize: 12, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'GST',
                                      style: TextStyle(fontSize: 12, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                      child: Text(
                                        'Total',
                                        style: TextStyle(fontSize: 12, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                            child: Container(
                              width: 350,
                              height: 100,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                  topLeft: Radius.circular(0),
                                  topRight: Radius.circular(0),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: preparingOrderValueNotifier.value.item2.info.products.length,
                                  itemBuilder: (context, index) {
                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 30,
                                          height: 20,
                                          decoration: const BoxDecoration(),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                            child: Text(
                                              (index + 1).toString(),
                                              style: const TextStyle(fontSize: 11, fontFamily: 'Poppins', fontWeight: FontWeight.normal),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 110,
                                          height: 20,
                                          decoration: const BoxDecoration(),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                            child: Text(
                                              preparingOrderValueNotifier.value.item2.info.products[index].name,
                                              //neworderValueNotifier.value.item2.Product.name.toString(),
                                              //Product
                                              style: const TextStyle(fontSize: 11, fontFamily: 'Poppins', fontWeight: FontWeight.normal),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 40,
                                          height: 20,
                                          decoration: const BoxDecoration(),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                            child: Text(
                                              preparingOrderValueNotifier.value.item2.info.products[index].quantity,
                                              style: const TextStyle(fontSize: 11, fontFamily: 'Poppins', fontWeight: FontWeight.normal),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 50,
                                          height: 20,
                                          decoration: const BoxDecoration(),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                            child: Text(
                                              preparingOrderValueNotifier.value.item2.info.products[index].price.toString(),
                                              style: const TextStyle(fontSize: 11, fontFamily: 'Poppins', fontWeight: FontWeight.normal),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 50,
                                          height: 20,
                                          decoration: const BoxDecoration(),
                                          child: const Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                            child: Text(
                                              '₹20',
                                              style: TextStyle(fontSize: 11, fontFamily: 'Poppins', fontWeight: FontWeight.normal),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 60,
                                          height: 20,
                                          decoration: const BoxDecoration(),
                                          child: Text(
                                            preparingOrderValueNotifier.value.item2.info.products[index].total.toString(),
                                            style: const TextStyle(fontSize: 11, fontFamily: 'Poppins', fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(10, 5, 10, 0),
                            child: Container(
                              width: 350,
                              height: 40,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                  topLeft: Radius.circular(0),
                                  topRight: Radius.circular(0),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 25, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Total',
                                      style: TextStyle(fontSize: 12, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                      child: Text(
                                        '₹$totalamount',
                                        style: const TextStyle(fontSize: 11, fontFamily: 'Poppins'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                            child: Container(
                              width: 350,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                                      child: Text(
                                        'Earnings',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(fontSize: 12, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 25, 0),
                                      child: Text(
                                        '₹300',
                                        style: TextStyle(fontSize: 12, fontFamily: 'Poppins'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Order Status',
                                        style: FlutterFlowTheme.of(context).bodyText1,
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 5),
                                        child: GestureDetector(
                                          onTap: () {
                                            print("New Order");
                                          },
                                          child: Container(
                                            width: 90,
                                            height: 25,
                                            decoration: BoxDecoration(
                                              color: const Color(0x6AFFA000),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                              child: Text(
                                                //PreparingorderValueNotifier.value.item2.orderStatuses.last.name.toString(),
                                                preparingOrderValueNotifier.value.item2.info.status.toString(),
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(fontSize: 12, fontFamily: 'Poppins'),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(20, 15, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Driver Status',
                                        style: FlutterFlowTheme.of(context).bodyText1,
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 5),
                                        child: GestureDetector(
                                          onTap: () {
                                            print("Alloted");
                                          },
                                          child: Container(
                                            width: 90,
                                            height: 25,
                                            decoration: BoxDecoration(
                                              color: const Color(0x8479E4FC),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                              child: Text(
                                                "Alloted",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontSize: 12, fontFamily: 'Poppins'),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          (preparingOrderValueNotifier.value.item2.info.driverInfo.isNotEmpty)
                              ? Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    height: 150,
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(15)),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Center(
                                          child: Padding(
                                            padding: EdgeInsets.only(bottom: 50),
                                            child: CircleAvatar(
                                              backgroundColor: Colors.white,
                                              radius: 30,
                                              child: Image.asset(
                                                'assets/images/profile.png',
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 05),
                                        Center(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(bottom: 02, top: 10),
                                                child: Text(
                                                  "Driver Details",
                                                  style: TextStyle(fontSize: 14, color: Colors.black54),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(bottom: 02),
                                                child: Text(
                                                  preparingOrderValueNotifier.value.item2.info.driverInfo[0].name,
                                                  style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(bottom: 10),
                                                child: Text(
                                                  "ID: ${preparingOrderValueNotifier.value.item2.info.driverInfo[0].driverId}",
                                                  style: TextStyle(fontSize: 14, color: Colors.black87),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(bottom: 04),
                                                child: Text(
                                                  "Vehicle Type : Bike",
                                                  style: TextStyle(fontSize: 14, color: Colors.black87),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(bottom: 04),
                                                child: Text(
                                                  "Vehicle Number: GA07 M 8989",
                                                  style: TextStyle(fontSize: 14, color: Colors.black87),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 55),
                                          child: CircleAvatar(
                                            backgroundColor: Color.fromARGB(255, 255, 218, 163),
                                            child: Icon(
                                              Icons.call,
                                              color: Colors.orange,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : Text("No Driver Alloted"),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: AnotherStepper(
                              scrollPhysics: NeverScrollableScrollPhysics(),
                              stepperList: stepperData,
                              stepperDirection: Axis.vertical,
                              horizontalStepperHeight: 30,
                              dotWidget: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: const BoxDecoration(color: Color(0xFFFFA000), borderRadius: BorderRadius.all(Radius.circular(30))),
                                child: const Icon(Icons.delivery_dining_outlined, color: Colors.white),
                              ),
                              activeBarColor: const Color(0xFFFFA000),
                              inActiveBarColor: Colors.grey,
                              activeIndex: 1,
                              barThickness: 3,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 50,
                                width: 100,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(25)),
                                ),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                                    primary: const Color.fromARGB(255, 247, 112, 59),
                                  ),
                                  onPressed: () {
                                    _showDecline();
                                  },
                                  child: const Text(
                                    "Cancel",
                                    style: TextStyle(fontSize: 15, fontFamily: 'Poppins', fontWeight: FontWeight.bold, color: Colors.white),
                                  ),
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 100,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(25)),
                                ),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                                    primary: const Color(0xFFFFA000),
                                  ),
                                  onPressed: () {
                                    showReportDialog();
                                  },
                                  child: const Text(
                                    "Delayed",
                                    style: TextStyle(fontSize: 15, fontFamily: 'Poppins', fontWeight: FontWeight.bold, color: Colors.white),
                                  ),
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 100,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(25)),
                                ),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                                    primary: const Color.fromARGB(255, 59, 241, 168),
                                  ),
                                  onPressed: () async {
                                    return await orderUpdateApi(statusid: orderStatuses.inverse["Ready"].toString(), comment: _chosenValue.toString()).then((value) {
                                      if (orderUpdateValueNotifier.value.item1 == 1) {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => ReadyOrderPage(
                                                      orderid: preparingOrderValueNotifier.value.item2.orderStatusId,
                                                    )));
                                      } else {
                                        log(orderUpdateValueNotifier.value.item3);
                                      }
                                    });
                                  },
                                  child: const Text(
                                    "Ready",
                                    style: TextStyle(fontSize: 15, fontFamily: 'Poppins', fontWeight: FontWeight.bold, color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 25),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FutureBuilder(
                        future: lottieComposition(preparingOrderValueNotifier.value.item2!.lottieString.toString()),
                        builder: (context, AsyncSnapshot<LottieComposition> snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                            return Lottie(
                              width: MediaQuery.of(context).size.width / 2,
                              composition: snapshot.data,
                              repeat: true,
                            );
                          } else {
                            return Container();
                          }
                        }),
                    // Text(dashboardValueNotifier.value.item3.toString())
                  ],
                ));
              }
            }),
      ),
    );
  }
}

class MultiSelectChip extends StatefulWidget {
  final List<String> reportList;
  final Function(List<String>)? onSelectionChanged;
  final Function(List<String>)? onMaxSelected;
  final int? maxSelection;

  MultiSelectChip(this.reportList, {this.onSelectionChanged, this.onMaxSelected, this.maxSelection});

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  // String selectedChoice = "";
  List<String> selectedChoices = [];

  _buildChoiceList() {
    List<Widget> choices = [];

    widget.reportList.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Text(item),
          selected: selectedChoices.contains(item),
          onSelected: (selected) {
            if (selectedChoices.length == (widget.maxSelection ?? -1) && !selectedChoices.contains(item)) {
              widget.onMaxSelected?.call(selectedChoices);
            } else {
              setState(() {
                selectedChoices.contains(item) ? selectedChoices.remove(item) : selectedChoices.add(item);
                widget.onSelectionChanged?.call(selectedChoices);
              });
            }
          },
        ),
      ));
    });

    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}
