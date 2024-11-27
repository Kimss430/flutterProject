import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'MemoEdit.dart';

Future<Database> initDB() async {
  String databasesPath = await getDatabasesPath();
  String dbPath = join(databasesPath, 'firstDB.db');

  return await openDatabase(
    dbPath,
    version: 2,
    onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE TBL_USER (
          ID INTEGER PRIMARY KEY AUTOINCREMENT,
          NAME TEXT,
          AGE INTEGER
        )
      ''');
    },
    onUpgrade: (Database db, int oldVersion, int newVersion) async {
      if (oldVersion < 2) {
        await db.execute('''
          CREATE TABLE TBL_MEMO (
            ID INTEGER PRIMARY KEY AUTOINCREMENT,
            NAME TEXT,
            CONTENT TEXT
          )
        ''');
      }
    },
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
  List<Map<String, dynamic>> memoList = [];

  Future<void> loadMemoList() async {
    var memos = await widget.db.query('TBL_MEMO');
    setState(() {
      memoList = memos;
    });
  }

  @override
  void initState() {
    super.initState();
    loadMemoList();
  }

  Future<void> deleteMemo(int memoId) async {
    await widget.db.delete(
      'TBL_MEMO',
      where: 'ID = ?',
      whereArgs: [memoId],
    );
  }

  void removeMemo(BuildContext context, int memoId, String memoName) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('삭제 확인'),
          content: Text('$memoName를 삭제하시겠습니까?'),
          actions: [
            TextButton(
              onPressed: () {
                deleteMemo(memoId);
                Navigator.of(context).pop();
                loadMemoList();
              },
              child: Text('삭제'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('취소'),
            ),
          ],
        );
      },
    );
  }

  void editMemo(BuildContext context, int memoId, String currentContent) {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController _contentController =
        TextEditingController(text: currentContent);

        return AlertDialog(
          title: Text('메모 수정'),
          content: TextField(
            controller: _contentController,
            decoration: InputDecoration(labelText: '내용'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                widget.db.update(
                  'TBL_MEMO',
                  {'CONTENT': _contentController.text},
                  where: 'ID = ?',
                  whereArgs: [memoId],
                );
                loadMemoList();
                Navigator.of(context).pop();
              },
              child: Text('수정'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('취소'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('메모장 목록'),
      ),
      body: ListView.builder(
        itemCount: memoList.length,
        itemBuilder: (context, index) {
          var memo = memoList[index];
          return ListTile(
            title: Text('작성자: ${memo['NAME']}'),
            subtitle: Text('내용: ${memo['CONTENT']}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    editMemo(context, memo['ID'], memo['CONTENT']);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    removeMemo(context, memo['ID'], memo['NAME']);
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MemoEditor(db: widget.db),
            ),
          ).then((_) => loadMemoList()); // 메모 작성 후 목록 다시 로드
        },
        child: Icon(Icons.add),
      ),
    );
  }
}