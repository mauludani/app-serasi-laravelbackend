import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:serasi/models/models.dart';
import 'package:serasi/services/services.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial()) {
    checkSignIn();
    checkGuestUser();
    initPackageInfo();
  }

  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;

  bool _guestUser = false;
  bool get guestUser => _guestUser;

  String _appVersion = '0.0';
  String get appVersion => _appVersion;

  String _packageName = '';
  String get packageName => _packageName;

  Future setSignIn() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool('signed_in', true);
    print('setSignIn');
    _isSignedIn = true;
  }

  void checkSignIn() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    _isSignedIn = sp.getBool('signed_in') ?? false;
  }

  Future setGuestUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setBool('guest_user', true);
    print('setGuestUser');
    _guestUser = true;
  }

  void checkGuestUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    _guestUser = sp.getBool('guest_user') ?? false;
  }

  void initPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    _appVersion = packageInfo.version;
    _packageName = packageInfo.packageName;
  }

  Future<void> signIn(String email, String password) async {
    ApiReturnValue<User> result = await UserServices.signIn(email, password);
    setSignIn();
    setGuestUser();
    if (result.value != null) {
      emit(UserLoaded(result.value));
    } else {
      emit(UserLoadingFailed(result.message));
    }
  }

  Future<void> updateDeviceId(String email, String id) async {
    await UserServices.updateDeviceId(email, id);
    // if (result.value != null) {
    //   emit(UserIdLoaded(result.value));
    // } else {
    //   emit(UserLoadingFailed(result.message));
    // }
  }
}
