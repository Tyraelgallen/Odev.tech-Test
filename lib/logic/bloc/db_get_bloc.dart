import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:odev_test/data/databases/db1.dart';
import 'package:odev_test/data/models/post_model.dart';

part 'db_get_event.dart';
part 'db_get_state.dart';

class DbGetBloc extends Bloc<DbGetEvent, DbGetState> {
  DbGetBloc() : super(DbGetState(list: [])) {
    on<GetPosts>((event, emit) {});
  }
}
