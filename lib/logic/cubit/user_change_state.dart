// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_change_cubit.dart';

class UserChangeState {
  String actualUser;
  String userTag;

  UserChangeState({
    required this.actualUser,
    required this.userTag,
  }) {
    PrefsUser.name = actualUser;
    PrefsUser.tag = userTag;
    print(PrefsUser.name);
    print(PrefsUser.tag);
  }
}
