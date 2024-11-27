import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class Edit extends StatefulWidget {
  Database db;
  int userId;

  Edit({required this.db, required this.userId});

  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  TextEditingController _nameCtrl = TextEditingController();
  TextEditingController _ageCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    var user = await widget.db.query(
      'TBL_USER',
      where: 'ID = ?',
      whereArgs: [widget.userId],
    );

    var data = user.first;
    _nameCtrl.text = data['NAME'].toString();
    _ageCtrl.text = data['AGE'].toString();

  }

  Future<void> _updateUser() async {
    print(_nameCtrl.text);
    print(_ageCtrl.text);
    print([widget.userId]);
    await widget.db.update(
      'TBL_USER',
      {
        'NAME': _nameCtrl.text,
        'AGE': int.tryParse(_ageCtrl.text) ?? 0,
      },
      where: 'ID = ?',
      whereArgs: [widget.userId],
    );
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('사용자 수정'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameCtrl,
              decoration: InputDecoration(labelText: '이름'),
            ),
            TextField(
              controller: _ageCtrl,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: '나이'),
            ),
            ElevatedButton(
              onPressed: () {
                _updateUser();
              },
              child: Text('수정'),
            ),
          ],
        ),
      ),
    );
  }
}