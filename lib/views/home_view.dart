import 'package:digcontatos/models/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:digcontatos/views/widgets/cardContact.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
 final Contact contatoTeste = Contact(
   name: "Édlon Marcus Maia de Sá",
   email: "edlon2007@gmail.com",
   phone: "(99) 9999-9999",
   urlPhoto: "",
 );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        gradient: LinearGradient(
            colors: [Colors.blue, Colors.indigo],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
        title: Text("DIG CONTATOS", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15,10,15,10),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                CardContact(contatoTeste),
                CardContact(contatoTeste),
                CardContact(contatoTeste),
                CardContact(contatoTeste),
                CardContact(contatoTeste),
                CardContact(contatoTeste),
                CardContact(contatoTeste),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
