// ignore_for_file: avoid_print
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';


// ignore: must_be_immutable
class PhotoUploadPage extends StatefulWidget {
  final String? templeid;
  final String? landid;

  List<dynamic>? selectedTempData;
  PhotoUploadPage({Key? key, this.selectedTempData, this.templeid, this.landid}): super(key: key);

  @override
  _PhotoUploadPageState createState() => _PhotoUploadPageState();
}

class _PhotoUploadPageState extends State<PhotoUploadPage> {
  late bool error, sending, success;
  late String msg;
  var image64;
  var userlat;
  var userlng;

  @override
  void initState() {
    super.initState();
    userPermission();

  }

  getcam() async {
    var img = await image.pickImage(source: ImageSource.camera);
    var imageResized = await FlutterNativeImage.compressImage(
      img!.path,
      quality: 10,
      percentage: 25,
      targetWidth: 25,
      targetHeight: 25,
    );
    setState(() {
      file = File(img.path);
      List<int> imageBytes = imageResized.readAsBytesSync();
      var imagetobase64 = base64Encode(imageBytes);
      image64 = '{"image":"data:image/jpg;base64,$imagetobase64"}';
      print(image64);
      final bytes = file!.lengthSync();
      final kb = bytes / 1024;
      final mb = kb / 1024;
      fileSize = kb.ceilToDouble();
      print("MB:$mb, KB:$kb");
      print(image64);
      print(fileSize);
    });
  }
  
  // Get User Location Permissions
  Future userPermission() async {
    bool serviceEnabled;
    //LocationPermission permission;
    final status = await Permission.camera.request();
    if (status == PermissionStatus.granted) {
      print('Permission Granted');
    } else if (status == PermissionStatus.denied) {
      print('Permission denied');
    } else if (status == PermissionStatus.permanentlyDenied) {
      print('Permission Permanently Denied');
      await openAppSettings();
    }
  }

  //Access Camera and pick the image
  File? file;
  ImagePicker image = ImagePicker();

  //Geolocation
  String currentAddress = 'My Address';
  Position? currentposition;
  double? fileSize;
  Future<Position?> _determinePosition() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        currentposition = position;
        userlat = currentposition!.latitude.toString();
        userlng = currentposition!.longitude.toString();
      });
    } catch (e) {
      print(e);
    }
    return null;
  }

 
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return Navigator.canPop(context);
      },
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, size: 20, color: Colors.black),
          ),
          title: const Text(
            "Upload Photos",
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(left: 20,top: 20,right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Step 1",
                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.amber),),
                  const SizedBox(height: 15),
                   const Text("Take a Photo Your Device Camera Of Your Current Order Items",
                  style: TextStyle(fontSize: 15,color: Colors.black),),
                  const SizedBox(height: 15),
                   Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
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
                onPressed: (){
                  //Camera Access
                  getcam();
                 _determinePosition();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:const[
                    Icon(Icons.cloud_upload_outlined,color: Color(0xFFFFA000)),
                    SizedBox(width: 15),
                    Text("Take a Photo",
                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),)
                  ],
                ),
              ),
            ),
           ), 
           const SizedBox(height: 10),
           
           const Text("Step 2",
                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.amber),),
                  const SizedBox(height: 15),
                   const Text("Preview And Upload The Photos Of Your Current\nOrder Items. Ensure That the Products Are Clearly Visible.",
                  style: TextStyle(fontSize: 14,color: Colors.black),
                 ),
                  const SizedBox(height: 15),
                  Padding(
                  padding: const EdgeInsets.only(left: 10, right: 15, top: 10, bottom: 0),
                    child: Container(
                      height: 240,
                      width: double.infinity,
                      color: Colors.black12,
                      child: file == null
                          ? const Icon(
                            Icons.image,
                            size: 70,
                            )
                          : Image.file(
                            file!,
                            fit: BoxFit.fill,
                            ),
                    ),
                  ),
                  const SizedBox(height: 40),
                 Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                child: Container(
                height: 50,
                width: double.infinity,
                decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                primary:const Color(0xFFFFA000),
              ),
                onPressed: (){},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:const[
                    Text("Upload Photo",
                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),)
                  ],
                ),
              ),
            ),
           ), 
           ]
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

