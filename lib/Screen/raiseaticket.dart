// import 'dart:html';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class raiseATicket extends StatefulWidget {
  const raiseATicket({super.key});

  @override
  State<raiseATicket> createState() => _raiseATicketState();
}

class _raiseATicketState extends State<raiseATicket> {
  final TextEditingController inputTitle = TextEditingController();
  final TextEditingController inputDescription = TextEditingController();
  void submitData() {
    setState(() {
      FirebaseFirestore.instance.collection('userTicket').add(
        {
          'title': inputTitle,
          'description': inputDescription,
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Card(
              elevation: 10,
              margin: EdgeInsets.all(5),
              child: Container(
                height: 45,
                width: 230,
                alignment: Alignment.center,
                child: Text(
                  'Your Concern',
                  style: TextStyle(fontSize: 25, fontFamily: 'Pacifico'),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Want to tell us about a missing or \n incorrect information?\n \(or\) \n Want to suggest us a new feature? \n \(or\) \nWant to give feedback or complaint?\n\n This is the right place ',
              style: TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: inputTitle,
              onFieldSubmitted: (_) => submitData(),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Description',
              ),
              controller: inputDescription,
              onFieldSubmitted: (_) => submitData(),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              color: Color.fromARGB(253, 108, 0, 0),
              child: TextButton(
                onPressed: () => submitData(),
                child: const Text(
                  'Raise A Ticket',
                  style: TextStyle(
                    fontFamily: 'Oswald',
                    color: Color.fromARGB(255, 245, 237, 4),
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
