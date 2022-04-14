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

  LocalAuthentication auth = LocalAuthentication();
  bool _canCheckBiometrics = false;
  List<BiometricType> _availableBiometric =[];
  String _authorized = "Not Authorized";

  Future<void> _checkBiometrics() async {
    bool canCheckBiometrics = false;
    try{
    canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
  }
  Future<void> _getAvailableBiometric() async {
    List <BiometricType> availableBiometrics = [];
    try{
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      _availableBiometric = availableBiometrics;
    });
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try{
      authenticated = await auth.authenticateWithBiometrics(
        localizedReason:  "Scan your fingerprint to authenticate",
        useErrorDialogs: true,
        stickyAuth: false,
      );
    } on PlatformException catch (e) {
      print("error found ie: $e");
    }
    if (!mounted) return;

    setState(() {
      if (authenticated){
        _authorized = " Authorized";
      }
      else{
        _authorized = "Not Authorized";
      }
    });
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
                child: const Text('Check Biometrics'),
                onPressed: _checkBiometrics ,
              ),
              Text('Available Biometric: $_availableBiometric'),
              ElevatedButton(
                child: const Text('get available biometrics'),
                onPressed: _getAvailableBiometric,
              ),
              Text('Current State: $_authorized \n'),
              ElevatedButton(
                child: const Text("Authenticate"),
                onPressed: _authenticate,
              )
            ],
          ),
        ),
      ),
    );
  }
}
