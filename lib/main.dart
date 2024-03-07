import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CodeCenter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'CodeCenter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class UsuarioView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Vista de Usuario', style: Theme.of(context).textTheme.headline6));
  }
}

class NovedadesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Vista de Novedades', style: Theme.of(context).textTheme.headline6));
  }
}

class ConfiguracionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Vista de Configuración', style: Theme.of(context).textTheme.headline6));
  }
}

class MensajesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Vista de Mensajes', style: Theme.of(context).textTheme.headline6));
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedItemIndex = 0;
  int _selectedIndex = 0; // Index para BottomNavigationBar

  final Map<String, String> _items = {
    'Dart': 'Dart es un lenguaje de programación optimizado para aplicaciones en múltiples plataformas. Es desarrollado por Google y es el lenguaje detrás de Flutter.',
    'Flutter': 'Flutter es un SDK de código abierto de Google para la creación de interfaces de usuario de alta calidad para móviles, web y escritorio a partir de una base de código única.',
    'JavaScript': 'JavaScript es un lenguaje de programación de alto nivel, interpretado y orientado a objetos, conocido por su uso en desarrollo web.',
    'Python': 'Python es un lenguaje de programación de alto nivel, interpretado, de propósito general y con una filosofía de diseño que enfatiza la legibilidad del código.',
    'Rust': 'Rust es un lenguaje de programación compilado, de propósito general, desarrollado por Mozilla. Está diseñado para ser seguro, concurrente y práctico.',
    // Agrega más elementos según sea necesario
  };

  void _onSelectItem(int index) {
    setState(() {
      _selectedItemIndex = index;
    });
    Navigator.of(context).pop(); // Cierra el drawer
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetOptions = [
      UsuarioView(),
      NovedadesView(),
      ConfiguracionView(),
      MensajesView(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: Drawer(
        child: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (context, index) {
            String key = _items.keys.elementAt(index);
            return ListTile(
              title: Text(key),
              selected: index == _selectedItemIndex,
              onTap: () => _onSelectItem(index),
            );
          },
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Usuario',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.new_releases),
            label: 'Novedades',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Configuración',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Mensajes',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purpleAccent,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
    );
  }
}
