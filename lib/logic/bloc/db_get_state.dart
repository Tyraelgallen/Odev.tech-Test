// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'db_get_bloc.dart';

class DbGetState {
  List<Post> list;
  DbGetState({
    required this.list,
  }) {
    getdata();
  }

  Future<List<Post>> getdata() async {
    list = await MyDatabase.instance.getAll();
    return list;
  }
}
