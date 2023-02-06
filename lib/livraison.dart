import 'package:flutter/material.dart';
import 'package:projet_iai/button4.dart';
import 'package:projet_iai/detailLivraison.dart';
import 'package:projet_iai/form_case.dart';
import 'package:projet_iai/form_selection_case.dart';
import 'package:projet_iai/models.dart';

class Formulaire extends StatefulWidget {
  const Formulaire({super.key});

  @override
  State<Formulaire> createState() => _FormulaireState();
}

String? _dropdownSelectedValue = "";

final _formKey = GlobalKey<FormState>();
const String selectevalue = 'talk';

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
          backgroundColor: Color.fromARGB(255, 39, 23, 185),
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
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: ListView(children: <Widget>[
              SizedBox(
                height: 60,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Image.asset('images/122.png'),
                ),
              ),
              Text('Livraison',
                  style: TextStyle(
                      color: Color.fromARGB(255, 39, 23, 185),
                      fontWeight: FontWeight.bold,
                      fontSize: 35)),
              Text('Entrez toutes les informations de livraison'),
              Padding(padding: const EdgeInsets.symmetric(vertical: 4.0)),
              DropdownButtonFormField(
                value: selectevalue,
                onChanged: (value) {},
                items: [
                  DropdownMenuItem(value: 'talk', child: Text("data")),
                  DropdownMenuItem(value: 'ta', child: Text("dat"))
                ],
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.shopping_bag_outlined,
                      color: Color.fromARGB(255, 39, 23, 185),
                    ),
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 70, 17, 161)),
                    ),
                    labelStyle: const TextStyle(color: Colors.deepPurple)),
              ),
              Padding(padding: const EdgeInsets.symmetric(vertical: 4.0)),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir les informations';
                  } else
                    null;
                },
                controller: quantite,
                decoration: InputDecoration(
                    labelText: 'Quantité',
                    prefixIcon: Icon(
                      Icons.numbers_outlined,
                      color: Color.fromARGB(255, 39, 23, 185),
                    ),
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 70, 17, 161)),
                    ),
                    labelStyle: const TextStyle(color: Colors.deepPurple)),
              ),
              Padding(padding: const EdgeInsets.symmetric(vertical: 4.0)),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir les informations';
                  } else
                    null;
                },
                controller: prix,
                decoration: InputDecoration(
                    labelText: 'Prix',
                    prefixIcon: Icon(
                      Icons.monetization_on_outlined,
                      color: Color.fromARGB(255, 39, 23, 185),
                    ),
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 70, 17, 161)),
                    ),
                    labelStyle: const TextStyle(color: Colors.deepPurple)),
              ),
              SizedBox(height: 20),
              Text('INFORMATIONS SUR LE CLIENT',
                  style: TextStyle(
                      color: Color.fromARGB(255, 39, 23, 185),
                      fontWeight: FontWeight.bold,
                      fontSize: 15)),
              Padding(padding: const EdgeInsets.symmetric(vertical: 4.0)),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir les informations';
                  } else
                    null;
                },
                controller: nom,
                decoration: InputDecoration(
                    labelText: 'Nom',
                    prefixIcon: Icon(
                      Icons.person_outline_outlined,
                      color: Color.fromARGB(255, 39, 23, 185),
                    ),
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 70, 17, 161)),
                    ),
                    labelStyle: const TextStyle(color: Colors.deepPurple)),
              ),
              Padding(padding: const EdgeInsets.symmetric(vertical: 4.0)),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir les informations';
                  } else
                    null;
                },
                controller: prenom,
                decoration: InputDecoration(
                    labelText: 'Prénoms',
                    prefixIcon: Icon(
                      Icons.person_outline_outlined,
                      color: Color.fromARGB(255, 39, 23, 185),
                    ),
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 70, 17, 161)),
                    ),
                    labelStyle: const TextStyle(color: Colors.deepPurple)),
              ),
              Padding(padding: const EdgeInsets.symmetric(vertical: 4.0)),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir les informations';
                  } else
                    null;
                },
                controller: contact,
                decoration: InputDecoration(
                    labelText: 'Contact',
                    prefixIcon: Icon(
                      Icons.contact_phone_outlined,
                      color: Color.fromARGB(255, 39, 23, 185),
                    ),
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 70, 17, 161)),
                    ),
                    labelStyle: const TextStyle(color: Colors.deepPurple)),
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
                      color: Color.fromARGB(255, 39, 23, 185),
                    ),
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 70, 17, 161)),
                    ),
                    labelStyle: const TextStyle(color: Colors.deepPurple)),
              ),
              SizedBox(
                height: 30,
              ),
              Boutton4(onTap: () {
                if (_formKey.currentState!.validate()) {
                  detailLivraison.produitlivre = produit.text;
                  detailLivraison.quantitelivre = quantite.text;
                  detailLivraison.prixpaye = prix.text;
                  detailLivraison.nomclient = nom.text;
                  detailLivraison.prenomclient = prenom.text;
                  detailLivraison.contactclient = contact.text;
                  detailLivraison.adresseclient = adresse.text;
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Details(detailLivraison: detailLivraison);
                  }));
                }
              })
            ]),
          ),
        ));
  }
}
