import 'package:flutter/material.dart';
import 'package:projet_iai/Info_client.dart';
import 'package:projet_iai/livraison.dart';

import 'models.dart';

class Product extends StatefulWidget {
  final Key? mykey;
  const Product({this.mykey}) : super(key: mykey);

  @override
  State<Product> createState() => _ProductState();
}

final _formKey = GlobalKey<FormState>();
DetailLivraison detailLivraison = DetailLivraison();

final produit = TextEditingController();
final quantite = TextEditingController();
final prix = TextEditingController();

class _ProductState extends State<Product> {
  @override
  void dispose() {
    super.dispose();
    produit.dispose();
    quantite.dispose();
    prix.dispose();
  }

  late String selectevalue = 'BGT';

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
                                Icons.delivery_dining,
                                size: 200,
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              const Text(
                                'Veuillez entrer les informations de livraison',
                                style: TextStyle(
                                    color: Color.fromARGB(176, 29, 25, 25),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 4.0)),
                              DropdownButton<String>(
                                value: selectevalue,
                                onChanged: (value) {
                                  setState(() {
                                    selectevalue = value!;
                                    produit.text = selectevalue;
                                  });
                                },
                                items: [
                                  DropdownMenuItem<String>(
                                    value: 'BGT',
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'images/bouteille_grande_1-removebg-preview.png',
                                          height: 70,
                                          width: 70,
                                        ),
                                        const SizedBox(width: 10),
                                        const Text(
                                            'Bouteilles d\'eau (Grande Taille)'),
                                      ],
                                    ),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: 'BPT',
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'images/bouteille_moyenne_1-removebg-preview.png',
                                          height: 70,
                                          width: 70,
                                        ),
                                        const SizedBox(width: 10),
                                        const Text(
                                            'Bouteilles d\'eau (Petite Taille)'),
                                      ],
                                    ),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: 'SE',
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'images/sachet_eau_1-removebg-preview.png',
                                          height: 70,
                                          width: 70,
                                        ),
                                        const SizedBox(width: 10),
                                        const Text('Sachets d\'eau'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              const Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 4.0)),
                              TextFormField(
                                controller: quantite,
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
                                  hintText: 'Quantité',
                                  prefixIcon: const Icon(
                                    Icons.numbers_outlined,
                                    color: Color.fromARGB(255, 10, 10, 10),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey.shade400),
                                  ),
                                  fillColor: Colors.grey.shade200,
                                  filled: true,
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 4.0)),
                              TextFormField(
                                controller: prix,
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
                                  hintText: 'Prix',
                                  prefixIcon: const Icon(
                                    Icons.money,
                                    color: Color.fromARGB(255, 10, 10, 10),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey.shade400),
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
                                    detailLivraison.produitlivre = produit.text;
                                    detailLivraison.quantitelivre =
                                        quantite.text;
                                    detailLivraison.prixpaye = prix.text;
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return Client();
                                    }));
                                  }
                                },
                                child: Container(
                                    padding: const EdgeInsets.all(25),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 25),
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: const Center(
                                      child: Text(
                                        'Continuer',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    )),
                              )
                            ],
                          ))),
                ))));
  }
}
