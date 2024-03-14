import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityChecker {
  final Connectivity _connectivity = Connectivity();

  Future<void> checkConnectivity(
      BuildContext context, Function callback) async {
    final result = await _connectivity.checkConnectivity();
    if (result == ConnectivityResult.none) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('No internet connection'),
      ));
    } else {
      callback();
    }
  }
}
