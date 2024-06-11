import 'package:flutter/material.dart';
import 'package:flutter_tree_structure/gkv_tree_view.dart';
import 'package:flutter_tree_structure/my_animated_tree_view.dart';
import 'package:flutter_tree_structure/my_list_tree_view2.dart';
import 'package:flutter_tree_structure/my_tree_view.dart';

import 'my_list_tree_view.dart';
import 'my_tree.dart';

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
      body: const GkvTreeView(),

      //
      // body: const MyAnimatedTreeView(),
      // body: const MyListTreeView2(), // https://pub.dev/packages/list_treeview/example
      // body: const MyTree(), //1 https://stackoverflow.com/questions/72246695/how-to-modify-flutter-tree-package-for-select-all-children
      //2 https://pub.dev/packages/flutter_tree/example
      // body: const MyTreeView(), // https://pub.dev/packages/flutter_treeview/example

      // flutter_treeview: ^1.0.7+1
      // animated_tree_view: ^2.2.0

      // list_treeview: ^0.3.1

// parent_child_checkbox: ^0.0.5
      // https://pub.dev/packages/parent_child_checkbox
    );
  }
}
