import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'providers/data_provider.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/opportunities_screen.dart';
import 'screens/applications_screen.dart';
import 'screens/messaging_screen.dart';
import 'screens/notifications_screen.dart';
import 'screens/admin_panel_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => DataProvider()),
      ],
      child: SkillBridgeApp(),
    ),
  );
}

class SkillBridgeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SkillBridge',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/login',
      routes: {
        '/login': (_) => LoginScreen(),
        '/register': (_) => RegisterScreen(),
        '/dashboard': (_) => DashboardScreen(),
        '/opportunities': (_) => OpportunitiesScreen(),
        '/applications': (_) => ApplicationsScreen(),
        // TODO: Pass actual user IDs dynamically, not hardcoded values
        '/messaging': (_) => MessagingScreen(userId: 'CURRENT_USER_ID', otherUserId: 'OTHER_USER_ID'),
        '/notifications': (_) => NotificationsScreen(),
        '/admin': (_) => AdminPanelScreen(),
      },
      home: Consumer<AuthProvider>(
        builder: (context, auth, _) {
          return auth.isAuthenticated ? DashboardScreen() : LoginScreen();
        },
      ),
    );
  }
}
