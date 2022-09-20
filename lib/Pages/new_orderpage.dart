import 'dart:async';
import 'package:flutter_application_1/Constants/apiurls.dart';
import 'package:flutter_application_1/Handlers/LottieAnimation.dart';
import 'package:flutter_application_1/Handlers/NetworkHandler.dart';
import 'package:flutter_application_1/Pages/preparing_orderpage.dart';
import 'package:lottie/lottie.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';
import 'package:tuple/tuple.dart';
import '../Constants/exception_string.dart';
import '../Models/exception_model.dart';
import '../Others/utils.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import '../Models/order_infomodel.dart' as neworderinfomodel;
import '../Models/order_updatemodel.dart' as orderupdatemodel;

class NewOrderPage extends StatefulWidget {
  final String orderid;
  const NewOrderPage({Key? key, required this.orderid}) : super(key: key);

  @override
  _NewOrderPageState createState() => _NewOrderPageState();
}

class _NewOrderPageState extends State<NewOrderPage> {
  String totalamount = '';
  ValueNotifier<Tuple4> newOrderValueNotifier = ValueNotifier<Tuple4>(Tuple4(-1, exceptionFromJson(alert), "Null", null));
  ValueNotifier<Tuple4> orderUpdateValueNotifier = ValueNotifier<Tuple4>(Tuple4(-1, exceptionFromJson(alert), "Null", null));
  ValueNotifier<Tuple4> orderDelayValueNotifier = ValueNotifier<Tuple4>(Tuple4(-1, exceptionFromJson(alert), "Null", null));

  //NewOrder API
  Future newOrderInfo() async {
    return await ApiHandler().apiHandler(
        valueNotifier: newOrderValueNotifier,
        jsonModel: neworderinfomodel.orderInfoModelFromJson,
        url: '$neworderinfourl?route=store/order/info&order_id=${widget.orderid}&language_id=1',
        headers: {"Store-Authorization": "WEhnQytzeWI4c3VHVzZFTjVPNjh1QT09..8"},
        requestMethod: 0);
  }

  //Order Update-status Api
  Future orderUpdateApi({required String statusid, required String comment}) async {
    return await ApiHandler().apiHandler(
      valueNotifier: orderUpdateValueNotifier,
      jsonModel: orderupdatemodel.orderUpdateModelFromJson,
      url: '$orderupdateurl?route=store/order/update_status',
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

  @override
  void initState() {
    newOrderInfo();
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
          'New Order',
          style: FlutterFlowTheme.of(context).bodyText1,
        ),
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      //body:
      body: SafeArea(
        child: AnimatedBuilder(
            animation: Listenable.merge([newOrderValueNotifier]),
            builder: (context, _) {
              if (newOrderValueNotifier.value.item1 == 1) {
                if (mounted) {
                  var temp = 0.0;
                  for (int i = 0; i < newOrderValueNotifier.value.item2.info.products.length; i++) {
                    temp += double.parse(newOrderValueNotifier.value.item2.info.products[i].total.substring(2));
                  }
                  totalamount = temp.toString();
                }
                return RefreshIndicator(
                  onRefresh: () async => await newOrderInfo(),
                  child: GestureDetector(
                    onTap: () => FocusScope.of(context).unfocus(),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 0, right: 40, bottom: 10, left: 0),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                height: 50,
                                width: 100,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                                    primary: const Color(0xFFFF6666),
                                  ),
                                  /*
                         onPressed: ()async{
                        return await Orderupdate(neworderValueNotifier.value.item2.orderStatusId,neworderValueNotifier.value.item2.info.histories.last.comment).then((value) {
                        if(orderupdateValueNotifier.value.item1==1){
                        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=> PrepaingOrderPage(orderid: widget.orderid,)));
                        }else{
                         print('failed');
                        }
                       });
                       },
                         */
                                  onPressed: () async {
                                    return await orderUpdateApi(
                                      statusid: orderStatuses.inverse["Declined"].toString(),
                                      comment: "",
                                    ).whenComplete(() {
                                      if (orderUpdateValueNotifier.value.item1 == 1) {
                                        Navigator.pop(context, true);
                                      } else {
                                        print('failed');
                                      }
                                    });
                                  },
                                  child: const Text("Decline", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white)),
                                ),
                              ),
                            ),
                          ),

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
                                  mainAxisSize: MainAxisSize.max,
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
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            newOrderValueNotifier.value.item2.info.firstname.toString(),
                                            style: const TextStyle(fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            newOrderValueNotifier.value.item2.info.dateAdded.toString(),
                                            style: const TextStyle(fontSize: 12, fontFamily: 'Poppins', fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                    ),
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
                                    Text('S.N', style: TextStyle(fontSize: 12, fontFamily: 'Poppins', fontWeight: FontWeight.bold)),
                                    Text('Product Name', style: TextStyle(fontSize: 12, fontFamily: 'Poppins', fontWeight: FontWeight.bold)),
                                    Text('Qty', style: TextStyle(fontSize: 12, fontFamily: 'Poppins', fontWeight: FontWeight.bold)),
                                    Text('Price', style: TextStyle(fontSize: 12, fontFamily: 'Poppins', fontWeight: FontWeight.bold)),
                                    Text('GST', style: TextStyle(fontSize: 12, fontFamily: 'Poppins', fontWeight: FontWeight.bold)),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                      child: Text('Total', style: TextStyle(fontSize: 12, fontFamily: 'Poppins', fontWeight: FontWeight.bold)),
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
                                  itemCount: newOrderValueNotifier.value.item2.info.products.length,
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
                                              newOrderValueNotifier.value.item2.info.products[index].name,
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
                                              newOrderValueNotifier.value.item2.info.products[index].quantity,
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
                                              newOrderValueNotifier.value.item2.info.products[index].price.toString(),
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
                                            newOrderValueNotifier.value.item2.info.products[index].total.toString(),
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
                                                newOrderValueNotifier.value.item2.info.status.toString(),
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

                          //Accept Button
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
                            child: ConfirmationSlider(
                              height: 64.0,
                              width: 300.0,
                              backgroundColor: const Color.fromARGB(255, 245, 244, 244),
                              backgroundShape: BorderRadius.circular(10),
                              foregroundColor: const Color(0xFFFFA000),
                              onConfirmation: () async {
                                return await orderUpdateApi(
                                  statusid: orderStatuses.inverse["Preparing"].toString(),
                                  comment: "",
                                ).whenComplete(() {
                                  if (orderUpdateValueNotifier.value.item1 == 1) {
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PrepaingOrderPage(orderid: widget.orderid)));
                                  } else {
                                    print('failed');
                                  }
                                });
                              },
                              text: "Slide to Accept",
                              textStyle: const TextStyle(color: Colors.black),
                            ),
                          ),
                          //   Padding(
                          //   padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                          //   child: Container(
                          //   height: 50,
                          //   width: double.infinity,
                          //   decoration: const BoxDecoration(
                          //   borderRadius: BorderRadius.all(Radius.circular(10)),
                          //   ),
                          //   child: ElevatedButton(
                          //     style: ElevatedButton.styleFrom(
                          //       shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                          //       primary:  const Color(0xFFFFA000),
                          //   ),
                          //     onPressed: ()async{
                          //     return await Orderupdate(neworderValueNotifier.value.item2.orderStatusId,neworderValueNotifier.value.item2.info.histories.last.comment).then((value) {
                          //       if(orderupdateValueNotifier.value.item1==1){
                          //       Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>PrepaingOrderPage(orderid: widget.orderid)));
                          //       }else{
                          //        print('failed');
                          //       }
                          //     });
                          //     },
                          //     child: const Text("Accept",
                          //     style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),
                          //   ),
                          //   ),
                          // ),
                          const SizedBox(height: 10),
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
                        future: lottieComposition(newOrderValueNotifier.value.item2!.lottieString.toString()),
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
                  ],
                ));
              }
            }),
      ),
    );
  }
}
