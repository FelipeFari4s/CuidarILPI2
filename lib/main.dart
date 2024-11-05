import 'package:cuidar_ilpi/Orientacoes/conteudo/Alimentacao.dart';
import 'package:cuidar_ilpi/Orientacoes/conteudo/HigieneCorporal.dart';
import 'package:cuidar_ilpi/Orientacoes/conteudo/Incontinencias.dart';
import 'package:cuidar_ilpi/Orientacoes/conteudo/Mudancas.dart';
import 'package:cuidar_ilpi/Orientacoes/conteudo/Sono.dart';
import 'package:cuidar_ilpi/Orientacoes/conteudo/Vestuario.dart';
import 'package:cuidar_ilpi/Orientacoes/orientacoes_atividades.dart';
import 'package:flutter/material.dart';
import 'package:cuidar_ilpi/pages/longinEsingUp_screen/login_screen.dart';
import 'package:cuidar_ilpi/pages/longinEsingUp_screen/singUp_screen.dart';
import 'package:cuidar_ilpi/pages/home/home_page.dart';
//import 'package:cuidar_ilpi/pages/monitoramento/monitoring_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cuidar_ilpi/Seguranca/Seguranca.dart';
import 'package:cuidar_ilpi/pages/monitoramento/monitoring.dart';
import 'package:cuidar_ilpi/Funcionalidade/Funcionalidade.dart';
import 'package:cuidar_ilpi/Referencias/referencias.dart';
import 'package:cuidar_ilpi/perfil/perfil.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => RoteadorTela(),
        '/login': (context) => const LoginScreen(),
        '/sign_up': (context) => const signUpScreen(),
        '/home': (context) => const RoteadorTela(),
        '/daily_activities': (context) => const DailyActivitiesScreen(),
        '/alimentacao': (context) => const AlimentacaoScreen(),
        '/higiene': (context) => const HigieneScreen(),
        '/vestuario': (context) => const VestuarioScreen(),
        '/incontinencias': (context) => const InconScreen(),
        '/mudancas': (context) => const MudancasScreen(),
        '/sono': (context) => const SonoScreen(),
        '/safety': (context) => const SafetyScreen(),
        '/fun': (context) => const FunScreen(),
        '/references': (context) => ReferenciasPage(),
        '/monitoramento': (context) => MonitoringScreen(user: FirebaseAuth.instance.currentUser!),
        '/profile': (context) => const UserProfileScreen(),
      },
    );
  }
}

class RoteadorTela extends StatefulWidget {
  const RoteadorTela({super.key});

  @override
  State<RoteadorTela> createState() => _RoteadorTelaState();
}

class _RoteadorTelaState extends State<RoteadorTela> {
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeFirebase();
  }

  Future<void> _initializeFirebase() async {
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      setState(() {
        _isInitialized = true;
      });
    } catch (e) {
      print('Erro ao inicializar Firebase: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (snapshot.hasData) {
          return MyHomePage(user: snapshot.data!); //Monitoramento(user: snapshot.data!,);//
        }

        return const LoginScreen();
      },
    );
  }
}
