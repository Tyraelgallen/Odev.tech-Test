part of 'comment_cubit.dart';

@immutable
abstract class CommentState {}

class CommentInitial extends CommentState {}

class DbRefresh extends CommentState {
  bool commentopen;
  DbRefresh({
    required this.commentopen,
  });
}
