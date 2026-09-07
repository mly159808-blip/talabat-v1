import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'screens/home_screen.dart';
Future<void> main() async{WidgetsFlutterBinding.ensureInitialized();await MobileAds.instance.initialize();runApp(const TalabatApp());}
class TalabatApp extends StatelessWidget{const TalabatApp({super.key});Widget build(BuildContext c)=>MaterialApp(debugShowCheckedModeBanner:false,title:"طلبات",theme:ThemeData(useMaterial3:true,fontFamily:"Arial"),home:const HomeScreen());}
