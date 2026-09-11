import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clear Scan',
      theme: ThemeData(primarySwatch: Colors.green, useMaterial3: true),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _ctrl = TextEditingController();
  String _result = "Ready to scan";
  String _hash = "";

  void _scan() {
    var text = _ctrl.text;
    if (text.isEmpty) return;
    var h = sha256.convert(utf8.encode(text)).toString();
    setState(() {
      _hash = h;
      _result = text.toLowerCase().contains("scam") ? "⚠️ SUSPECT" : "✅ SAFE";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Operation Clear Scan v3.2.1"), backgroundColor: Colors.green, foregroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(Icons.shield, size: 80, color: Colors.green),
            TextField(controller: _ctrl, decoration: const InputDecoration(border: OutlineInputBorder(), labelText: "Enter link / text")),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _scan, style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white, minimumSize: const Size(double.infinity, 50)), child: const Text("SCAN NOW")),
            const SizedBox(height: 20),
            Text(_result, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(_hash, style: const TextStyle(fontSize: 9)),
          ],
        ),
      ),
    );
  }
}
