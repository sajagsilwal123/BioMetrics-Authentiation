import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

void main (){
  runApp(
    MaterialApp(
      home: Authenticator()
    )
  );
}

class Authenticator extends StatefulWidget {
  const Authenticator({Key? key}) : super(key: key);

  @override
  State<Authenticator> createState() => _AuthenticatorState();
}

class _AuthenticatorState extends State<Authenticator> {

  bool _canCheckBiometrics = false;
  List<BiometricType> _availableBiometric =[];
  String _authorized = "Not Authorized";

  Future<void> _checkBiometrics() async {
  }

  Future<void> _getAvailableBiometric() async {
  }

  Future<void> _authenticate() async {

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FingerPrint Authenticator'),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Can Check biometrics: $_canCheckBiometrics'),
              ElevatedButton(
                child: Text('Check Biometrics'),
                onPressed: _checkBiometrics ,
              ),
              Text('Available Biometric: $_availableBiometric'),
              ElevatedButton(
                child: Text('get available biometrics'),
                onPressed: _getAvailableBiometric,
              ),
              Text('Current State: \n'),
              ElevatedButton(
                child: Text("Authenticate"),
                onPressed: _authenticate,
              )
            ],
          ),
        ),
      ),
    );
  }
}
