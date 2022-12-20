import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:odev_test/data/databases/db1.dart';
import 'package:odev_test/data/models/post_model.dart';

part 'comment_state.dart';

class CommentCubit extends Cubit<CommentState> {
  CommentCubit() : super(CommentState(change: false));

  void refresh(int index, bool change) =>
      emit(CommentState(index: index, change: change));

  void insert(int index, bool change, Comment json) =>
      emit(CommentState(index: index, change: change, json: json));
}
