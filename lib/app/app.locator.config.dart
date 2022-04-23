// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../sevices/auth_service.dart' as _i4;
import '../sevices/could_database_service.dart' as _i5;
import '../states/first_page_state.dart' as _i6;
import '../states/initial_app_state.dart' as _i7;
import '../states/user_data.dart' as _i8;
import 'app.router.dart' as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.AppRouter>(_i3.AppRouter());
  gh.singleton<_i4.AuthService>(_i4.AuthService());
  gh.singleton<_i5.CloudDatabaseService>(_i5.CloudDatabaseService());
  gh.lazySingleton<_i6.FirstPageState>(() => _i6.FirstPageState());
  gh.singleton<_i7.InitialAppState>(_i7.InitialAppState());
  gh.singleton<_i8.UserData>(_i8.UserData());
  return get;
}
