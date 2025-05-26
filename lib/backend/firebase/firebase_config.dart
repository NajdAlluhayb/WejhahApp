import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBEDzvGZXH70mPgYE5tdwtyVWTwc5Vo1cs",
            authDomain: "touism-9pd4tf.firebaseapp.com",
            projectId: "touism-9pd4tf",
            storageBucket: "touism-9pd4tf.firebasestorage.app",
            messagingSenderId: "253897106347",
            appId: "1:253897106347:web:083d8afb4c25c22f2c68ee"));
  } else {
    await Firebase.initializeApp();
  }
}
