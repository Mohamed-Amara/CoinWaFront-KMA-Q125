import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/coin_provider.dart';
import 'package:flutter_application_1/Providers/friend_provider.dart';
import 'package:flutter_application_1/Providers/leader_provider.dart';
import 'package:flutter_application_1/Providers/profile_provider.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Login-Logout/login2.dart';
import 'package:flutter_application_1/Login-Logout/home_screen.dart'; // Ensure you have a home screen
import 'package:provider/provider.dart';
import 'Providers/lives_provider.dart'; // Import the LivesProvider
import 'welcome_page.dart'; // Import the WelcomePage

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LivesProvider(context)),
        ChangeNotifierProvider(
          create: (context) => CoinProvider(context),
        ),
        ChangeNotifierProvider(
          create: (context) => ProgressProvider(context),
        ),
        ChangeNotifierProvider(
          create: (context) => LeaderProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileProvider(context),
        ),
        ChangeNotifierProvider(
          create: (context) => FriendProvider(context),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Financial Literacy App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => const WelcomePage(),
        '/': (context) => const AppWithOverlay(),
        '/login': (context) => const Login2App(),
        '/home': (context) => const HomeScreen(),
        // Add other routes here
      },
    );
  }
}

class AppWithOverlay extends StatelessWidget {
  const AppWithOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [HomeScreen()],
    );
  }
}
