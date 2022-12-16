import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:odev_test/data/preferences/prefs_user.dart';

part 'user_change_state.dart';

class UserChangeCubit extends Cubit<UserChangeState> {
  UserChangeCubit()
      : super(UserChangeState(actualUser: "Jane Doe", userTag: '@janedoe_29'));

  void toJane() =>
      emit(UserChangeState(actualUser: "Jane Doe", userTag: '@janedoe_29'));

  void toJohn() =>
      emit(UserChangeState(actualUser: "John Doe", userTag: '@johndoe_27'));

  void toDavid() => emit(
      UserChangeState(actualUser: "David Smith", userTag: '@davidsmith_32'));
}
