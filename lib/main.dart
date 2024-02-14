import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Sale {
  final String seller;
  final String sale;
  final double price;

  Sale({required this.seller, required this.sale, required this.price});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sales Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SalesPage(),
        '/newSale': (context) => NewSalePage(),
        '/ranking': (context) => RankingPage(sales: [],),
      },
    );
  }
}

class SalesPage extends StatelessWidget {
  final List<Sale> sales = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sales Tracker'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/newSale').then((newSale) {
              if (newSale != null) {
                sales.add(newSale as Sale);
              }
            });
          },
          child: Text('Nouvelle Vente'),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text('Menu'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Classement'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RankingPage(sales: sales),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class NewSalePage extends StatelessWidget {
  final TextEditingController _sellerController = TextEditingController();
  final TextEditingController _saleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nouvelle Vente'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _sellerController,
              decoration: InputDecoration(labelText: 'Nom du Vendeur'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _saleController,
              decoration: InputDecoration(labelText: 'Vente réalisée'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _priceController,
              decoration: InputDecoration(labelText: 'Prix'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final sale = Sale(
                  seller: _sellerController.text,
                  sale: _saleController.text,
                  price: double.tryParse(_priceController.text) ?? 0.0,
                );
                Navigator.pop(context, sale);
              },
              child: Text('Enregistrer'),
            ),
          ],
        ),
      ),
    );
  }
}

class RankingPage extends StatelessWidget {
  final List<Sale> sales;

  RankingPage({required this.sales});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Classement des Ventes'),
      ),
      body: ListView.builder(
        itemCount: sales.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(sales[index].seller),
            subtitle: Text(sales[index].sale),
            trailing: Text('${sales[index].price}'),
          );
        },
      ),
    );
  }
}
