import 'dart:developer';

import 'package:flutter_application_1/Constants/apiurls.dart';
import 'package:flutter_application_1/Constants/exception_string.dart';
import 'package:flutter_application_1/Constants/lottie_String.dart';
import 'package:flutter_application_1/Handlers/FirebaseAutentication.dart';
import 'package:flutter_application_1/Handlers/LottieAnimation.dart';
import 'package:flutter_application_1/Handlers/NetworkHandler.dart';
import 'package:flutter_application_1/Models/exception_model.dart';
import 'package:flutter_application_1/Others/utils.dart';
import 'package:flutter_application_1/Pages/ReadyOrderPage.dart';
import 'package:flutter_application_1/Pages/cancelorderpage.dart';
import 'package:flutter_application_1/Pages/completeorder_page.dart';
import 'package:flutter_application_1/Pages/new_orderpage.dart';
import 'package:flutter_application_1/Pages/preparing_orderpage.dart';
import 'package:lottie/lottie.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';
import '../Models/homedashboard_model.dart' as dashboardmodel;
import "../Models/order_infomodel.dart" as orderInfoModel;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> choicechipvalue = ['All', 'New', 'Delayed', 'Ready', 'Preparing'];
  int choosechipvalue = 0;
  bool? switchListTileValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  ValueNotifier<Tuple4> orderInfoValueNotifier = ValueNotifier<Tuple4>(Tuple4(-1, exceptionFromJson(alert), "Null", null));

  ValueNotifier<Tuple4> dashboardValueNotifier = ValueNotifier<Tuple4>(Tuple4(-1, exceptionFromJson(alert), "Null", null));

  Future getDashboard() async {
    return await ApiHandler().apiHandler(
        valueNotifier: dashboardValueNotifier,
        jsonModel: dashboardmodel.homeDashboardModelFromJson,
        url: '$homedashboardurl?route=store/store/dashboard&filter_order_status=$choosechipvalue&language_id=1',
        headers: {"Store-Authorization": "WEhnQytzeWI4c3VHVzZFTjVPNjh1QT09..8"},
        requestMethod: 0);
  }

  Future orderInfo({required String orderid}) async {
    return await ApiHandler().apiHandler(
        valueNotifier: orderInfoValueNotifier,
        jsonModel: orderInfoModel.orderInfoModelFromJson,
        url: '$neworderinfourl?route=store/order/info&order_id=$orderid&language_id=1',
        headers: {"Store-Authorization": "WEhnQytzeWI4c3VHVzZFTjVPNjh1QT09..8"},
        requestMethod: 0);
  }

  @override
  void initState() {
    getDashboard();
    super.initState();
  }

  pressEvent(String status, String orderid) {
    switch (status) {
      case "New Order":
        {
          Navigator.push(context, MaterialPageRoute(builder: (context) => NewOrderPage(orderid: orderid))).then((value) async {
            // if (value == true) {
            // return await getDashboard();
            // }
          });
        }
        break;

      case "Preparing":
        {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PrepaingOrderPage(
                        orderid: orderid,
                      ))).then((value) async {
            // if (value == true) {
            // return await getDashboard();
            // }
          });
        }
        break;
      case "Dispatched":
        {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CompleteOrderPage(
                        orderid: orderid,
                      ))).then((value) async {
            // if (value == true) {
            // return await getDashboard();
            // }
          });
        }
        break;
      case "Ready":
        {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ReadyOrderPage(
                        orderid: orderid,
                      ))).then((value) async {
            // if (value == true) {
            // return await getDashboard();
            // }
          });
        }
        break;

      case "Cancelled":
        {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CancelOrderPage(orderid: orderid)));
        }
        break;
      default:
        {
          log(status);
          log(orderid);
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        //AppBar
        child: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          iconTheme: const IconThemeData(color: Color(0xFF020000)),
          automaticallyImplyLeading: true,
          title: const Text(
            'Playwood Store',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
          ),
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
                  icon: const Icon(
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
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 05, top: 25),
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset('assets/images/logo_kcs.jpg'),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Plywood Store', style: TextStyle(fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.bold)),
                          const SizedBox(height: 03),
                          const Text('plywood@gmail.com', style: TextStyle(fontSize: 12, fontFamily: 'Poppins')),
                          const SizedBox(height: 02),
                          const Text('9884857261', style: TextStyle(fontSize: 12, fontFamily: 'Poppins')),
                          Container(
                            width: 200,
                            decoration: const BoxDecoration(),
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
                title: const Text('Recieve Orders', style: TextStyle(fontSize: 12, fontFamily: 'Poppins')),
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
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                    child: ListTile(
                      leading: Icon(Icons.settings_outlined, color: FlutterFlowTheme.of(context).lineColor),
                      title: const Text('Settings', style: TextStyle(fontSize: 12, fontFamily: 'Poppins')),
                      trailing: const Icon(
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
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
                    child: ListTile(
                      leading: Icon(
                        Icons.home,
                        color: FlutterFlowTheme.of(context).lineColor,
                        size: 20,
                      ),
                      title: const Text(
                        'Home',
                        style: TextStyle(fontSize: 12, fontFamily: 'Poppins'),
                      ),
                      trailing: const Icon(
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
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
                    child: ListTile(
                      leading: Icon(
                        Icons.menu_book_sharp,
                        color: FlutterFlowTheme.of(context).lineColor,
                      ),
                      title: const Text(
                        'Item Menu',
                        style: TextStyle(fontSize: 12, fontFamily: 'Poppins'),
                      ),
                      trailing: const Icon(
                        Icons.arrow_right,
                        color: Color(0xFF303030),
                        size: 20,
                      ),
                      tileColor: Colors.white,
                      dense: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
                    child: ListTile(
                      leading: Icon(
                        Icons.list_alt,
                        color: FlutterFlowTheme.of(context).lineColor,
                      ),
                      title: const Text(
                        'My Orders',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_right,
                        color: Color(0xFF303030),
                        size: 20,
                      ),
                      tileColor: Colors.white,
                      dense: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
                    child: ListTile(
                      leading: Icon(
                        Icons.favorite_border,
                        color: FlutterFlowTheme.of(context).lineColor,
                      ),
                      title: const Text(
                        'Most Purchased items',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_right,
                        color: Color(0xFF303030),
                        size: 20,
                      ),
                      tileColor: Colors.white,
                      dense: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
                    child: ListTile(
                      leading: Icon(
                        Icons.credit_card,
                        color: FlutterFlowTheme.of(context).lineColor,
                      ),
                      title: const Text('Payouts & Finances', style: TextStyle(fontSize: 12, fontFamily: 'Poppins')),
                      trailing: const Icon(
                        Icons.arrow_right,
                        color: Color(0xFF303030),
                        size: 20,
                      ),
                      tileColor: Colors.white,
                      dense: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
                    child: ListTile(
                      leading: Icon(Icons.message_outlined, color: FlutterFlowTheme.of(context).lineColor),
                      title: const Text('Requests', style: TextStyle(fontSize: 12, fontFamily: 'Poppins')),
                      trailing: const Icon(
                        Icons.arrow_right,
                        color: Color(0xFF303030),
                        size: 20,
                      ),
                      tileColor: Colors.white,
                      dense: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
                    child: GestureDetector(
                      onTap: () async {
                        await signOut();
                        print("Signout");
                      },
                      child: ListTile(
                        leading: Icon(
                          Icons.logout,
                          color: FlutterFlowTheme.of(context).lineColor,
                        ),
                        title: const Text('Logout', style: TextStyle(fontSize: 12, fontFamily: 'Poppins')),
                        trailing: const Icon(
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

      //body:
      body: SafeArea(
        child: AnimatedBuilder(
            animation: Listenable.merge([dashboardValueNotifier]),
            builder: (context, _) {
              if (dashboardValueNotifier.value.item1 == 1) {
                return RefreshIndicator(
                  onRefresh: () async => await getDashboard(),
                  child: GestureDetector(
                    onTap: () => FocusScope.of(context).unfocus(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: choicechipvalue.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                      onTap: () async {
                                        print(index);
                                        if (!mounted) return;
                                        setState(() {
                                          choosechipvalue = index;
                                        });
                                        await getDashboard();
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.all(4),
                                        child: Center(
                                          child: Chip(
                                            backgroundColor: choosechipvalue == index ? const Color(0xFFFFA000) : const Color.fromARGB(255, 213, 209, 209),
                                            label: Text(
                                              choicechipvalue[index],
                                            ),
                                            padding: const EdgeInsets.all(10.0),
                                          ),
                                        ),
                                      ));
                                }),
                          ),
                        ),
                        (dashboardValueNotifier.value.item2.orders.isNotEmpty)
                            ? Expanded(
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: dashboardValueNotifier.value.item2.orders.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        // onTap: () {
                                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>NewOrderPage(orderid: dashboardValueNotifier.value.item2.orders[index].orderId,)));
                                        // },
                                        onTap: () async {
                                          return await orderInfo(orderid: dashboardValueNotifier.value.item2.orders[index].orderId).then((value) {
                                            if (orderInfoValueNotifier.value.item1 == 1) {
                                              pressEvent(orderStatuses[int.parse(orderInfoValueNotifier.value.item2.orderStatusId)]!,
                                                  dashboardValueNotifier.value.item2.orders[index].orderId);
                                            } else {
                                              log(orderInfoValueNotifier.value.item3);
                                            }
                                          });
                                        },
                                        child: Container(
                                          width: MediaQuery.of(context).size.width * 0.92,
                                          height: 180,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding: const EdgeInsetsDirectional.fromSTEB(12, 10, 0, 0),
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.max,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize: MainAxisSize.max,
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Text(
                                                              dashboardValueNotifier.value.item2.orders[index].customer.toString(),
                                                              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, fontFamily: 'Poppins'),
                                                            ),
                                                            Column(
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets.only(right: 05),
                                                                  child: Text("Order id:${dashboardValueNotifier.value.item2.orders[index].orderId.toString()}"),
                                                                ),
                                                                const SizedBox(height: 05),
                                                                Container(
                                                                  width: 90,
                                                                  height: 25,
                                                                  decoration: BoxDecoration(
                                                                    color: const Color(0x7EC5F5C5),
                                                                    borderRadius: BorderRadius.circular(12),
                                                                  ),
                                                                  child: Padding(
                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                    child: Text(dashboardValueNotifier.value.item2.orders[index].status.toString(),
                                                                        textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, fontFamily: 'Poppins')),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        Text(dashboardValueNotifier.value.item2.orders[index].dateModified.toString(),
                                                            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300, fontFamily: 'Poppins')),
                                                        Row(
                                                          mainAxisSize: MainAxisSize.max,
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Row(
                                                              mainAxisSize: MainAxisSize.max,
                                                              children: const [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                  child: Text(
                                                                    'DD ETA :',
                                                                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300, fontFamily: 'Poppins'),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional.fromSTEB(5, 5, 0, 0),
                                                                  child: Text(
                                                                    '10 Min',
                                                                    style: TextStyle(fontSize: 14, fontFamily: 'Poppins'),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                                                          child: Row(
                                                            mainAxisSize: MainAxisSize.max,
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Column(
                                                                mainAxisSize: MainAxisSize.max,
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  const Padding(
                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                    child: Text('status', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300, fontFamily: 'Poppins')),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                    child: Text(
                                                                      dashboardValueNotifier.value.item2.orders[index].status.toString(),
                                                                      style: const TextStyle(
                                                                        fontSize: 14,
                                                                        fontFamily: 'Poppins',
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Image.asset(
                                                                'assets/images/5QIOUZ.webp',
                                                                width: 1,
                                                                height: 30,
                                                                fit: BoxFit.cover,
                                                              ),
                                                              Column(
                                                                mainAxisSize: MainAxisSize.max,
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  const Padding(
                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                    child: Text(
                                                                      'Order ID',
                                                                      style: TextStyle(
                                                                        fontSize: 13,
                                                                        fontWeight: FontWeight.w300,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 0, 0),
                                                                    child: Text(
                                                                      dashboardValueNotifier.value.item2.orders[index].orderId.toString(),
                                                                      style: const TextStyle(fontSize: 14, fontFamily: 'Poppins'),
                                                                    ),
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
                                                                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                                                child: Column(
                                                                  mainAxisSize: MainAxisSize.max,
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    const Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                      child: Text(
                                                                        'Earnings',
                                                                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 0, 0),
                                                                      child: Text(
                                                                        dashboardValueNotifier.value.item2.orders[index].total.toString(),
                                                                        style: const TextStyle(fontSize: 14, fontFamily: 'Poppins'),
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
                                      );
                                    }),
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 250),
                                  SizedBox(
                                    height: 100,
                                    width: 500,
                                    child: Lottie.asset(emptyTimelineLottie),
                                  ),
                                  const SizedBox(height: 25),
                                  const Center(
                                      child: Text(
                                    "Sorry !  No Data",
                                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black, fontFamily: 'Poppins'),
                                  )),
                                ],
                              )
                      ],
                    ),
                  ),
                );
              } else {
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FutureBuilder(
                        future: lottieComposition(dashboardValueNotifier.value.item2!.lottieString.toString()),
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
