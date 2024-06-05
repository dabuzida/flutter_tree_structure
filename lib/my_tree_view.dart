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
    return Container(
      width: 500,
      height: 500,
      decoration: BoxDecoration(border: Border.all(color: Colors.red)),
      child: TreeView(
        controller: _treeViewController,
        onNodeTap: (String value) {},
        onNodeDoubleTap: (p0) {},
        physics: const ScrollPhysics(),
        onExpansionChanged: (p0, p1) {},
        allowParentSelect: false,
        supportParentDoubleTap: false,
        shrinkWrap: false,
        primary: true,
        nodeBuilder: (p0, p1) {
          return Container(width: 10, height: 10, color: Colors.amber);
        },
        theme: TreeViewTheme(
            // colorScheme:
            // colorScheme:

            ),
      ),
    );
  }
}
