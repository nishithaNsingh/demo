import 'package:demo_fusionflourish_hub/authentication/reg_screen.dart';
import 'package:demo_fusionflourish_hub/authentication/signin_screen.dart';
import 'package:demo_fusionflourish_hub/authentication/signup_screen.dart';

import 'package:demo_fusionflourish_hub/creator/post.dart';
import 'package:demo_fusionflourish_hub/creator/search.dart';
import 'package:demo_fusionflourish_hub/screens/splash_screen.dart';
import 'package:demo_fusionflourish_hub/screens/community/communitymain.dart';
import 'package:demo_fusionflourish_hub/screens/navbar_screen.dart';
import 'package:demo_fusionflourish_hub/screens/learnscreen/learn_screen.dart';
import 'package:demo_fusionflourish_hub/screens/storiesscreen/storiesmain.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'creator/createmain.dart';


Future<void> main() async {
  await Supabase.initialize(
    url: 'https://gvosllkqzgnclphwgsmi.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imd2b3NsbGtxemduY2xwaHdnc21pIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDk3NDkyODksImV4cCI6MjAyNTMyNTI4OX0.wI7sCzmf2cgIW8QY5_Q6qkcVnulrYyFW6jIP-5iKaTo',
  );
  runApp(MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FusionFlourish',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (_) => const SplashScreen(),
        '/home_screen':(_) => const NavBarScreen(),
        // '/login': (_) => const SignInScreen(),
        '/account': (_) => const RegistrationScreen(),
        '/signup':(_) => const SignUpScreen(),
        '/createscreen':(_) => const CreateScreen(),
        '/post':(_) => const PostScreen(),
        '/learn':(_) =>  LearnScreen(),
        '/search':(_) => const SearchScreen(),
        '/communitymain':(_) =>  const CommunityMain(),
        '/storiesymain':(_) =>  const StoriesMain(),
        '/navbarscreen':(_) =>  const NavBarScreen(),
      },
    );
  }
}