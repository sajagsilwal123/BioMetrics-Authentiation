import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:fingerprintauthentication/landingPage.dart';
import 'package:fingerprintauthentication/checkDetails.dart';

void main (){
  runApp(
    const MaterialApp(
      home:Authenticator()
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
  List<BiometricType> _availableBiometric =[];

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

    if (authenticated){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LandingPage()),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('FingerPrint Authenticator'),
      // )
      backgroundColor: Colors.black12,
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Text(
                  '',
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.bold,
                    fontSize: 30
                  ),
                ),
              ),
              InkWell(
                onTap: _authenticate,
                child: const Image(
                  image: AssetImage('assets/images/fingerprint.jpg'),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => checkDetails())
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Text('Check Biometrics Availability',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white,
                      color: Colors.grey.shade400
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
