// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<dynamic>> newCustomAction(String query) async {
  try {
    final snapshot =
        await FirebaseFirestore.instance.collection('places').get();

    final filteredDocs = snapshot.docs.where((doc) {
      final name = (doc['name'] ?? '').toString().toLowerCase();
      return name.contains(query.toLowerCase());
    }).toList();

    return filteredDocs.map((doc) => doc.data()).toList();
  } catch (e) {
    print('Search error: $e');
    return [];
  }
}
