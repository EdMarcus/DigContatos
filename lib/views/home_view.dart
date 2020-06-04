import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Widget cardContact() {
    return Card(
      clipBehavior: Clip.antiAlias,
      color: Colors.indigo,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        width: double.maxFinite,
        height: 200.0,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Colors.blue, Colors.indigo],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
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
                        size: 40,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Text("Édlon de Sá")),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
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
                children: <Widget>[
                  Text("teste"),
                  Text("teste"),
                  Text("teste")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        gradient: LinearGradient(
            colors: [Colors.blue, Colors.indigo],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
        title: Text("Contatos"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                cardContact(),
                cardContact(),
                cardContact(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
