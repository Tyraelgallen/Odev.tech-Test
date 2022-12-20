// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'comment_cubit.dart';

bool commentopen = false;

class CommentState {
  int? index;
  bool change;
  Comment? json;
  CommentState({this.index, required this.change, this.json}) {
    print("index :" + index.toString() + ", change:" + change.toString());
    if ((index != null) && (change == false)) {
      print(commentopen);
      commentopen = !commentopen;
    }

    if (json != null) {
      insert();
    }

    if (commentopen) {
      print(commentopen);
    } else {
      print(commentopen);
    }
  }
  void insert() async {
    await MyDatabase.instance.insertComment(json!);
  }
}
