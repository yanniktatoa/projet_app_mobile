import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'delivy.dart';
import 'detailLivraison.dart';
import 'models.dart';

class Client extends StatefulWidget {
  final Key? mykey;
  const Client({this.mykey}) : super(key: mykey);

  @override
  State<Client> createState() => _ClientState();
}

DetailLivraison detailLivraison = DetailLivraison();
double _lat = 6.1319;
double _lng = 1.2228;
final TextEditingController _locationController = TextEditingController();
final _formKey = GlobalKey<FormState>();
final String _formId = DateTime.now().millisecondsSinceEpoch.toString();
final nom = TextEditingController();
final prenom = TextEditingController();
final contact = TextEditingController();
final adresse = TextEditingController();

class _ClientState extends State<Client> {
  @override
  void dispose() {
    super.dispose();
    nom.dispose();
    prenom.dispose();
    contact.dispose();
    adresse.dispose();
    _locationController.dispose();
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SafeArea(
                  child: Center(
                      child: Form(
                          key: _formKey,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 50,
                                ),
                                const Icon(
                                  Icons.person_add_sharp,
                                  size: 150,
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                Text(
                                  'Veuillez entrer les informations du client',
                                  style: TextStyle(
                                    color: Color.fromARGB(146, 10, 1, 1),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                TextFormField(
                                  controller: nom,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Veuillez saisir les informations';
                                    } else if (!RegExp(r'^[a-zA-Z]+$')
                                        .hasMatch(value)) {
                                      return "Veuillez entrer uniqement des lettres";
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Nom du client',
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Color.fromARGB(255, 10, 10, 10),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade400),
                                    ),
                                    fillColor: Colors.grey.shade200,
                                    filled: true,
                                  ),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                TextFormField(
                                  controller: prenom,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Veuillez saisir les informations';
                                    } else if (!RegExp(r'^[a-zA-Z]+$')
                                        .hasMatch(value)) {
                                      return "Veuillez entrer uniqement des lettres";
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Prénom du client',
                                    prefixIcon: Icon(
                                      Icons.person_4,
                                      color: Color.fromARGB(255, 10, 10, 10),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade400),
                                    ),
                                    fillColor: Colors.grey.shade200,
                                    filled: true,
                                  ),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                TextFormField(
                                  controller: contact,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Veuillez saisir les informations';
                                    } else if (!RegExp(r'^\d+$')
                                        .hasMatch(value)) {
                                      return "Veuillez entrer uniqement des chiffres";
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Numéro du client',
                                    prefixIcon: Icon(
                                      Icons.mobile_friendly_sharp,
                                      color: Color.fromARGB(255, 10, 10, 10),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade400),
                                    ),
                                    fillColor: Colors.grey.shade200,
                                    filled: true,
                                  ),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                TextFormField(
                                  controller: adresse,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Veuillez saisir les informations';
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Adresse du client',
                                    prefixIcon: Icon(
                                      Icons.home,
                                      color: Color.fromARGB(255, 10, 10, 10),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade400),
                                    ),
                                    fillColor: Colors.grey.shade200,
                                    filled: true,
                                  ),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                TextFormField(
                                  controller: _locationController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Veuillez saisir les informations';
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Localisation',
                                    suffixIcon: IconButton(
                                      icon: Icon(Icons.map),
                                      onPressed: () async {
                                        await _openMap();
                                      },
                                    ),
                                    prefixIcon: Icon(
                                      Icons.maps_ugc_rounded,
                                      color: Color.fromARGB(255, 10, 10, 10),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade400),
                                    ),
                                    fillColor: Colors.grey.shade200,
                                    filled: true,
                                  ),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState?.save();
                                      detailLivraison.produitlivre =
                                          produit.text;
                                      detailLivraison.quantitelivre =
                                          quantite.text;
                                      detailLivraison.prixpaye = prix.text;
                                      detailLivraison.nomclient = nom.text;
                                      detailLivraison.prenomclient =
                                          prenom.text;
                                      detailLivraison.contactclient =
                                          contact.text;
                                      detailLivraison.adresseclient =
                                          adresse.text;
                                      detailLivraison.localisation =
                                          _locationController.text;
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return Details(
                                          detailLivraison: detailLivraison,
                                        );
                                      }));
                                    }
                                  },
                                  child: Container(
                                      padding: EdgeInsets.all(25),
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 25),
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Center(
                                        child: Text(
                                          'Valider',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      )),
                                )
                              ]))),
                ))));
  }
}
