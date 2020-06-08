import 'dart:io';

import 'package:digcontatos/models/contact_model.dart';
import 'package:digcontatos/views/contact_view.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ContactHelper helper = ContactHelper();
  List<Contact> contacts = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _getAllContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        gradient: LinearGradient(
            colors: [Colors.blue, Colors.indigo],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
        title: Text(
          "DIG CONTATOS",
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
          clipBehavior: Clip.antiAlias,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [Colors.blue, Colors.indigo],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
            child: Icon(Icons.add),
            width: double.infinity,
            height: double.infinity,
          ),
          onPressed: () {
            _showContactPage();
          }),
      body: ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return _contactCard(context, index);
        },
      ),
    );
  }

  Widget _contactCard(BuildContext context, int index) {
    return Card(
      clipBehavior: Clip.antiAlias,
      color: Colors.indigo,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Colors.blue, Colors.indigo],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: CircleAvatar(
                    minRadius: 30,
                    backgroundColor: Colors.grey[50],
                    child: contacts[index].img == null
                        ?Icon(
                            Icons.person,
                            size: 50,
                            color: Colors.blueAccent,
                          ):null,
                    backgroundImage: contacts[index].img != null ?
                      FileImage(File(contacts[index].img)) : null,
                  ),
                ),
                Container(
                  child: Expanded(
                    flex: 4,
                    child: Container(
                        margin: EdgeInsets.only(right: 10),
                        padding: EdgeInsets.fromLTRB(15, 10, 5, 20),
                        child: Text(
                          contacts[index].name ?? "",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    alignment: Alignment.topCenter,
                    icon: Icon(
                      Icons.edit,
                      color: Colors.grey[50],
                    ),
                    onPressed: () {
                      _showContactPage(contact: contacts[index]);
                    },
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 75, top:15),
              child: Column(children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.mail,
                      size: 20,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      contacts[index].email ?? "",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.phone,
                      size: 20,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      contacts[index].phone ?? "",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ],
        ),
        padding: EdgeInsets.all(10.0),
      ),

      //onTap: () {
      //  _showContactPage(contact: contacts[index]);
      //},
    );
  }

  void _showContactPage({Contact contact}) async {
    final recContact = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => ContactView(contact: contact)));
    if (recContact != null) {
      if (contact != null) {
        await helper.updateContact(recContact);
      } else {
        await helper.saveContact(recContact);
      }
      _getAllContacts();
    }
  }

  void _getAllContacts() {
    helper.getAllContacts().then((list) {
      setState(() {
        contacts = list;
      });
    });
  }
}
