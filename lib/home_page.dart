import 'package:flutter/material.dart';
import 'package:tres_app/data.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final titleList = ['Fullname', 'Occupation', 'Age', 'Color'];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 50),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const ClampingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                child: DataTable(
                  headingRowColor: MaterialStateProperty.all(Colors.blue),
                  showCheckboxColumn: false,
                  columns: List.generate(
                    titleList.length,
                    (index) => DataColumn(label: _TextWhite(titleList[index])),
                  ),
                  rows: List.generate(userList.length, (index) {
                    final cells = [
                      userList[index].fullname,
                      userList[index].occupation,
                      userList[index].age.toString(),
                      userList[index].favoriteColor
                    ];

                    return DataRow(
                      onSelectChanged: (value) =>
                          debugPrint('GOTO to DetailPage'),
                      color: MaterialStateProperty.all(
                        Colors.blue.withOpacity(
                          index.isEven ? 0.4 : 0.2,
                        ),
                      ),
                      cells: cells.map(
                        (data) {
                          return DataCell(
                            Text(data),
                            // onTap: () => debugPrint('Go to DetailPage'),
                          );
                        },
                      ).toList(),
                    );
                  }),
                  // rows: userList.map((user) {
                  //   final cells = [
                  //     user.fullname,
                  //     user.occupation,
                  //     user.age.toString(),
                  //     user.favoriteColor
                  //   ];

                  //   return DataRow(
                  //     color: MaterialStateProperty.all(Colors.grey),
                  //     cells: cells.map(
                  //       (data) {
                  //         return DataCell(
                  //           Text(data),
                  //           onTap: () => print('Go to DetailPage'),
                  //         );
                  //       },
                  //     ).toList(),
                  //   );
                  // }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _TextWhite extends StatelessWidget {
  const _TextWhite(
    this.title, {
    Key? key,
  }) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? '',
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    );
  }
}
