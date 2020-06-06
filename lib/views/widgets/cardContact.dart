import 'package:flutter/material.dart';
import 'package:digcontatos/models/contact_model.dart';

class CardContact extends StatelessWidget {

  final Contact contact;

  const CardContact(this.contact);
  
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      color: Colors.indigo,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Colors.blue, Colors.indigo],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 0, 20),
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: CircleAvatar(
                      minRadius: 3,
                      backgroundColor: Colors.grey[50],
                      child: Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  Container(
                    child: Expanded(
                      flex: 4,
                      child: Container(
                          margin: EdgeInsets.only(right: 10),
                          padding: EdgeInsets.fromLTRB(15, 10, 5, 20),
                          child: Text(
                            contact.name,
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
                      onPressed: () {},
                    ),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: double.infinity,
                    ),
                  ),
                  Expanded(
                      flex: 5,
                      child: Container(
                          padding: EdgeInsets.fromLTRB(5, 10, 20, 0),
                          child: Column(
                            children: <Widget>[
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
                                    contact.email,
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
                                    contact.phone,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
