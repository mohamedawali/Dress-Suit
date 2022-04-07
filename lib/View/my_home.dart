import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> with TickerProviderStateMixin {
  TabController? tabController;
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    tabController = TabController(length: 2, vsync: this);
    return Scaffold(
        appBar: AppBar(
          bottom: TabBar(
              onTap: (index) => view(index),
              controller: tabController,
              tabs: [
                Tab(
                  text: 'فستان',
                  icon: Icon(Icons.female),
                ),
                Tab(
                  text: 'بدله',
                  icon: Icon(Icons.male),
                )
              ]),
        ),
        body: viewbody());
  }

  void view(int index) {
    setState(() {
      _index = index;
      print(_index);
    });
  }

  Widget viewbody() {
    if (_index != 0)
      return Container(
        color: Colors.yellow,
      );
    else if (_index == 1)
      return Container(
        color: Colors.yellow,
      );
    else
      return gridView();
  }

  Widget gridView() {
    return Container(
      child: GridView.builder(
          shrinkWrap: true,
          physics: PageScrollPhysics(),
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 2 / 3.2, crossAxisCount: 2),
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
                child: Card(
                  elevation: 15,
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: Column(
                      children: [
                        Container(
                          color: Colors.grey,
                          height: 200,
                        ),
                        Text(
                          'فستان فستان احمر احمر سواريه سواريه جميل جدا جدا جدا نص كم مناسب للحفلات ',
                          maxLines: 2,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('عرض'),
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(100, 30)),
                        )
                      ],
                    ),
                  ),
                ),
              )),
    );
  }
}
