import 'package:flutter/material.dart';
import 'package:projet_iai/homepage.dart';
import 'package:projet_iai/models.dart';

import 'modify.dart';

class Details extends StatelessWidget {
  Details({
    Key? key,
    required this.detailLivraison,
  }) : super(key: key);

  final DetailLivraison detailLivraison;

  @override
  Widget build(BuildContext context) {
    var detailLivraisonList = [
      '',
    ];
    return Scaffold(
        appBar: AppBar(
            title: const Text('Détails'),
            leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Homepage(),
                    ));
              },
              icon: const Icon(Icons.arrow_back_ios),
            )),
        body: Container(
            child: ListView.builder(
                itemCount: detailLivraisonList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    margin: const EdgeInsets.all(8.0),
                    child: ListTile(
                      onTap: () {},
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              width: 1.0,
                              color: Color.fromARGB(255, 34, 20, 20))),
                      leading: IconButton(
                        icon: const Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.deepPurple,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ModifyDetails(
                                        detailLivraison: DetailLivraison(),
                                      )));
                        },
                      ),
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Chip(
                            label: Text('Livraison'),
                            backgroundColor: Colors.purple,
                            labelStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Produit livré :  ${detailLivraison.produitlivre}",
                            style: const TextStyle(
                                color: Color.fromARGB(255, 8, 8, 8),
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            "Quantité livrée :  ${detailLivraison.quantitelivre}",
                            style: const TextStyle(
                                color: Color.fromARGB(255, 8, 8, 8),
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            "Prix payé :  ${detailLivraison.prixpaye}",
                            style: const TextStyle(
                                color: Color.fromARGB(255, 10, 10, 10),
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            "Nom du client :  ${detailLivraison.nomclient}",
                            style: const TextStyle(
                                color: Color.fromARGB(255, 14, 14, 15),
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            "Prénom du client :  ${detailLivraison.prenomclient}",
                            style: const TextStyle(
                                color: Color.fromARGB(255, 14, 13, 17),
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          Text(
                            "Contact client :  ${detailLivraison.contactclient}",
                            style: const TextStyle(
                                color: Color.fromARGB(255, 5, 5, 5),
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            "Adresse client :  ${detailLivraison.adresseclient}",
                            style: const TextStyle(
                                color: Color.fromARGB(255, 10, 10, 10),
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            "Localisation :  ${detailLivraison.localisation}",
                            style: const TextStyle(
                                color: Color.fromARGB(255, 10, 10, 10),
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  );
                })));
  }
}
