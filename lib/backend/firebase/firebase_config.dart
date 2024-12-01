import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCMqwcTXyT2mxxZyv8D7c7jFnefP__CpV4",
            authDomain: "lidm-project-final-h8bpym.firebaseapp.com",
            projectId: "lidm-project-final-h8bpym",
            storageBucket: "lidm-project-final-h8bpym.appspot.com",
            messagingSenderId: "989189350154",
            appId: "1:989189350154:web:9473a9caa346a0622510f3"));
  } else {
    await Firebase.initializeApp();
  }
}
