import 'package:flutter/material.dart';
import 'package:projet_iai/models.dart';
import 'detailLivraison.dart';
import 'homepage.dart';

class ModifyDetails extends StatefulWidget {
  ModifyDetails({
    Key? key,
    required this.detailLivraison,
  }) : super(key: key);

  final DetailLivraison detailLivraison;

  @override
  _ModifyDetailsState createState() => _ModifyDetailsState();
}

class _ModifyDetailsState extends State<ModifyDetails> {
  TextEditingController _produitLivreController = TextEditingController();
  TextEditingController _quantiteLivreController = TextEditingController();
  TextEditingController _prixPayeController = TextEditingController();
  TextEditingController _nomClientController = TextEditingController();
  TextEditingController _prenomClientController = TextEditingController();
  TextEditingController _contactClientController = TextEditingController();
  TextEditingController _adresseClientController = TextEditingController();
  TextEditingController _localisationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _produitLivreController =
        TextEditingController(text: widget.detailLivraison.produitlivre);
    _quantiteLivreController = TextEditingController(
        text: widget.detailLivraison.quantitelivre.toString());
    _prixPayeController =
        TextEditingController(text: widget.detailLivraison.prixpaye.toString());
    _nomClientController =
        TextEditingController(text: widget.detailLivraison.nomclient);
    _prenomClientController =
        TextEditingController(text: widget.detailLivraison.prenomclient);
    _contactClientController =
        TextEditingController(text: widget.detailLivraison.contactclient);
    _adresseClientController =
        TextEditingController(text: widget.detailLivraison.adresseclient);
    _localisationController =
        TextEditingController(text: widget.detailLivraison.localisation);
  }

  @override
  void dispose() {
    _produitLivreController.dispose();
    _quantiteLivreController.dispose();
    _prixPayeController.dispose();
    _nomClientController.dispose();
    _prenomClientController.dispose();
    _contactClientController.dispose();
    _adresseClientController.dispose();
    _localisationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Modifier Détails'),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(children: [
                  TextFormField(
                    controller: _produitLivreController,
                    decoration:
                        const InputDecoration(labelText: 'Produit Livré'),
                  ),
                  TextFormField(
                    controller: _quantiteLivreController,
                    decoration:
                        const InputDecoration(labelText: 'Quantité Livrée'),
                    keyboardType: TextInputType.number,
                  ),
                  TextFormField(
                    controller: _prixPayeController,
                    decoration: const InputDecoration(labelText: 'Prix Payé'),
                    keyboardType: TextInputType.number,
                  ),
                  TextFormField(
                    controller: _nomClientController,
                    decoration:
                        const InputDecoration(labelText: 'Nom du Client'),
                  ),
                  TextFormField(
                    controller: _prenomClientController,
                    decoration:
                        const InputDecoration(labelText: 'Prénom du Client'),
                  ),
                  TextFormField(
                    controller: _contactClientController,
                    decoration:
                        const InputDecoration(labelText: 'Contact Client'),
                    keyboardType: TextInputType.phone,
                  ),
                  TextFormField(
                      controller: _adresseClientController,
                      decoration:
                          const InputDecoration(labelText: 'Adresse Client')),
                  TextFormField(
                      controller: _localisationController,
                      decoration:
                          const InputDecoration(labelText: 'Localisation'))
                ]))));
  }
}
