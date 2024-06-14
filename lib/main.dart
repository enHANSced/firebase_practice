import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_with_firebase/Widgets/home.dart';
import 'package:flutter_with_firebase/Widgets/nuevo.dart';
import 'package:flutter_with_firebase/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_with_firebase/services/notifications_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await iniNotifications();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // make navigation bar transparent
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
    ),
  );
  // make flutter draw behind navigation bar
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter y Firebase',
      theme: ThemeData.light(), // Tema claro
      darkTheme: ThemeData.dark(), // Tema oscuro
      themeMode: ThemeMode.system, // Usa el tema según la configuración del sistema
      initialRoute: '/',
      routes: {
        "/": (context) => const HomePage(),
        "/add": (context) => const NuevaPersona(),
      },
    );
  }
}
