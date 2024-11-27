import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class MemoEditor extends StatefulWidget {
  final Database db;

  MemoEditor({required this.db});

  @override
  _MemoEditorState createState() => _MemoEditorState();
}

class _MemoEditorState extends State<MemoEditor> {
  TextEditingController _nameCtrl = TextEditingController();
  TextEditingController _contentCtrl = TextEditingController();

  Future<void> insertMemo() async {
    await widget.db.insert(
      'TBL_MEMO',
      {
        'NAME': _nameCtrl.text,
        'CONTENT': _contentCtrl.text,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('메모 작성'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nameCtrl,
              decoration: InputDecoration(
                labelText: '작성자',
              ),
            ),
            TextField(
              controller: _contentCtrl,
              decoration: InputDecoration(
                labelText: '내용',
              ),
              maxLines: null,
            ),
            ElevatedButton(
              onPressed: () async {
                await insertMemo();
                Navigator.of(context).pop();
              },
              child: Text('저장'),
            ),
          ],
        ),
      ),
    );
  }
}