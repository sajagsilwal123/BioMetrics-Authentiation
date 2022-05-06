import 'package:fingerprintauthentication/main.dart';
import 'package:flutter/material.dart';
import 'package:fingerprintauthentication/loginPage.dart';


class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<Object>(
        stream: null,
        builder: (context, snapshot) {
          return ListView(
            physics: const BouncingScrollPhysics(),
            children: <Widget>[
                Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.bottomCenter,
                      children:  [
                        Image(
                          height: MediaQuery.of(context).size.height/3,
                          fit: BoxFit.cover,
                          image: const AssetImage('assets/images/1.jpg'),
                          ),
                        const Positioned(
                          bottom: -50.0,
                          child: CircleAvatar(
                            radius: 80,
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.transparent,
                            child: CircleAvatar(
                              backgroundColor: Colors.grey,
                              radius: 75,
                              child: ClipOval(
                                child: Image(
                                  image: AssetImage('assets/images/DP.png'),
                                ),
                              ),
                              // backgroundImage: AssetImage('assets/images/DP.png'),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const ListTile(
                      title: Center(child: Text('Sajag Silwal')),
                      subtitle: Center(child: Text('CE Student')),
                    ),
                    const ListTile(
                      title: Text('About me '),
                      subtitle: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit,'
                              ' sed do eiusmod tempor incididunt ut labore '
                              'et dolore magna aliqua. Ut enim ad minim veniam, '),
                    ),
                    const ListTile(
                      title: Text('Education'),
                      subtitle: Text(
                          'National School of Sciences'
                      ),
                    ),
                    ListTile(
                      title: Text("Social"),
                      subtitle: Row(
                        children: [
                          SizedBox(height: 50,),
                          Expanded(
                              child: InkWell(
                                  onTap: (){},
                                  child: const CircleAvatar(
                                    radius: 15,
                                    child: ClipOval(
                                      child: Image(image: AssetImage('assets/images/facebook.png')),
                                    ),
                                  )
                              )
                          ),
                          Expanded(
                              child: InkWell(
                                onTap: (){},
                                child: const CircleAvatar(
                                  radius: 15,
                                  backgroundImage: AssetImage('assets/images/instagram.jpg'),
                                )
                              )
                          ),
                          Expanded(
                              child: InkWell(
                                  onTap: (){},
                                  child: const CircleAvatar(
                                    radius: 18,
                                    child: ClipOval(
                                      child: Image(image: AssetImage('assets/images/twitter.png')),
                                    ),
                                  )
                              )
                          ),
                          Expanded(
                              child: InkWell(
                                  onTap: (){},
                                  child: const CircleAvatar(
                                    radius: 15,
                                    child: ClipOval(
                                      child: Image(image: AssetImage('assets/images/ld.png')),
                                    ),
                                  )
                              )
                          )
                        ],
                      ),
                    )
                  ],
                )
                      ],
          );
        }
      ),
      appBar: AppBar(
        title: const Text('My Profile',
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
      )
    );
  }
}
