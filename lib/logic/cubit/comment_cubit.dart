import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'comment_state.dart';

class CommentCubit extends Cubit<CommentState> {
  CommentCubit() : super(CommentState(change: false));

  void refresh(int index, bool change) =>
      emit(CommentState(index: index, change: change));

  void refreshcomment(bool change) => emit(CommentState(change: change));
}
