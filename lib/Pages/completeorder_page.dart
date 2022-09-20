// ignore_for_file: library_private_types_in_public_api

import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:lottie/lottie.dart';
import 'package:tuple/tuple.dart';

import '../Constants/apiurls.dart';
import '../Constants/exception_string.dart';
import '../Handlers/LottieAnimation.dart';
import '../Handlers/NetworkHandler.dart';
import '../Models/exception_model.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import '../Models/order_infomodel.dart' as orderInfoModel;

class CompleteOrderPage extends StatefulWidget {
  final String orderid;

  const CompleteOrderPage({Key? key, required this.orderid}) : super(key: key);

  @override
  _CompleteOrderPageState createState() => _CompleteOrderPageState();
}

class _CompleteOrderPageState extends State<CompleteOrderPage> {
  List<StepperData> stepperData = [];
  ValueNotifier<Tuple4> readyOrderValueNotifier = ValueNotifier<Tuple4>(Tuple4(-1, exceptionFromJson(alert), "Null", null));
  String totalamount = '';

  Future readyOrderAPI() async {
    return await ApiHandler().apiHandler(
        valueNotifier: readyOrderValueNotifier,
        jsonModel: orderInfoModel.orderInfoModelFromJson,
        url: '$ip?route=store/order/info&order_id=${widget.orderid}&language_id=1',
        headers: {"Store-Authorization": "WEhnQytzeWI4c3VHVzZFTjVPNjh1QT09..8"},
        requestMethod: 0);
  }

  @override
  void initState() {
    readyOrderAPI();
    super.initState();
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      //AppBar
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
            size: 25,
          ),
        ),
        title: Text(
          'Complete Order',
          style: FlutterFlowTheme.of(context).bodyText1,
        ),
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,

      //Body
      body: SafeArea(
        child: AnimatedBuilder(
            animation: Listenable.merge([readyOrderValueNotifier]),
            builder: (context, _) {
              if (readyOrderValueNotifier.value.item1 == 1) {
                if (mounted) {
                  var temp = 0.0;
                  for (int i = 0; i < readyOrderValueNotifier.value.item2.info.products.length; i++) {
                    temp += double.parse(readyOrderValueNotifier.value.item2.info.products[i].total.substring(2));
                  }
                  totalamount = temp.toString();
                  stepperData = List<StepperData>.generate(
                    readyOrderValueNotifier.value.item2.info.histories.length,
                    (index) => StepperData(
                      title: readyOrderValueNotifier.value.item2.info.histories[index].status,
                      subtitle: readyOrderValueNotifier.value.item2.info.histories[index].dateAdded,
                    ),
                  );
                }
                return RefreshIndicator(
                  onRefresh: () async => await readyOrderAPI(),
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
                                  mainAxisSize: MainAxisSize.max,
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
                                      padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                readyOrderValueNotifier.value.item2.info.firstname.toString(),
                                                style: TextStyle(fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            readyOrderValueNotifier.value.item2.info.dateAdded.toString(),
                                            style: TextStyle(fontSize: 12, fontFamily: 'Poppins', fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Text(
                                      'Order id:${widget.orderid}',
                                      style: TextStyle(fontSize: 12, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                const Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                  child: Text(
                                    'Item List',
                                    style: TextStyle(fontSize: 15, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(width: 50),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                                  child: Container(
                                    height: 50,
                                    width: 180,
                                    decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(25))),
                                    child: OutlinedButton(
                                      onPressed: () {},
                                      // ignore: sort_child_properties_last
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: const [
                                          Icon(Icons.cloud_download_outlined, color: Colors.black),
                                          Text(
                                            'Download Bill',
                                            style: TextStyle(fontSize: 14, color: Colors.black),
                                          )
                                        ],
                                      ),
                                      style: OutlinedButton.styleFrom(
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                        side: const BorderSide(width: 1.0, color: Colors.black),
                                      ),
                                    ),
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
                                  itemCount: readyOrderValueNotifier.value.item2.info.products.length,
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
                                              readyOrderValueNotifier.value.item2.info.products[index].name,
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
                                              readyOrderValueNotifier.value.item2.info.products[index].quantity,
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
                                              readyOrderValueNotifier.value.item2.info.products[index].price.toString(),
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
                                            readyOrderValueNotifier.value.item2.info.products[index].total.toString(),
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
                                    Text(
                                      'Total',
                                      style: TextStyle(fontSize: 12, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                      child: Text(
                                        '₹$totalamount',
                                        style: TextStyle(fontSize: 11, fontFamily: 'Poppins'),
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
                                        'Return Status',
                                        style: FlutterFlowTheme.of(context).bodyText1,
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 5),
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                            width: 90,
                                            height: 25,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFFFA000),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                              child: Text(
                                                readyOrderValueNotifier.value.item2.info.status.toString(),
                                                //  neworderValueNotifier.value.item2.orderStatuses.name.toString(),
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontSize: 12, fontFamily: 'Poppins'),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          (readyOrderValueNotifier.value.item2.info.driverInfo.isNotEmpty)
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                  child: Container(
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
                                            padding: const EdgeInsets.only(bottom: 50),
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
                                                  child: Text("Driver Details", style: TextStyle(fontSize: 14, color: Colors.black54))),
                                              Padding(
                                                  padding: EdgeInsets.only(bottom: 02),
                                                  child: Text(readyOrderValueNotifier.value.item2.info.driverInfo[0].name,
                                                      style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold))),
                                              Padding(
                                                  padding: EdgeInsets.only(bottom: 10),
                                                  child: Text("ID: ${readyOrderValueNotifier.value.item2.info.driverInfo[0].driverId}",
                                                      style: TextStyle(fontSize: 14, color: Colors.black87))),
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
                          const SizedBox(height: 05),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(25)),
                              ),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                                  primary: Colors.white,
                                ),
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.cloud_upload_outlined, color: Color(0xFFFFA000)),
                                    SizedBox(width: 15),
                                    Text(
                                      "Uploaded Image",
                                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 05),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 4,
                                  itemBuilder: (BuildContext context,int index)
                                  {
                                    return _buildImages("https://picsum.photos/200/300");
                                  }
                                  ),
                                // _buildImages("https://picsum.photos/200/300"),
                                // const SizedBox(width: 15),
                                // _buildImages("https://picsum.photos/200/300"),
                                // const SizedBox(width: 15),
                                // _buildImages("https://picsum.photos/200/300"),
                                // const SizedBox(width: 15),
                                // _buildImages("https://picsum.photos/200/300"),
                              ],
                            ),
                          
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
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: 75,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(25),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Payout Status',
                                      style: FlutterFlowTheme.of(context).bodyText1,
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 5),
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          width: 90,
                                          height: 25,
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(255, 240, 208, 152),
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                            child: Text(
                                              'Pending',
                                              //  neworderValueNotifier.value.item2.orderStatuses.name.toString(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 12, fontFamily: 'Poppins'),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
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
                        future: lottieComposition(readyOrderValueNotifier.value.item2!.lottieString.toString()),
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

  _buildImages(image) {
    return Container(
      height: 75,
      width: 75,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: Image(image: NetworkImage(image)),
    );
  }
}
