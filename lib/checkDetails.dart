import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:fingerprintauthentication/landingPage.dart';
import 'package:fingerprintauthentication/main.dart';


class checkDetails extends StatefulWidget {
  const checkDetails({Key? key}) : super(key: key);

  @override
  State<checkDetails> createState() => _checkDetailsState();
}

class _checkDetailsState extends State<checkDetails> {

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biometrics Details',
          style: TextStyle(
              color: Colors.black
          ),
        ),
        backgroundColor: Colors.transparent,
        leading: BackButton(
          color: Colors.black,
          onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Authenticator())
            );
          },
        ),
        elevation: 0,
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
            ],
          ),
        ),
      ),
    );
  }
}
 