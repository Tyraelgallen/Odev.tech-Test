part of 'db_get_bloc.dart';

@immutable
abstract class DbGetEvent {}

class GetPosts extends DbGetEvent {
  GetPosts();
}
