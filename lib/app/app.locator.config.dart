// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:stacked_services/stacked_services.dart' as _i5;

import '../sevices/auth_service.dart' as _i4;
import '../sevices/could_database_service.dart' as _i6;
import '../sevices/image_picker_service.dart' as _i8;
import '../sevices/third_party_module_service.dart' as _i11;
import '../states/first_page_state.dart' as _i7;
import '../states/initial_app_state.dart' as _i9;
import '../states/user_data.dart' as _i10;
import 'app.router.dart' as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  gh.singleton<_i3.AppRouter>(_i3.AppRouter());
  gh.singleton<_i4.AuthService>(_i4.AuthService());
  gh.lazySingleton<_i5.BottomSheetService>(
      () => thirdPartyServicesModule.bottomSheetService);
  gh.lazySingleton<_i6.CloudDatabaseService>(() => _i6.CloudDatabaseService());
  gh.lazySingleton<_i5.DialogService>(
      () => thirdPartyServicesModule.dialogService);
  gh.lazySingleton<_i7.FirstPageState>(() => _i7.FirstPageState());
  gh.singleton<_i8.ImagePickerService>(_i8.ImagePickerService());
  gh.singleton<_i9.InitialAppState>(_i9.InitialAppState());
  gh.lazySingleton<_i5.NavigationService>(
      () => thirdPartyServicesModule.navigationService);
  gh.lazySingleton<_i5.SnackbarService>(
      () => thirdPartyServicesModule.snackBarService);
  gh.singleton<_i10.UserData>(_i10.UserData());
  return get;
}

class _$ThirdPartyServicesModule extends _i11.ThirdPartyServicesModule {
  @override
  _i5.BottomSheetService get bottomSheetService => _i5.BottomSheetService();
  @override
  _i5.DialogService get dialogService => _i5.DialogService();
  @override
  _i5.NavigationService get navigationService => _i5.NavigationService();
  @override
  _i5.SnackbarService get snackBarService => _i5.SnackbarService();
}
