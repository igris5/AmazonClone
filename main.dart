import 'package:amazonclone/common/widgets/bottom_bar.dart';
import 'package:amazonclone/constants/globle_variable.dart';
import 'package:amazonclone/features/auth/screens/auth_screen.dart';
import 'package:amazonclone/features/auth/services/auth_service.dart';
import 'package:amazonclone/features/home/screens/home_screens.dart';
import 'package:amazonclone/providers/user_provider.dart';
import 'package:amazonclone/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=>UserProvider(),)
  ],child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp>{
  final AuthService authService = AuthService();
  // This widget is the root of your application.
  @override
  void initState(){
    super.initState();
    authService.getUserData(context);

  }
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon Clone',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor,
        ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          iconTheme:IconThemeData( color: Colors.black)

        ),

        primarySwatch: Colors.blue,
      ),
       onGenerateRoute: ((settings) => generateRoute(settings)),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty ? const BottomBar(): const AuthScreen(),
    );
  }
}

