import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'UserList.dart';

Future<Database> initDB() async {
  String databasePath = await getDatabasesPath();
  String dbPath = join(databasePath, 'firstDB.db');

  return await openDatabase(
      dbPath,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE TBL_USER (
            ID INTEGER PRIMARY KEY AUTOINCREMENT,
            NAME TEXT,
            AGE INTEGER
          )
        ''');
      }
  );
}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var db = await initDB();
  runApp(MyApp(db));
}

class MyApp extends StatelessWidget {
  Database db;
  MyApp(this.db);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'sqlite 실습',
      home: MyWidget(db),
    );
  }
}

class MyWidget extends StatefulWidget {
  Database db;
  MyWidget(this.db);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  var _nameCtrl = TextEditingController();
  var _ageCtrl = TextEditingController();

  Future<void> insertUser(String name, int age) async{
    await widget.db.insert(
      'TBL_USER',
      {
        'NAME' : name,
        'AGE' : age
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sqlite 실습'),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserList(db : widget.db))
            );
          }, icon: Icon(Icons.list))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameCtrl,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextField(
              controller: _ageCtrl,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Age',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String name = _nameCtrl.text;
                int age = int.tryParse(_ageCtrl.text) ?? 0 ;

                await insertUser(name, age);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('추가되었음')),
                );
                _nameCtrl.clear();
                _ageCtrl.clear();
              },
              child: Text('사용자 추가'),
            ),
          ],
        ),
      ),
    );
  }
}