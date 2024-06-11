import 'package:flutter/material.dart';
import 'package:flutter_tree_structure/gkv_data.dart';

class GkvTreeView extends StatefulWidget {
  const GkvTreeView({super.key});

  @override
  State<GkvTreeView> createState() => _GkvTreeViewState();
}

class _GkvTreeViewState extends State<GkvTreeView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // decoration: BoxDecoration(border: Border.all(color: Colors.red)),
        width: 500,
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: GKVData.groupList.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black, width: 1.0),
                ),
              ),
              margin: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                GKVData.groupList[index],
              ),
            );
          },
          // itemBuilder: (BuildContext context, int index) {
          //   return Container(
          //     width: 100,
          //     // decoration: BoxDecoration(border: Border.all(color: Colors.red)),
          //     decoration: BoxDecoration(
          //       border: Border(
          //         bottom: BorderSide(color: Colors.black, width: 1.0),
          //       ),
          //     ),
          //     margin: const EdgeInsets.only(bottom: 8.0),
          //     child: ListTile(
          //       title: Text(
          //         GKVData.groupList[index],
          //         textAlign: TextAlign.center,
          //       ),
          //     ),
          //   );
          // },
        ),
      ),
    );
  }

  // Widget _aa() {
  //   return Row(
  //     mainAxisSize: MainAxisSize.min,
  //     children: <Widget>[
  //       Checkbox(
  //         shape: const CircleBorder(),
  //         activeColor: PresetTheme.style.colorCardNormal,
  //         // 체크시,  원 내부 바탕색
  //         checkColor: Colors.green,
  //         //  체크시, 체크아이콘 ✔ 색
  //         side: WidgetStateBorderSide.resolveWith(
  //           (Set<WidgetState> states) {
  //             if (powerListener.value) {
  //               return const BorderSide(color: Colors.green, width: 2.0);
  //             } else {
  //               return BorderSide(color: PresetTheme.style.colorDisableFocused, width: 2.0);
  //             }
  //           },
  //         ),
  //         splashRadius: 0.0,
  //         value: powerListener.value,
  //         onChanged: (bool? v) {
  //           powerListener.value = !powerListener.value;
  //         },
  //       ),
  //       PlainText(
  //         text: powerListener.value.localizeHaving,
  //         style: CustomTextStyle.l(),
  //         color: powerListener.value ? Colors.green : PresetTheme.style.colorDisableNormal,
  //       ),
  //     ],
  //   );
  // }
}
