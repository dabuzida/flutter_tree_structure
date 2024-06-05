import 'package:animated_tree_view/animated_tree_view.dart';
import 'package:flutter/material.dart';

class MyAnimatedTreeView extends StatefulWidget {
  const MyAnimatedTreeView({super.key});

  @override
  State<MyAnimatedTreeView> createState() => _MyAnimatedTreeViewState();
}

class _MyAnimatedTreeViewState extends State<MyAnimatedTreeView> {
  TreeViewController? _controller;
  bool showSnackBar = false;
  bool expandChildrenOnReady = true;

  final sampleTree = TreeNode.root()
    ..addAll(
      [
        TreeNode(key: "0A")..add(TreeNode(key: "0A1A")),
        TreeNode(key: "0C")
          ..addAll([
            TreeNode(key: "0C1A"),
            TreeNode(key: "0C1B"),
            TreeNode(key: "0C1C")
              ..addAll([
                TreeNode(key: "0C1C2A")
                  ..addAll([
                    TreeNode(key: "0C1C2A3A"),
                    TreeNode(key: "0C1C2A3B"),
                    TreeNode(key: "0C1C2A3C"),
                  ]),
              ]),
          ]),
        TreeNode(key: "0D"),
        TreeNode(key: "0E"),
      ],
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('widget.title'),
      ),
      floatingActionButton: ValueListenableBuilder<bool>(
        valueListenable: sampleTree.expansionNotifier,
        builder: (context, isExpanded, _) {
          return FloatingActionButton.extended(
            onPressed: () {
              if (sampleTree.isExpanded) {
                _controller?.collapseNode(sampleTree);
              } else {
                _controller?.expandAllChildren(sampleTree);
              }
            },
            label: isExpanded ? const Text("Collapse all") : const Text("Expand all"),
          );
        },
      ),
      body: TreeView.simple(
        tree: sampleTree,
        showRootNode: true,
        expansionIndicatorBuilder: (context, node) => ChevronIndicator.rightDown(
          tree: node,
          color: Colors.blue[700],
          padding: const EdgeInsets.all(8),
        ),
        indentation: const Indentation(style: IndentStyle.squareJoint),
        onItemTap: (item) {
          // if (kDebugMode) print("Item tapped: ${item.key}");

          if (showSnackBar) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Item tapped: ${item.key}"),
                duration: const Duration(milliseconds: 750),
              ),
            );
          }
        },
        onTreeReady: (controller) {
          _controller = controller;
          if (expandChildrenOnReady) controller.expandAllChildren(sampleTree);
        },
        builder: (context, node) => Card(
          // color: colorMapper[node.level.clamp(0, colorMapper.length - 1)]!,
          child: ListTile(
            title: Text("Item ${node.level}-${node.key}"),
            subtitle: Text('Level ${node.level}'),
          ),
        ),
      ),
    );
  }
}
