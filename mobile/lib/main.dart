import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/auth_screen.dart';
import 'screens/home_screen.dart';

Future<void> main() async { WidgetsFlutterBinding.ensureInitialized(); await MobileAds.instance.initialize(); runApp(const TalabatApp()); }
class TalabatApp extends StatelessWidget { const TalabatApp({super.key}); @override Widget build(BuildContext c)=>MaterialApp(debugShowCheckedModeBanner:false,title:'طلبات',theme:ThemeData(useMaterial3:true,fontFamily:'Arial'),home:const AuthGate()); }
class AuthGate extends StatefulWidget { const AuthGate({super.key}); @override State<AuthGate> createState()=>_AuthGateState(); }
class _AuthGateState extends State<AuthGate>{ bool loading=true, logged=false; @override void initState(){super.initState();check();} Future<void> check() async { final p=await SharedPreferences.getInstance(); if(mounted)setState(()=>{logged=p.getString('token')!=null,loading=false}); }
@override Widget build(BuildContext c){ if(loading)return const Scaffold(body:Center(child:CircularProgressIndicator())); return logged?HomeScreen(onLogout:check):AuthScreen(onDone:check); } }
