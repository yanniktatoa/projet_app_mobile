import 'package:flutter/material.dart';
import 'package:projet_iai/models.dart';

class Details extends StatelessWidget {
  Details({Key? key, required this.detailLivraison}) : super(key: key);

  DetailLivraison detailLivraison;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 39, 23, 185),
        centerTitle: true,
        title: const Text("Details",
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
        padding: const EdgeInsets.all(4.0),
        child: ListView(
          children: [
            ListTile(
              shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1.0, color: Colors.grey)),
              leading: IconButton(
                icon: const Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.deepPurple,
                ),
                onPressed: () {},
              ),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Chip(
                    label: Text("data"),
                    backgroundColor: Colors.deepPurple,
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  Text(
                    detailLivraison.produitlivre,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 39, 23, 185),
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Text(
                    detailLivraison.quantitelivre,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 39, 23, 185),
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Text(
                    detailLivraison.prixpaye,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 39, 23, 185),
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Text(
                    detailLivraison.nomclient,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 39, 23, 185),
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Text(
                    detailLivraison.prenomclient,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 39, 23, 185),
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  Text(
                    detailLivraison.contactclient,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 39, 23, 185),
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Text(
                    detailLivraison.adresseclient,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 39, 23, 185),
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
