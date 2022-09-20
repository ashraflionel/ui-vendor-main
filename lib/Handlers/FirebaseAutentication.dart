// ignore_for_file: prefer_function_declarations_over_variables
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';

String? codeVerificationId;
int? forceResendToken;

Future verifyPhone({required String phoneNumber}) async {
  final PhoneVerificationCompleted phoneVerificationCompleted = (PhoneAuthCredential credential) async {
  };

 final PhoneVerificationFailed phoneVerificationFailed = (FirebaseAuthException e) {
    log(e.toString());
  };

  final PhoneCodeSent phoneCodeSent = (String verificationId, int? resendToken) async {
    codeVerificationId = verificationId;
    if (resendToken == null) return;
    forceResendToken = resendToken;
  };

   final PhoneCodeAutoRetrievalTimeout phoneCodeAutoRetrievalTimeout = (String verificationId) {
    codeVerificationId = verificationId;
  };

  try {
    return await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: phoneVerificationCompleted,
        verificationFailed: phoneVerificationFailed,
        codeSent: phoneCodeSent,
        codeAutoRetrievalTimeout: phoneCodeAutoRetrievalTimeout,
        forceResendingToken: forceResendToken);
  } on FirebaseAuthException catch (e) {
    log(e.toString());
    // return await firebaseExceptionHandler(e);
  } catch (e) {
    log(e.toString());
  }
}

Future phoneCredential(String smsCode) async {
  try {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: codeVerificationId!, smsCode: smsCode);
    // return await signIn(credential);
    return credential;
  } on FirebaseAuthException catch (e) {
    log(e.toString());
    // return await firebaseExceptionHandler(e);
  } catch (e) {
    log(e.toString());
  }
}

Future<UserCredential> signIn(AuthCredential credential) async {
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

Future signOut() async {
  try {
    return await FirebaseAuth.instance.signOut();
  } catch (e) {
    log(e.toString());
  }
}



// import 'dart:developer';
// import 'package:firebase_auth/firebase_auth.dart';

// String? codeVerificationId;
// int? forceResendToken;

// Future verifyPhone({required String phoneNumber}) async {
//   final PhoneVerificationCompleted phoneVerificationCompleted = (PhoneAuthCredential credential) async {
//     //! works on android with auto otp detection
//     // return await signIn(credential);
//   };

//   final PhoneVerificationFailed phoneVerificationFailed = (FirebaseAuthException e) {
//     log(e.toString());
//   };

//   final PhoneCodeSent phoneCodeSent = (String verificationId, int? resendToken) async {
//     codeVerificationId = verificationId;
//     if (resendToken == null) return;
//     forceResendToken = resendToken;
//   };
//   final PhoneCodeAutoRetrievalTimeout phoneCodeAutoRetrievalTimeout = (String verificationId) {
//     codeVerificationId = verificationId;
//   };
//   try {
//     return await FirebaseAuth.instance.verifyPhoneNumber(
//         phoneNumber: phoneNumber,
//         verificationCompleted: phoneVerificationCompleted,
//         verificationFailed: phoneVerificationFailed,
//         codeSent: phoneCodeSent,
//         codeAutoRetrievalTimeout: phoneCodeAutoRetrievalTimeout,
//         forceResendingToken: forceResendToken ?? null);
//   } on FirebaseAuthException catch (e) {
//     log(e.toString());
//     // return await firebaseExceptionHandler(e);
//   } catch (e) {
//     log(e.toString());
//   }
// }

// Future phoneCredential(String smsCode) async {
//   try {
//     PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: codeVerificationId!, smsCode: smsCode);
//     // return await signIn(credential);
//     return credential;
//   } on FirebaseAuthException catch (e) {
//     log(e.toString());
//     // return await firebaseExceptionHandler(e);
//   } catch (e) {
//     log(e.toString());
//   }
// }

// Future<UserCredential> signIn(AuthCredential credential) async {
//   return await FirebaseAuth.instance.signInWithCredential(credential);
// }

// Future signOut() async {
//   try {
//     return await FirebaseAuth.instance.signOut();
//   } catch (e) {
//     log(e.toString());
//   }
// }
