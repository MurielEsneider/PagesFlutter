import 'package:flutter/material.dart';

class CompanyHolding {
  // Atributos
  List<Map<String, dynamic>> companies = [];
  double totalRevenue = 0.0;

  // Método para añadir una empresa
  void addCompany(String name, String sector) {
    companies.add({"name": name, "sector": sector, "revenue": 0.0});
  }

  // Método para añadir ingresos a una empresa específica
  void addRevenue(String name, double revenue) {
    for (var company in companies) {
      if (company['name'] == name) {
        company['revenue'] += revenue;
        break;
      }
    }
  }

  // Método para calcular los ingresos totales
  void calculateTotalRevenue() {
    totalRevenue = 0.0; // Reinicia los ingresos totales
    for (var company in companies) {
      totalRevenue += company["revenue"];
    }
  }

  // Método para mostrar las empresas y sus sectores
  List<Map<String, dynamic>> getCompanies() {
    return companies;
  }
}

void main() {
  runApp(CompanyHoldingApp());
}

class CompanyHoldingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Holding de Empresas',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CompanyHolding holding = CompanyHolding();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController sectorController = TextEditingController();
  final Map<String, TextEditingController> revenueControllers = {};

  void _addCompany() {
    final name = nameController.text;
    final sector = sectorController.text;

    if (name.isNotEmpty && sector.isNotEmpty) {
      setState(() {
        holding.addCompany(name, sector);
        revenueControllers[name] = TextEditingController();
      });
      nameController.clear();
      sectorController.clear();
    }
  }

  void _addRevenue(String name) {
    final revenue =
        double.tryParse(revenueControllers[name]?.text ?? '') ?? 0.0;

    if (revenue > 0) {
      setState(() {
        holding.addRevenue(name, revenue);
      });
      revenueControllers[name]?.clear();
    }
  }

  void _calculateRevenue() {
    setState(() {
      holding.calculateTotalRevenue();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Holding de Empresas'),
      ),
      body: Container(
        color: Colors.grey[200],
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Nombre de la Empresa',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: sectorController,
              decoration: InputDecoration(
                labelText: 'Sector de la Empresa',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
              onPressed: _addCompany,
              child: Text(
                'Añadir Empresa',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Empresas Registradas:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: holding.getCompanies().length,
                itemBuilder: (context, index) {
                  final company = holding.getCompanies()[index];
                  final name = company['name'];

                  return Card(
                    color: Colors.white,
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nombre: ${company['name']}, Sector: ${company['sector']}",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Ingresos: \$${company['revenue'].toStringAsFixed(2)}",
                            style: TextStyle(fontSize: 16, color: Colors.green),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: revenueControllers[name],
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText: 'Añadir Ingresos',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueAccent,
                                ),
                                onPressed: () => _addRevenue(name),
                                child: Text('Añadir'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            if (holding.totalRevenue > 0)
              Text(
                'Ingresos Totales: \$${holding.totalRevenue.toStringAsFixed(2)}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.green,
                ),
              ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                backgroundColor: Colors.blue,
              ),
              onPressed: _calculateRevenue,
              child: Text(
                'Calcular Ingresos Totales',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
