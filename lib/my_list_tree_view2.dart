// class MyListTreeView extends StatefulWidget {
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:list_treeview/list_treeview.dart';

/// The data class that is bound to the child node
/// You must inherit from NodeData ！！！
/// You can customize any of your properties
class TreeNodeData extends NodeData {
  TreeNodeData({this.label, this.color}) : super();

  /// Other properties that you want to define
  final String? label;
  final Color? color;

  String? property1;
  String? property2;
  String? property3;

  ///...
}

class MyListTreeView2 extends StatefulWidget {
  const MyListTreeView2({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyListTreeView2State();
  }
}

class _MyListTreeView2State extends State<MyListTreeView2> with SingleTickerProviderStateMixin {
  final TreeViewController _treeViewController = TreeViewController();
  bool _isSuccess = false;
  final List<Color> _colors = [];
  @override
  void initState() {
    super.initState();

    for (int i = 0; i < 100; i++) {
      _colors.add(randomColor());
    }

    ///Data may be requested asynchronously
    _getData();
  }

  void _getData() async {
    _isSuccess = false;
    await Future.delayed(const Duration(seconds: 2));

    var colors1 = TreeNodeData(label: 'Colors1');
    var color11 = TreeNodeData(label: 'rgb(0,139,69)', color: const Color.fromARGB(255, 0, 139, 69));
    var color12 = TreeNodeData(label: 'rgb(0,139,69)', color: const Color.fromARGB(255, 0, 191, 255));
    var color13 = TreeNodeData(label: 'rgb(0,139,69)', color: const Color.fromARGB(255, 255, 106, 106));
    var color14 = TreeNodeData(label: 'rgb(0,139,69)', color: const Color.fromARGB(255, 160, 32, 240));
    colors1.addChild(color11);
    colors1.addChild(color12);
    colors1.addChild(color13);
    colors1.addChild(color14);

    var colors2 = TreeNodeData(label: 'Colors2');
    var color21 = TreeNodeData(label: 'rgb(0,139,69)', color: const Color.fromARGB(255, 255, 64, 64));
    var color22 = TreeNodeData(label: 'rgb(0,139,69)', color: const Color.fromARGB(255, 28, 134, 238));
    var color23 = TreeNodeData(label: 'rgb(0,139,69)', color: const Color.fromARGB(255, 255, 106, 106));
    var color24 = TreeNodeData(label: 'rgb(0,139,69)', color: const Color.fromARGB(255, 205, 198, 115));
    colors2.addChild(color21);
    colors2.addChild(color22);
    colors2.addChild(color23);
    colors2.addChild(color24);

    /// set data
    _treeViewController.treeData([colors1]);
    print('set treeData suceess');

    setState(() {
      _isSuccess = true;
    });
  }

  Color getColor(int level) {
    return _colors[level % _colors.length];
  }

  Color randomColor() {
    // int r = Random.secure().nextInt(200);
    // int g = Random.secure().nextInt(200);
    // int b = Random.secure().nextInt(200);
    // return Color.fromARGB(255, r, g, b);

    return Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }

  /// Add
  void add(TreeNodeData dataNode) {
    /// create New node
//    DateTime time = DateTime.now();
//    int milliseconds = time.millisecondsSinceEpoch ~/ 1000;
    int r = Random.secure().nextInt(255);
    int g = Random.secure().nextInt(255);
    int b = Random.secure().nextInt(255);

    var newNode = TreeNodeData(label: 'rgb($r,$g,$b)', color: Color.fromARGB(255, r, g, b));

    _treeViewController.insertAtFront(dataNode, newNode);
//    _controller.insertAtRear(dataNode, newNode);
//    _controller.insertAtIndex(1, dataNode, newNode);
  }

  void delete(dynamic item) {
    _treeViewController.removeItem(item);
  }

  void select(dynamic item) {
    _treeViewController.selectItem(item);
  }

  void selectAllChild(dynamic item) {
    _treeViewController.selectAllChild(item);
  }

  @override
  Widget build(BuildContext context) {
    if (_isSuccess) {
      return getBody();
    }

    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget getBody() {
    return ListTreeView(
      controller: _treeViewController,
      shrinkWrap: false,
      padding: const EdgeInsets.all(0),
      onTap: (NodeData data) {
        print('index = ${data.index}');
      },
      // onLongPress: (data) {
      //   delete(data);
      // },
      itemBuilder: (BuildContext context, NodeData data) {
        TreeNodeData item = data as TreeNodeData;
//              double width = MediaQuery.of(context).size.width;
        double offsetX = item.level * 16.0;

        // print(item.isExpand);
        print(item.label);

        return Container(
          height: 54,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: const BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: Colors.grey))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: offsetX),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: InkWell(
                          splashColor: Colors.amberAccent.withOpacity(1),
                          highlightColor: Colors.red,
                          onTap: () {
                            selectAllChild(item);
                          },
                          child:
                              // data.isSelected
                              //     ? Icon(
                              //         Icons.star,
                              //         size: 30,
                              //         color: Color(0xFFFF7F50),
                              //       )
                              //     : Icon(
                              //         Icons.star_border,
                              //         size: 30,
                              //         color: Color(0xFFFFDAB9),
                              //       ),
                              data.isSelected
                                  ? const Checkbox(
                                      value: true,
                                      onChanged: null,
                                    )
                                  : const Checkbox(
                                      value: false,
                                      onChanged: null,
                                    ),
                        ),
                      ),
                      Text(
                        'level-${item.level}-${item.indexInParent}',
                        style: TextStyle(fontSize: 15, color: getColor(item.level)),
                      ),
                      // Text(
                      //   '${item.label}',
                      //   style: TextStyle(color: item.color),
                      // ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: item.isExpand,
                child: InkWell(
                  onTap: () {
                    add(item);
                  },
                  child: const Icon(Icons.add, size: 30),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  final List<String> _data = <String>[
    'alzwin/play/idea/default/head/ideaConceptList',
    'alzwin/play/idea/default/head/ideaElementList/1kg7rcca6jd0yyqu',
    'alzwin/play/idea/default/head/ideaElementList/3w6m4n7risx4bkxw',
    'alzwin/play/idea/default/head/ideaElementList/6o5cqpbc75tu36vf',
    'alzwin/play/idea/default/head/ideaElementList/8xgr9g9wqs6jyia8',
    'alzwin/play/idea/default/head/ideaElementList/fd545xg8sahqbu85',
    'alzwin/play/idea/default/head/ideaElementList/i9ufunjlq2lzfi2y',
    'alzwin/play/idea/default/head/ideaElementList/oa9opaa60y8uozf6',
    'alzwin/play/idea/default/head/ideaElementList/s9gndy1wxmff0j0r',
    'alzwin/play/idea/default/head/ideaElementList/y36jcd9z0hlbb8gu',
    'alzwin/play/idea/default/head/ideaEnumerationElementList',
    'alzwin/play/idea/default/head/ideaEnumerationList',
    'alzwin/play/idea/default/head/ideaStructList',
    'alzwin/play/idea/default/ideaVersionList',
    'alzwin/play/idea/neo/head/ideaConceptList',
    'alzwin/play/idea/neo/head/ideaElementList/1kg7rcca6jd0yyqu',
    'alzwin/play/idea/neo/head/ideaElementList/3w6m4n7risx4bkxw',
    'alzwin/play/idea/neo/head/ideaElementList/6o5cqpbc75tu36vf',
    'alzwin/play/idea/neo/head/ideaElementList/8xgr9g9wqs6jyia8',
    'alzwin/play/idea/neo/head/ideaElementList/fd545xg8sahqbu85',
    'alzwin/play/idea/neo/head/ideaElementList/i9ufunjlq2lzfi2y',
    'alzwin/play/idea/neo/head/ideaElementList/oa9opaa60y8uozf6',
    'alzwin/play/idea/neo/head/ideaElementList/s9gndy1wxmff0j0r',
    'alzwin/play/idea/neo/head/ideaElementList/y36jcd9z0hlbb8gu',
    'alzwin/play/idea/neo/head/ideaEnumerationElementList',
    'alzwin/play/idea/neo/head/ideaEnumerationList',
    'alzwin/play/idea/neo/head/ideaStructList',
    'alzwin/play/idea/neo/ideaVersionList',
    'alzwin/play/idea/test/head/ideaConceptList',
    'alzwin/play/idea/test/head/ideaElementList/6yrjpouf4i9uga07',
    'alzwin/play/idea/test/head/ideaEnumerationList',
    'alzwin/play/idea/test/head/ideaStructList',
    'alzwin/play/idea/test/ideaVersionList',
    'alzwin/play/server/default/head/accountInstanceList',
    'alzwin/play/server/default/head/kai/brainTrainingMinigameInstanceList',
    'alzwin/play/server/default/head/kai/brainTrainingTodayGoalInstanceList',
    'alzwin/play/server/default/head/kai/brainTrainingTodayGoalMinigameInstanceList',
    'alzwin/play/server/default/head/kai/goodsItemInstanceList',
    'alzwin/play/server/default/head/kai/goodsPackageInstanceList',
    'alzwin/play/server/default/head/kai/islandInstanceList',
    'alzwin/play/server/default/head/kai/pcInstanceList',
    'alzwin/play/server/default/head/kai/periodicGoalInstanceList',
    'alzwin/play/server/default/head/kai/periodicGoalPointInstanceList',
    'alzwin/play/server/default/head/kai/placeableObjectItemInstanceList',
    'alzwin/play/server/default/head/kai/placementFloorInstanceList',
    'alzwin/play/server/default/head/kai/purchaseGridInstanceList',
    'alzwin/play/server/default/head/kai/purchaseGridMerchandiseInstanceList',
    'alzwin/play/server/default/head/kai/residentInstanceList',
    'alzwin/play/server/default/head/kai/seasonRewardInstanceList',
    'alzwin/play/server/default/head/kai/seasonRewardPointInstanceList',
    'alzwin/play/server/default/head/kai/spaceInstanceList',
    'alzwin/play/server/default/head/kai/weeklyActivityInstanceList',
    'alzwin/play/server/default/head/kai/weeklyActivityPointInstanceList',
    'alzwin/play/server/default/head/neo/brainTrainingMinigameInstanceList',
    'alzwin/play/server/default/head/neo/brainTrainingTodayGoalInstanceList',
    'alzwin/play/server/default/head/neo/brainTrainingTodayGoalMinigameInstanceList',
    'alzwin/play/server/default/head/neo/goodsItemInstanceList',
    'alzwin/play/server/default/head/neo/goodsPackageInstanceList',
    'alzwin/play/server/default/head/neo/islandInstanceList',
    'alzwin/play/server/default/head/neo/pcInstanceList',
    'alzwin/play/server/default/head/neo/periodicGoalInstanceList',
    'alzwin/play/server/default/head/neo/periodicGoalPointInstanceList',
    'alzwin/play/server/default/head/neo/placeableObjectItemInstanceList',
    'alzwin/play/server/default/head/neo/placementFloorInstanceList',
    'alzwin/play/server/default/head/neo/purchaseGridInstanceList',
    'alzwin/play/server/default/head/neo/purchaseGridMerchandiseInstanceList',
    'alzwin/play/server/default/head/neo/residentInstanceList',
    'alzwin/play/server/default/head/neo/seasonRewardInstanceList',
    'alzwin/play/server/default/head/neo/seasonRewardPointInstanceList',
    'alzwin/play/server/default/head/neo/spaceInstanceList',
    'alzwin/play/server/default/head/neo/weeklyActivityInstanceList',
    'alzwin/play/server/default/head/neo/weeklyActivityPointInstanceList',
    'alzwin/play/server/default/head/playerInstanceList',
    'alzwin/play/server/neo/head/accountInstanceList',
    'alzwin/play/server/neo/head/neo/brainTrainingMinigameInstanceList',
    'alzwin/play/server/neo/head/neo/brainTrainingTodayGoalInstanceList',
    'alzwin/play/server/neo/head/neo/brainTrainingTodayGoalMinigameInstanceList',
    'alzwin/play/server/neo/head/neo/goodsItemInstanceList',
    'alzwin/play/server/neo/head/neo/goodsPackageInstanceList',
    'alzwin/play/server/neo/head/neo/islandInstanceList',
    'alzwin/play/server/neo/head/neo/pcInstanceList',
    'alzwin/play/server/neo/head/neo/periodicGoalInstanceList',
    'alzwin/play/server/neo/head/neo/periodicGoalPointInstanceList',
    'alzwin/play/server/neo/head/neo/placeableObjectItemInstanceList',
    'alzwin/play/server/neo/head/neo/placementFloorInstanceList',
    'alzwin/play/server/neo/head/neo/purchaseGridInstanceList',
    'alzwin/play/server/neo/head/neo/purchaseGridMerchandiseInstanceList',
    'alzwin/play/server/neo/head/neo/residentInstanceList',
    'alzwin/play/server/neo/head/neo/seasonRewardInstanceList',
    'alzwin/play/server/neo/head/neo/seasonRewardPointInstanceList',
    'alzwin/play/server/neo/head/neo/spaceInstanceList',
    'alzwin/play/server/neo/head/neo/weeklyActivityInstanceList',
    'alzwin/play/server/neo/head/neo/weeklyActivityPointInstanceList',
    'alzwin/play/server/neo/head/playerInstanceList',
    'bogunso/manager/tablet',
    'default',
    'sentents/manager/tablet',
  ];

  @override
  void dispose() {
    _treeViewController.dispose();
    super.dispose();
  }
}
