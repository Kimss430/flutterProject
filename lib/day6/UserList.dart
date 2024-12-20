import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'UserEdit.dart';

class UserList extends StatefulWidget {
  Database db;
  UserList({required this.db});
  @override
  _UserListState createState() => _UserListState();
}
class _UserListState extends State<UserList> {
  List<Map<String, dynamic>> list = [];

  Future<void> selectUser() async{
    var user = await widget.db.query('TBL_USER'); // SELECT * FROM TBL_USER
    setState(() {
      list = user;
    });
  }
  Future<void> removeUser(userId) async{
    await widget.db.delete(
        'TBL_USER',
        where : 'ID = ?',
        whereArgs : [userId]
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectUser();
  }

  void deleteUser(BuildContext context, int index) {
    var user = list[index];
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Text('삭제'),
            content: Text('${user["NAME"]}님을 정말 삭제할거? '),
            actions: [
              TextButton(
                onPressed: () {
                  removeUser(user['ID']);
                  Navigator.of(context).pop();
                  selectUser();
                },
                child: Text('삭제'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('취소'),
              )
            ]
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('사용자목록'),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          var user = list[index];
          return ListTile(
              title: Row(
                children: [
                  Text('아이디 : ${user['ID']}, '),
                  Text('이름 : ${user['NAME']}'),
                ],
              ) ,
              subtitle: Text('나이 : ${user['AGE']}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () async {
                      // Edit 화면에서 반환된 값을 받아 처리
                      bool? updated = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Edit(db: widget.db, userId: user['ID']),
                        ),
                      );

                      // 데이터가 수정되었다면 화면 갱신
                      if (updated == true) {
                        setState(() {
                          selectUser(); // 사용자가 작성한 메서드로 데이터 목록 갱신
                        });
                      }
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      deleteUser(context, index);
                    },
                  ),
                ],
              )
          );
        },
      ),
    );
  }
}