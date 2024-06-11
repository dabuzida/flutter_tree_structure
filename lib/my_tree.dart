import 'package:flutter/material.dart';
import 'package:flutter_tree/flutter_tree.dart';

class MyTree extends StatefulWidget {
  const MyTree({super.key});

  @override
  State<MyTree> createState() => _MyTreeState();
}

class _MyTreeState extends State<MyTree> {
  Future<List<TreeNodeData>> _load(TreeNodeData parent) async {
    await Future.delayed(const Duration(seconds: 1));
    final data = [
      TreeNodeData(
        title: 'Load node 1',
        expaned: false,
        checked: true,
        children: [],
        extra: null,
      ),
      TreeNodeData(
        title: 'Load node 2',
        expaned: false,
        checked: false,
        children: [],
        extra: null,
      ),
    ];

    return data;
  }

  final List<TreeNodeData> aa = <TreeNodeData>[
    TreeNodeData(
      title: 'title',
      expaned: true,
      checked: false,
      children: <TreeNodeData>[],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return TreeView(
      data: aa,
      // data: <TreeNodeData>[],
      lazy: true,
      load: _load,
      showActions: true,
      showCheckBox: true,
      showFilter: true,
      append: (parent) {
        print(parent.extra);
        return TreeNodeData(
          title: 'Appended',
          expaned: true,
          checked: true,
          children: [],
        );
      },
      onLoad: (node) {
        print('onLoad');
        print(node);
      },
      onAppend: (node, parent) {
        print('onAppend');
        print(node);
      },
      onCheck: (checked, node) {
        print('checked');
        print('onCheck');
        print(node);
      },
      onCollapse: (node) {
        print('onCollapse');
        print(node);
      },
      onExpand: (node) {
        print('onExpand');
        print(node);
      },
      // onRemove: (node, parent) {
      //   print('onRemove');
      //   print(node);
      // },
      onTap: (node) {
        print('onTap');
        print(node);
      },
    );
  }
}
