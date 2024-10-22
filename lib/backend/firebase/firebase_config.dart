import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBJKe0qpN1VEdzXBULSQ4RXkd0C8DMt_8I",
            authDomain: "inkedin-4fc34.firebaseapp.com",
            projectId: "inkedin-4fc34",
            storageBucket: "inkedin-4fc34.appspot.com",
            messagingSenderId: "282840658029",
            appId: "1:282840658029:web:c0480f43fccaa2afcecf64",
            measurementId: "G-3RNFL05590"));
  } else {
    await Firebase.initializeApp();
  }
}
