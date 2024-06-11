import 'package:flutter/material.dart';
import 'package:flutter_treeview/flutter_treeview.dart';

class MyTreeView extends StatefulWidget {
  const MyTreeView({Key? key}) : super(key: key);

  @override
  State<MyTreeView> createState() => _MyTreeViewState();
}

class _MyTreeViewState extends State<MyTreeView> {
  final TreeViewController _treeViewController = TreeViewController();

  @override
  Widget build(BuildContext context) {
    final TreeViewTheme treeViewTheme = TreeViewTheme(
      expanderTheme: ExpanderThemeData(
        size: 24,
        color: Colors.red.shade300,
      ),
      labelStyle: const TextStyle(
        fontSize: 16,
        letterSpacing: 0.3,
      ),
      parentLabelStyle: TextStyle(
        fontSize: 16,
        letterSpacing: 0.1,
        fontWeight: FontWeight.w800,
        color: Colors.blue.shade700,
      ),
      iconTheme: IconThemeData(
        size: 18,
        color: Colors.grey.shade800,
      ),
      colorScheme: Theme.of(context).colorScheme,
    );

    return Container(
      width: 500,
      height: 500,
      decoration: BoxDecoration(border: Border.all(color: Colors.red)),
      child: TreeView(
        controller: _treeViewController,
        allowParentSelect: true,
        onNodeTap: (String value) {},
        onNodeDoubleTap: (p0) {},
        physics: const ScrollPhysics(),
        onExpansionChanged: (p0, p1) {},
        supportParentDoubleTap: false,
        shrinkWrap: false,
        primary: true,
        nodeBuilder: (p0, p1) {
          return Container(width: 10, height: 10, color: Colors.amber);
        },
        theme: treeViewTheme,

        // theme: TreeViewTheme(
        //     // colorScheme:
        //     // colorScheme:
        //     ),
      ),
    );
  }
}
