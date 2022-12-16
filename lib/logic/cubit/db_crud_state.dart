// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'db_crud_cubit.dart';

@immutable
abstract class DbCrudState {}

class DbCrudInitial extends DbCrudState {}

class DbEdit extends DbCrudState {
  Post item;
  DbEdit({
    required this.item,
  }) {
    action(item);
  }

  void action(Post item) async {
    await MyDatabase.instance.update(item);
  }
}

class Dbdelete extends DbCrudState {
  int id;
  Dbdelete({
    required this.id,
  }) {
    action(id);
  }

  void action(int id) async {
    int idd = await MyDatabase.instance.deleteById(id);
  }
}

class Dbinsert extends DbCrudState {
  Post item;
  Dbinsert({
    required this.item,
  }) {
    action(item);
  }

  void action(Post item) async {
    await MyDatabase.instance.insert(item);
  }
}

class DbInsertMockup extends DbCrudState {
  bool initialData;
  DbInsertMockup({
    required this.initialData,
  }) {
    if (initialData == true) {
      putData();
    } else {
      moreData();
    }
  }
}

// class Dbread extends DbCrudState {
//   List<Post> list;
//   Dbread({
//     required this.list,
//   }) {
//     getdata();
//   }

//   Future<List<Post>> getdata() async {
//     list = await MyDatabase.instance.getAll();
//     return list;
//   }
// }
