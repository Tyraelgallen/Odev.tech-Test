import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:odev_test/data/databases/db1.dart';
import 'package:odev_test/data/databases/mockup_data.dart';
import 'package:odev_test/data/models/post_model.dart';

part 'db_crud_state.dart';

class DbCrudCubit extends Cubit<DbCrudState> {
  DbCrudCubit() : super(DbCrudInitial());

  void edit(Post item) => emit(DbEdit(item: item));
  void delete(int id) => emit(Dbdelete(id: id));
  void insert(Post item) => emit(Dbinsert(item: item));
  void insertmockup(bool initialData) =>
      emit(DbInsertMockup(initialData: initialData));
  // void read() => emit(Dbread(list: []));
}
