import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

Future<LottieComposition> lottieComposition(String asset) async {
  var assetData = await rootBundle.load(asset);
  return await LottieComposition.fromByteData(assetData);
}
