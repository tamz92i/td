import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Sale {
  final String seller;
  final String sale;
  final double price;
  final String status;

  Sale({required this.seller, required this.sale, required this.price, required this.status});
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
        '/': (context) => LoginPage(),
        '/sales': (context) => SalesPage(),
        '/newSale': (context) => NewSalePage(onSaleAdded: (Sale ) {  },),
        '/ranking': (context) => RankingPage(sales: SalesPage.sales),
        '/stats': (context) => StatsPage(sales: SalesPage.sales),
      },
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Replace this with your authentication logic
                // For now, just navigate to the sales page
                Navigator.pushNamed(context, '/sales');
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class SalesPage extends StatefulWidget {
  static List<Sale> sales = [];

  static void updateSales(Sale sale) {
    sales.add(sale);
  }

  @override
  _SalesPageState createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sales Tracker'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/newSale');
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
                Navigator.pushNamed(context, '/ranking');
              },
            ),
            ListTile(
              title: Text('Statistiques'),
              onTap: () {
                Navigator.pushNamed(context, '/stats');
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
  final TextEditingController _statusController = TextEditingController();
  final Function(Sale) onSaleAdded;

  NewSalePage({required this.onSaleAdded});

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
            TextField(
              controller: _statusController,
              decoration: InputDecoration(labelText: 'Statut'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final sale = Sale(
                  seller: _sellerController.text,
                  sale: _saleController.text,
                  price: double.tryParse(_priceController.text) ?? 0.0,
                  status: _statusController.text,
                );
                onSaleAdded(sale);
                Navigator.pop(context);
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

class StatsPage extends StatelessWidget {
  final List<Sale> sales;

  StatsPage({required this.sales});

  @override
  Widget build(BuildContext context) {
    Map<String, int> salesStats = {};

    sales.forEach((sale) {
      if (salesStats.containsKey(sale.seller)) {
        salesStats[sale.seller] = salesStats[sale.seller]! + 1;
      } else {
        salesStats[sale.seller] = 1;
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Statistiques'),
      ),
      body: ListView.builder(
        itemCount: salesStats.length,
        itemBuilder: (context, index) {
          final seller = salesStats.keys.elementAt(index);
          final salesCount = salesStats.values.elementAt(index);

          return ListTile(
            title: Text(seller),
            subtitle: Text('Nombre de ventes: $salesCount'),
          );
        },
      ),
    );
  }
}