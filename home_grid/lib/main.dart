import 'package:flutter/material.dart';

void main() {
  runApp(const HospitalApp());
}

class HospitalApp extends StatelessWidget {
  const HospitalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hospital Menu',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: const MenuHospital(),
    );
  }
}

class MenuHospital extends StatelessWidget {
  const MenuHospital({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Hospital'),
        backgroundColor: Colors.deepOrange,
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(20),
        crossAxisCount: 3,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        children: [
          MenuButton(
            icon: Icons.calendar_today,
            label: 'Citas Médicas',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CitasMedicas()),
            ),
          ),
          const MenuButton(
            icon: Icons.emergency,
            label: 'Urgencias',
          ),
          const MenuButton(
            icon: Icons.medical_services,
            label: 'Especialistas',
          ),
          const MenuButton(
            icon: Icons.local_pharmacy,
            label: 'Farmacia',
          ),
          const MenuButton(
            icon: Icons.local_pharmacy,
            label: 'Pacientes',
          ),
          const MenuButton(
            icon: Icons.healing,
            label: 'Terapias',
          ),
          const MenuButton(
            icon: Icons.science,
            label: 'Laboratorio',
          ),
          const MenuButton(
            icon: Icons.bloodtype,
            label: 'Sangre',
          ),
          const MenuButton(
            icon: Icons.person,
            label: 'Rehabilitación',
          ),
          const MenuButton(
            icon: Icons.medication,
            label: 'Consulta',
          ),
          const MenuButton(
            icon: Icons.info,
            label: 'Informes',
          ),
          const MenuButton(
            icon: Icons.calendar_month,
            label: 'Calendario',
          ),
          const MenuButton(
            icon: Icons.payment,
            label: 'Pagos',
          ),
          const MenuButton(
            icon: Icons.contact_page,
            label: 'Contacto',
          ),
          const MenuButton(
            icon: Icons.info,
            label: 'Información',
          ),
        ],
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const MenuButton({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30,
              color: Colors.deepOrange,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CitasMedicas extends StatelessWidget {
  const CitasMedicas({super.key});

  @override
  Widget build(BuildContext context) {
    final specialties = [
      'Medicina General',
      'Odontología',
      'Psicología',
      'Cardiología',
      'Neurología',
      'Ginecología',
      'Dermatología',
      'Pediatría',
      'Oftalmología',
      'Ortopedia',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Citas Médicas'),
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView.builder(
        itemCount: specialties.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(
              Icons.medical_services,
              color: Colors.deepOrange,
            ),
            title: Text(specialties[index]),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          );
        },
      ),
    );
  }
}
