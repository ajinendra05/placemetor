// import 'dart:html';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
// import 'package:firebase/firebase.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:palcmentor/Screen/raiseaticket.dart';
import 'package:palcmentor/Screen/tandpcontact.dart';
import 'package:palcmentor/widgets/profile_content_widget.dart';
import 'package:palcmentor/Screen/todo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'login.dart';

class MyProfile extends StatelessWidget {
  MyProfile({super.key});
  // List<Map<String, Object>> contentList = [
  //   {'icon': Icons.add_card_outlined, 'title': 'To-Do'},
  //   {'icon': Icons.add_card_outlined, 'title': 'To-Do'},
  //   {'icon': Icons.add_card_outlined, 'title': 'To-Do'},
  //   {'icon': Icons.add_card_outlined, 'title': 'To-Do'},
  // ];

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    var _uname;
    var _enroll;
    var _mobileNu;

    FirebaseFirestore.instance
        .collection('userDetails')
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) {
        // print(user!.uid + "12");
        if (element.id == user?.uid) {
          _uname = element.get('name');
          _enroll = element.get('enroll');
          _mobileNu = element.get('mobile_nu');
        }
      });
    });
    return Scaffold(
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('userDetails')
                .snapshots(),
            builder: (BuildContext ctx, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                print(snapshot.error);
                return Text('Something went wrong');
              }

              // print(snapshot.data.document.length);
              // FirebaseFirestore.instance
              //     .collection('me')
              //     .snapshots()
              //     .listen((event) {
              //   print(event);
              // });
              // print(snapshot.hasData);
              // print(snapshot.data.hashCode);
              // print(snapshot.data);

              if (snapshot.data == null) return CircularProgressIndicator();
              final userDocoments = snapshot.data.docs;
              final userId = FirebaseAuth.instance.currentUser?.uid;
              // print("$_uname username");
              return Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Card(
                    elevation: 10,
                    margin: EdgeInsets.all(5),
                    child: Container(
                      height: 50,
                      width: 150,
                      alignment: Alignment.center,
                      child: Text(
                        'Profile',
                        style: TextStyle(fontSize: 30, fontFamily: 'Pacifico'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Card(
                    elevation: 7,
                    shadowColor: Color.fromARGB(255, 129, 129, 127),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(5),
                          width: 70,
                          height: 70,
                          child: Image.asset(
                            'assets/images/man.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              _uname,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'LibreBaskerville',
                                fontWeight: FontWeight.bold,
                                fontSize: 26,
                              ),
                            ),
                            Text(
                              _enroll,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Merriweather',
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    splashColor: Colors.grey,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ToDoList(),
                          ));
                    },
                    child: ProfileContent(
                      contentIcon: Icons.add_card_outlined,
                      contentTitle: 'To-Do',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    splashColor: Colors.grey,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => TandP(),
                          ));
                    },
                    child: ProfileContent(
                      contentIcon: Icons.contact_page_outlined,
                      contentTitle: 'T&P Cordinator',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    splashColor: Colors.grey,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => raiseATicket(),
                          ));
                    },
                    child: ProfileContent(
                      contentIcon: Icons.message_outlined,
                      contentTitle: 'Raise a Ticket',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                      splashColor: Colors.grey,
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (_) => MyLogin(),
                        // ));
                        FirebaseAuth.instance.signOut();
                      },
                      child: ProfileContent(
                        contentIcon: Icons.logout_outlined,
                        contentTitle: 'Log Out',
                      )),
                ],
              );
            }));
  }
}
