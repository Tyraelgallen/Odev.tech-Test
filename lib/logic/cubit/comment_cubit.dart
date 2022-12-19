import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'comment_state.dart';

class CommentCubit extends Cubit<CommentState> {
  CommentCubit() : super(CommentInitial());

  void refresh(bool commentopen) => emit(DbRefresh(commentopen: commentopen));
}
