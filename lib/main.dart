import 'package:flutter/material.dart';
import 'package:flutter_tree_structure/my_animated_tree_view.dart';
import 'package:flutter_tree_structure/my_tree_view.dart';

import 'my_fancy_tree_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tree Structure',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyContainer(),
    );
  }
}

class MyContainer extends StatelessWidget {
  const MyContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tree Structure'),
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      // body: const MyFancyTreeView(), // package error
      body: const MyAnimatedTreeView(),
      // body: const MyAnimatedTreeView(),
      // body: const MyAnimatedTreeView(),
      // body: const MyAnimatedTreeView(),
      // body: const MyAnimatedTreeView(),
      // body: const MyTreeView(),

      // flutter_treeview: ^1.0.7+1
      // animated_tree_view: ^2.2.0
      // flutter_fancy_tree_view: ^1.6.0 // 어느 업체가 만들어서 유료가능성

      // flutter_braintree: ^4.0.0
      // flutter_simple_treeview: ^3.0.2
      // list_treeview: ^0.3.1
    );
  }
}
