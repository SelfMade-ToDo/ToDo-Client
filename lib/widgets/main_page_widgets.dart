import 'package:flutter/material.dart';
import 'package:todo_client/models/todo.dart';

class MainPageWidgets{
  // todo 한 개
  Widget buildItemWidget(Todo todo){
    return ListTile(
      trailing: IconButton(
        onPressed: () {

        },
        icon: const Icon(Icons.delete)
      ),
      title: Text(
        todo.name,
        style: todo.isFinished ? const TextStyle(
          decoration: TextDecoration.lineThrough,
          color: Colors.red,
        ) : null ,
      ),
    );
  }

  // // 플러스 버튼 눌렀을떄 밑에서 나오는 창
  // Widget buildBottomSheet(BuildContext context, TextEditingController todoCtrl) {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       TextField(
  //         controller: todoCtrl,
  //         decoration: const InputDecoration(
  //           border: OutlineInputBorder(),
  //           labelText: '이름',
  //         ),
  //       ),
  //       ElevatedButton(
  //         child: const Text('확인'),
  //         onPressed: () => ,
  //       ),
  //       ElevatedButton(
  //         child: const Text('Close BottomSheet'),
  //         onPressed: () => Navigator.pop(context),
  //       ),
  //     ],
  //   );
  // }
}