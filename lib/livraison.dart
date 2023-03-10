import 'package:flat_3d_button/flat_3d_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:projet_iai/button4.dart';
import 'package:projet_iai/detailLivraison.dart';
import 'package:projet_iai/form_case.dart';
import 'package:projet_iai/form_selection_case.dart';
import 'package:projet_iai/livraison.dart';
import 'package:projet_iai/models.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_widget/google_maps_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:permission_handler/permission_handler.dart';

class Formulaire extends StatefulWidget {
  const Formulaire({
    super.key,
  });

  @override
  State<Formulaire> createState() => _FormulaireState();
}

final _formKey = GlobalKey<FormState>();
String selectevalue = 'BGT';

DetailLivraison detailLivraison = DetailLivraison();

void signuserIn() {}

class _FormulaireState extends State<Formulaire> {
  void dispose() {
    super.dispose();

    produit.dispose();
    quantite.dispose();
    prix.dispose();
    nom.dispose();
    prenom.dispose();
    contact.dispose();
    adresse.dispose();
    _locationController.dispose();
  }

  double _lat = 0.0;
  double _lng = 0.0;
  final TextEditingController _locationController = TextEditingController();

  Future<void> _openMap() async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$_lat,$_lng';
    if (await canLaunch(url)) {
      await launch(url);
      setState(() {
        _locationController.text = '$_lat,$_lng';
      });
    } else {
      throw 'Could not launch $url';
    }
  }

  final produit = TextEditingController();
  final quantite = TextEditingController();
  final prix = TextEditingController();
  final nom = TextEditingController();
  final prenom = TextEditingController();
  final contact = TextEditingController();
  final adresse = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF8A2387),
          title: Text('Formulaire De Livraison',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25)),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color(0xFF8A2387),
                Color(0xFFE94057),
                Color(0xFFF27121)
              ])),
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: ListView(children: <Widget>[
              SizedBox(
                height: 60,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                      'images/assets/images/122-removebg-preview.png'),
                ),
              ),
              Text('Livraison',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 35)),
              Text('Entrez toutes les informations de livraison',
                  style: TextStyle(
                    color: Colors.white,
                  )),
              const Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
              DropdownButton<String>(
                value: selectevalue,
                onChanged: (value) {
                  setState(() {
                    selectevalue = value!;
                  });
                },
                items: [
                  DropdownMenuItem<String>(
                    value: 'BGT',
                    child: Row(
                      children: [
                        Image.asset(
                          'images/bouteille_grande_1-removebg-preview.png',
                          height: 50,
                          width: 50,
                        ),
                        SizedBox(width: 10),
                        Text('Bouteilles d\'eau (Grande Taille)'),
                      ],
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: 'BPT',
                    child: Row(
                      children: [
                        Image.asset(
                          'images/bouteille_moyenne_1-removebg-preview.png',
                          height: 50,
                          width: 50,
                        ),
                        SizedBox(width: 10),
                        Text('Bouteilles d\'eau (Petite Taille)'),
                      ],
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: 'SE',
                    child: Row(
                      children: [
                        Image.asset(
                          'images/sachet_eau_1-removebg-preview.png',
                          height: 50,
                          width: 50,
                        ),
                        SizedBox(width: 10),
                        Text('Sachets d\'eau'),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(padding: const EdgeInsets.symmetric(vertical: 4.0)),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir les informations';
                  } else if (!RegExp(r'^\d+$').hasMatch(value)) {
                    return "Veuillez entrer uniqement des chiffres";
                  } else {
                    return null;
                  }
                },
                controller: quantite,
                decoration: InputDecoration(
                    labelText: 'Quantité',
                    prefixIcon: Icon(
                      Icons.numbers_outlined,
                      color: Colors.white,
                    ),
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    labelStyle: const TextStyle(
                      color: Colors.black,
                    )),
              ),
              Padding(padding: const EdgeInsets.symmetric(vertical: 4.0)),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir les informations';
                  } else if (!RegExp(r'^\d+$').hasMatch(value)) {
                    return "Veuillez entrer uniqement des chiffres";
                  } else {
                    return null;
                  }
                },
                controller: prix,
                decoration: InputDecoration(
                    labelText: 'Prix',
                    prefixIcon: Icon(
                      Icons.monetization_on_outlined,
                      color: Colors.white,
                    ),
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    labelStyle: const TextStyle(
                      color: Colors.black,
                    )),
              ),
              SizedBox(height: 20),
              Text('INFORMATIONS SUR LE CLIENT',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15)),
              Padding(padding: const EdgeInsets.symmetric(vertical: 4.0)),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir les informations';
                  } else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                    return "Veuillez entrer uniqement des lettres";
                  } else {
                    return null;
                  }
                },
                controller: nom,
                decoration: InputDecoration(
                    labelText: 'Nom',
                    prefixIcon: Icon(
                      Icons.person_outline_outlined,
                      color: Colors.white,
                    ),
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    labelStyle: const TextStyle(
                      color: Colors.black,
                    )),
              ),
              Padding(padding: const EdgeInsets.symmetric(vertical: 4.0)),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir les informations';
                  } else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                    return "Veuillez entrer uniqement des lettres";
                  } else {
                    return null;
                  }
                },
                controller: prenom,
                decoration: InputDecoration(
                    labelText: 'Prénoms',
                    prefixIcon: Icon(
                      Icons.person_outline_outlined,
                      color: Colors.white,
                    ),
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    labelStyle: const TextStyle(
                      color: Colors.black,
                    )),
              ),
              Padding(padding: const EdgeInsets.symmetric(vertical: 4.0)),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir les informations';
                  } else if (!RegExp(r'^\d+$').hasMatch(value)) {
                    return "Veuillez entrer uniqement des chiffres";
                  } else {
                    return null;
                  }
                },
                controller: contact,
                decoration: InputDecoration(
                    labelText: 'Contact',
                    prefixIcon: Icon(
                      Icons.contact_phone_outlined,
                      color: Colors.white,
                    ),
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    labelStyle: const TextStyle(
                      color: Colors.black,
                    )),
              ),
              Padding(padding: const EdgeInsets.symmetric(vertical: 4.0)),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir les informations';
                  } else
                    null;
                },
                controller: adresse,
                decoration: InputDecoration(
                    labelText: 'Adresse',
                    prefixIcon: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    labelStyle: const TextStyle(
                      color: Colors.black,
                    )),
              ),
              Padding(padding: const EdgeInsets.symmetric(vertical: 4.0)),
              TextField(
                controller: _locationController,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.maps_ugc,
                    color: Colors.white,
                  ),
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  labelStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  hintText: 'Localisation',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.map),
                    onPressed: () async {
                      await _openMap();
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Boutton4(onTap: () {
                if (_formKey.currentState!.validate()) {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Confirmation'),
                          content: Text(
                              'Etes vous sûre de vouloir valider le formulaire'),
                          actions: [
                            Flat3dButton(
                              child: Text('Annuler'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            Flat3dButton(
                              child: Text('Valider'),
                              onPressed: () {
                                _formKey.currentState?.save();
                                detailLivraison.produitlivre = produit.text;
                                detailLivraison.quantitelivre = quantite.text;
                                detailLivraison.prixpaye = prix.text;
                                detailLivraison.nomclient = nom.text;
                                detailLivraison.prenomclient = prenom.text;
                                detailLivraison.contactclient = contact.text;
                                detailLivraison.adresseclient = adresse.text;
                                detailLivraison.localisation =
                                    _locationController.text;
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Details(
                                    detailLivraison: detailLivraison,
                                  );
                                }));
                              },
                            ),
                          ],
                        );
                      });
                }
              })
            ]),
          ),
        ));
  }
}
