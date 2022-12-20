// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'comment_cubit.dart';

bool commentopen = false;

class CommentState {
  int? index;
  bool change;
  CommentState({
    this.index,
    required this.change,
  }) {
    print("index :" + index.toString() + ", change:" + change.toString());
    if ((index != null) && (change == false)) {
      print(commentopen);
      commentopen = !commentopen;
    }

    if (commentopen) {
      print(commentopen);
    } else {
      print(commentopen);
    }
  }
}
