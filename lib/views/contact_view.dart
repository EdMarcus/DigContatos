import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:digcontatos/models/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class ContactView extends StatefulWidget {
  final Contact contact;
  ContactView({this.contact});
  @override
  _ContactViewState createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _nameFocus = FocusNode();
  Contact _editedContact;
  bool _userEdited = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _requestPop,
      child: Scaffold(
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
        floatingActionButton: FloatingActionButton(
          clipBehavior: Clip.antiAlias,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [Colors.blue, Colors.indigo],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
            child: Icon(Icons.save),
            width: double.infinity,
            height: double.infinity,
          ),
          onPressed: () {
            if(_editedContact.name != null && _editedContact.name.isNotEmpty){
              Navigator.pop(context, _editedContact);
            } else {
              FocusScope.of(context).requestFocus(_nameFocus);
            }
          },
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              GestureDetector(
                child: Container(
                  child: CircleAvatar(
                    maxRadius: 80,
                    child: _editedContact.img == null
                      ? Icon(Icons.person, size: 100) : null,
                    minRadius: 80,
                    backgroundImage: _editedContact.img != null
                    ? FileImage(File(_editedContact.img)):
                    null,
                  ),
                ),
                onTap: (){
                  ImagePicker iP = ImagePicker();
                  iP.getImage(source: ImageSource.camera).then((file) {
                    if(file == null) return;
                    setState(() {
                      _editedContact.img = file.path;
                    });
                  } );
                }
              ),
              TextField(
                style: TextStyle(
                color: Colors.indigo,
              ),
                controller: _nameController,
                focusNode: _nameFocus,
                decoration: InputDecoration(labelText: "Nome:"),
                onChanged: (text) {
                  _userEdited = true;
                  setState(() {
                    _editedContact.name = text;
                  });
                },
              ),
              TextField(
                style: TextStyle(
                color: Colors.indigo,
              ),
                controller: _emailController,
                decoration: InputDecoration(labelText: "E-mail:"),
                onChanged: (text) {
                  _userEdited = true;
                  _editedContact.email = text;
                },
                keyboardType: TextInputType.emailAddress,
              ),
              TextField(
                style: TextStyle(
                color: Colors.indigo,
              ),
                controller: _phoneController,
                decoration: InputDecoration(labelText: "Telefone:"),
                onChanged: (text) {
                  _userEdited = true;
                  _editedContact.phone = text;
                },
                keyboardType: TextInputType.phone,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.contact == null) {
      _editedContact = Contact();
    } else {
      _editedContact = Contact.fromMap(widget.contact.toMap());

      _nameController.text = _editedContact.name;
      _emailController.text = _editedContact.email;
      _phoneController.text = _editedContact.phone;
    }
  }

  Future<bool> _requestPop(){
    if(_userEdited){
      showDialog(context: context,
        builder: (context){
          return AlertDialog(
            title: Text("Descartar alterações?"),
            content: Text("Se sair, as alterações serão perdidas!"),
            actions: <Widget>[
              FlatButton(
                child: Text("Cancelar"),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text("Sim"),
                onPressed: (){
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              ),
            ],
          );
        }
      );
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
}
