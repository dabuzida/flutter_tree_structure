// import 'package:flutter/material.dart';
// import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';

// class MyFancyTreeView extends StatefulWidget {
//   const MyFancyTreeView({super.key});

//   @override
//   State<MyFancyTreeView> createState() => _MyFancyTreeViewState();
// }

// class _MyFancyTreeViewState extends State<MyFancyTreeView> {
//   static const List<MyNode> roots = <MyNode>[
//     MyNode(
//       title: 'Root 1',
//       children: <MyNode>[
//         MyNode(
//           title: 'Node 1.1',
//           children: <MyNode>[
//             MyNode(title: 'Node 1.1.1'),
//             MyNode(title: 'Node 1.1.2'),
//           ],
//         ),
//         MyNode(title: 'Node 1.2'),
//       ],
//     ),
//     MyNode(
//       title: 'Root 2',
//       children: <MyNode>[
//         MyNode(
//           title: 'Node 2.1',
//           children: <MyNode>[
//             MyNode(title: 'Node 2.1.1'),
//           ],
//         ),
//         MyNode(title: 'Node 2.2')
//       ],
//     ),
//   ];

//   late final TreeController<MyNode> treeController;

//   @override
//   void initState() {
//     super.initState();
//     treeController = TreeController<MyNode>(
//       roots: roots,
//       childrenProvider: (MyNode node) => node.children,
//     );
//   }

//   @override
//   void dispose() {
//     treeController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return TreeView<MyNode>(
//       treeController: treeController,
//       nodeBuilder: (BuildContext context, TreeEntry<MyNode> entry) {
//         return MyTreeTile(
//           key: ValueKey(entry.node),
//           entry: entry,
//           onTap: () => treeController.toggleExpansion(entry.node),
//         );
//       },
//     );
//   }
// }

// class MyNode {
//   const MyNode({
//     required this.title,
//     this.children = const <MyNode>[],
//   });

//   final String title;
//   final List<MyNode> children;
// }

// class MyTreeTile extends StatelessWidget {
//   const MyTreeTile({
//     super.key,
//     required this.entry,
//     required this.onTap,
//   });

//   final TreeEntry<MyNode> entry;
//   final VoidCallback onTap;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: TreeIndentation(
//         entry: entry,
//         guide: const IndentGuide.connectingLines(indent: 48),
//         child: Padding(
//           padding: const EdgeInsets.fromLTRB(4, 8, 8, 8),
//           child: Row(
//             children: [
//               FolderButton(
//                 isOpen: entry.hasChildren ? entry.isExpanded : null,
//                 onPressed: entry.hasChildren ? onTap : null,
//               ),
//               Text(entry.node.title),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
