import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:proyecto_personal/screens/gestionarRecetas.screen.dart';
import 'package:proyecto_personal/screens/home.screen.dart';
import 'package:proyecto_personal/screens/login.screen.dart';
import 'package:proyecto_personal/screens/recetas.screen.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 200.0,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('images/Ozin.jpeg', height: 80.0),
                  SizedBox(height: 10),
                  Text(
                    'Bienvenido',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    user?.email ?? 'usuario@ejemplo.com',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Inicio'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.receipt_long),
            title: Text('Recetas'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => RecetasScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.cookie),
            title: Text('Gestionar Recetas'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => GestionarRecetasScreen()),
              );
            },
          ),
          ExpansionTile(
            leading: Icon(Icons.person),
            title: Text('Perfil'),
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Cerrar Sesión'),
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            LoginScreen()), // Asegúrate de que LoginScreen esté importado y definido
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
