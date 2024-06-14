import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_tree_structure/gkv_data.dart';

class GkvTreeView extends StatefulWidget {
  const GkvTreeView({super.key});

  @override
  State<GkvTreeView> createState() => _GkvTreeViewState();
}

class MyNode {
  String? prefix;
  Map<String, MyNode?> children = <String, MyNode?>{};
  // Map<String, MyNode?> children;

  MyNode() {
    // children = <String, MyNode?>{};
  }

  // MyNode.test({String prefix = ''}) {
  //   children = <String, MyNode?>{prefix: null};
  // }

  MyNode.makeChildren({required this.prefix, required List<String> childList}) {
    for (String element in childList) {
      children.addEntries(<String, MyNode?>{element: null}.entries);
    }
  }

  void add({required String keyPrefix, required MyNode valueChildren}) {
    children[keyPrefix] = valueChildren;
  }
}

class _GkvTreeViewState extends State<GkvTreeView> {
  // GKVData.groupList
  final MyNode _data = MyNode();

  final List<Widget> _widgets = <Widget>[];

  @override
  void initState() {
    super.initState();
    const String prefix = 'empty';

    final MyNode root = MyNode.makeChildren(prefix: prefix, childList: GKVData.groupChildList(prefix: prefix));
    _data.add(keyPrefix: prefix, valueChildren: root);
    // final MyNode node = MyNode.test2(childList: GKVData.groupChildList(prefix: prefix));
    // _data = MyNode.test2(prefix: prefix, childList: GKVData.groupChildList(prefix: prefix));
    // _data.children[prefix] = node;

    _widgets.clear();
    final MyNode subNode = _data.children[prefix]!;
    subNode.children.forEach(
      (String key, MyNode? value) {
        print(key);
        print(_data.children[prefix]);
        print(subNode.children[key]);
        print(subNode.children);

        _widgets.add(
          FilledButton.tonal(
            onPressed: () {
              final MyNode node = MyNode.makeChildren(prefix: key, childList: GKVData.groupChildList(prefix: key));
              // value!.add(keyPrefix: key, valueChildren: node);
              subNode.add(keyPrefix: key, valueChildren: node);
              setState(() {});
            },
            child: Text('key: $key'),
          ),
        );
      },
    );

    setState(() {});

    // Future<void>.delayed(const Duration(seconds: 2), _xx);
  }

  Future<void> _xx() async {
    // print(_data.children);
    // print(_data.children.keys);
    // print(_data.children.keys.length);
    // print(_data.children.values);

    // _data.children.entries.forEach(
    //   (MapEntry<String, MyNode?> element) {
    //     print('>> key: ${element.key}, value: ${element.value}');
    //   },
    // );

    // 1
    print(1);
    for (final MapEntry<String, MyNode?> element in _data.children.entries) {
      print('key: ${element.key}, value: ${element.value}');
    }

    // 2
    print(2);
    for (final MyNode? element in _data.children.values) {
      // print(element?.children);
      // print(element?.children.entries);
      // element?.children;
      // element?.children.entries;

      if (element != null) {
        element.children.update(
          'alzwin',
          (MyNode? value) {
            return value;
            return MyNode();
          },
        );

        for (final MapEntry<String, MyNode?> element in element.children.entries) {
          print('key: ${element.key}, value: ${element.value}');
        }
      }

      //
    }

    //
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: <Widget>[
          //     Text(_data.children.toString()),
          //     Text(_data.children['empty']!.children.toString()),
          //     // Text(jsonString),
          //   ],
          // ),
          Container(
            width: 500,
            height: 500,
            decoration: BoxDecoration(border: Border.all(color: Colors.red)),
            child: ListView(
              key: UniqueKey(),
              children: _widgets,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                child: const Text('prefix: (empty)'),
                onPressed: () {
                  const String prefix = '';

                  final MyNode node = MyNode.makeChildren(prefix: prefix, childList: GKVData.groupChildList(prefix: prefix));
                  _data.children[prefix] = node;

//
                  _widgets.clear();
                  _data.children.forEach(
                    (String key, MyNode? value) {
                      _widgets.add(
                        FilledButton.tonal(
                          onPressed: () {
                            for (final String element in GKVData.groupChildList(prefix: key)) {
                              // final MyNode ww =
                              // _data.children[key]!.children[element] = null;
                            }

                            setState(() {});
                          },
                          child: Text('key: $key'),
                        ),
                      );
                    },
                  );

                  setState(() {});
                },
              ),
              FilledButton.tonal(
                onPressed: _xx,
                child: const Text('2단계'),
              ),
              FilledButton(
                child: const Text('debug'),
                onPressed: () {
                  _data;
                },
              ),
            ],
          ),
        ],
      ),
    );

    // return Center(
    //   child: SizedBox(
    //     width: 500,
    //     child: ListView.builder(
    //       padding: const EdgeInsets.all(8),
    //       itemCount: _data.length,
    //       itemBuilder: (BuildContext context, int index) {
    //         return Container(
    //           decoration: const BoxDecoration(
    //             border: Border(
    //               bottom: BorderSide(color: Colors.blue),
    //             ),
    //           ),
    //           margin: const EdgeInsets.only(bottom: 8.0),
    //           child: _buildUIItem(
    //             _data[index],
    //           ),
    //         );
    //       },
    //     ),
    //   ),
    // );
  }

  Widget _buildUIItem(String text) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.blue.shade100,
      // decoration: const BoxDecoration(
      //   border: Border(
      //     bottom: BorderSide(color: Colors.blue),
      //   ),
      // ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // Checkbox(
          //   activeColor: Colors.white, // 체크시,  원 내부 바탕색
          //   checkColor: Colors.teal, //  체크시, 체크아이콘 ✔ 색
          //   side: WidgetStateBorderSide.resolveWith(
          //     (Set<WidgetState> states) {
          //       return const BorderSide(color: Colors.teal, width: 2.0);
          //       // if (powerListener.value) {
          //       //   return const BorderSide(color: Colors.green, width: 2.0);
          //       // } else {
          //       //   return BorderSide(color: PresetTheme.style.colorDisableFocused, width: 2.0);
          //       // }
          //     },
          //   ),
          //   splashRadius: 0.0,
          //   value: true,
          //   onChanged: (bool? v) {
          //     // powerListener.value = !powerListener.value;
          //   },
          // ),
          Text(
            text,
          ),
        ],
      ),
    );
  }

  Widget _buildUISubItem(String text) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.blue),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(text),
        ],
      ),
    );
  }
}
