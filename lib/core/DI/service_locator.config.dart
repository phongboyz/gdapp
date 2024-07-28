// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i7;
import 'package:gd/core/DI/register_modules.dart' as _i57;
import 'package:gd/core/network/network_call.dart' as _i17;
import 'package:gd/core/network/network_info.dart' as _i18;
import 'package:gd/core/services/database_sevice.dart' as _i6;
import 'package:gd/core/services/shared_preference_service.dart' as _i41;
import 'package:gd/features/app/data/datasources/app_remote_datasource.dart'
    as _i3;
import 'package:gd/features/app/data/repositories/app_repository_impl.dart'
    as _i5;
import 'package:gd/features/app/domain/repository/app_repository.dart' as _i4;
import 'package:gd/features/app/domain/usecases/get_user_usecase.dart' as _i8;
import 'package:gd/features/app/presentation/cubit/app_cubit.dart' as _i26;
import 'package:gd/features/dashboard/data/datasources/dashboard_remote_datasource.dart'
    as _i27;
import 'package:gd/features/dashboard/data/repositories/dashboard_repository_impl.dart'
    as _i29;
import 'package:gd/features/dashboard/domain/repository/dashboard_repository.dart'
    as _i28;
import 'package:gd/features/dashboard/domain/usecases/get_dashboard_usecase.dart'
    as _i31;
import 'package:gd/features/dashboard/presentation/cubit/dashboard_cubit.dart'
    as _i42;
import 'package:gd/features/home/data/datasources/home_remote_datasource.dart'
    as _i10;
import 'package:gd/features/home/data/repositories/home_ropository_impl.dart'
    as _i12;
import 'package:gd/features/home/domain/repositories/home_repository.dart'
    as _i11;
import 'package:gd/features/home/domain/usecases/get_current_user_usecase.dart'
    as _i30;
import 'package:gd/features/home/presentation/cubit/home_cubit.dart' as _i9;
import 'package:gd/features/items/data/datasources/item_remote_datasource.dart'
    as _i34;
import 'package:gd/features/items/data/repositories/item_repository_impl.dart'
    as _i36;
import 'package:gd/features/items/domain/repository/item_repository.dart'
    as _i35;
import 'package:gd/features/items/domain/usecases/get_profile_usecase.dart'
    as _i44;
import 'package:gd/features/items/presentation/cubit/item_cubit.dart' as _i46;
import 'package:gd/features/login/data/datasources/login_local_datasource.dart'
    as _i16;
import 'package:gd/features/login/data/datasources/login_remote_datasource.dart'
    as _i37;
import 'package:gd/features/login/data/repositories/login_repository_impl.dart'
    as _i39;
import 'package:gd/features/login/domain/repository/login_repository.dart'
    as _i38;
import 'package:gd/features/login/domain/usecases/get_login_usecase.dart'
    as _i43;
import 'package:gd/features/login/domain/usecases/get_profile_usecase.dart'
    as _i45;
import 'package:gd/features/login/presentation/cubit/login_cubit.dart' as _i47;
import 'package:gd/features/sale/data/datasources/sale_local_datasource.dart'
    as _i19;
import 'package:gd/features/sale/data/datasources/sale_remote_datasource.dart'
    as _i20;
import 'package:gd/features/sale/data/repositories/sale_repository_impl.dart'
    as _i22;
import 'package:gd/features/sale/domain/repository/sale_repository.dart'
    as _i21;
import 'package:gd/features/sale/domain/usecases/get_product_items_usecase.dart'
    as _i33;
import 'package:gd/features/sale/domain/usecases/memer_usecase.dart' as _i32;
import 'package:gd/features/sale/domain/usecases/sell_product_usecase.dart'
    as _i23;
import 'package:gd/features/sale/presentation/cubit/sale_cubit.dart' as _i40;
import 'package:gd/features/setting/data/datasources/setting_local_datasource.dart'
    as _i48;
import 'package:gd/features/setting/data/datasources/setting_remote_datasource.dart'
    as _i24;
import 'package:gd/features/setting/data/repositories/setting_repository_impl.dart'
    as _i50;
import 'package:gd/features/setting/domain/repositories/setting_repository.dart'
    as _i49;
import 'package:gd/features/setting/domain/usecases/change_password_usecase.dart'
    as _i52;
import 'package:gd/features/setting/domain/usecases/get_language_usecase.dart'
    as _i53;
import 'package:gd/features/setting/domain/usecases/get_profile_usecase.dart'
    as _i54;
import 'package:gd/features/setting/domain/usecases/set_language_usecase.dart'
    as _i55;
import 'package:gd/features/setting/domain/usecases/update_profile_usecase.dart'
    as _i51;
import 'package:gd/features/setting/presentation/cubit/setting_cubit.dart'
    as _i56;
import 'package:get_it/get_it.dart' as _i1;
import 'package:image_picker/image_picker.dart' as _i13;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i14;
import 'package:logger/logger.dart' as _i15;
import 'package:shared_preferences/shared_preferences.dart' as _i25;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectionModule = _$InjectionModule();
    gh.lazySingleton<_i3.AppRemoteDatasource>(
        () => _i3.AppRemoteDatasourceImpl());
    gh.lazySingleton<_i4.AppRepository>(
        () => _i5.AppRepositoryImpl(gh<_i3.AppRemoteDatasource>()));
    gh.factory<_i6.DatabaseService>(() => _i6.DatabaseService());
    gh.lazySingleton<_i7.Dio>(() => injectionModule.dio);
    gh.lazySingleton<_i8.GetUserUsecase>(
        () => _i8.GetUserUsecase(gh<_i4.AppRepository>()));
    gh.factory<_i9.HomeCubit>(() => _i9.HomeCubit());
    gh.lazySingleton<_i10.HomeRemoteDatasource>(
        () => _i10.HomeRemoteDatasourceImpl());
    gh.lazySingleton<_i11.HomeRepository>(
        () => _i12.HomeRepositoryImpl(gh<_i10.HomeRemoteDatasource>()));
    gh.lazySingleton<_i13.ImagePicker>(() => injectionModule.picker);
    gh.lazySingleton<_i14.InternetConnectionChecker>(
        () => injectionModule.internetChecker);
    gh.lazySingleton<_i15.Logger>(() => injectionModule.logger);
    gh.lazySingleton<_i16.LoginLocalDataSource>(
        () => _i16.LoginLocalDatasourceImpl());
    gh.singleton<_i17.NetworkCall>(() => _i17.NetworkCall(gh<_i7.Dio>()));
    gh.lazySingleton<_i18.NetworkInfo>(
        () => _i18.NetworkInfoImpl(gh<_i14.InternetConnectionChecker>()));
    gh.lazySingleton<_i19.SaleLocalDataSource>(
        () => _i19.SaleLocalDatasourceImpl());
    gh.lazySingleton<_i20.SaleRemoteDataSource>(
        () => _i20.SaleRemoteDataSourceImpl(
              gh<_i17.NetworkCall>(),
              gh<_i6.DatabaseService>(),
            ));
    gh.lazySingleton<_i21.SaleRepository>(() => _i22.SaleRepositoryImpl(
          gh<_i19.SaleLocalDataSource>(),
          gh<_i20.SaleRemoteDataSource>(),
        ));
    gh.lazySingleton<_i23.SellProductUsecase>(
        () => _i23.SellProductUsecase(gh<_i21.SaleRepository>()));
    gh.lazySingleton<_i24.SettingRemoteDatasource>(
        () => _i24.SettingRemoteDatasourceImpl(
              gh<_i17.NetworkCall>(),
              gh<_i6.DatabaseService>(),
            ));
    await gh.factoryAsync<_i25.SharedPreferences>(
      () => injectionModule.prefs,
      preResolve: true,
    );
    gh.factory<_i26.AppCubit>(() => _i26.AppCubit(gh<_i8.GetUserUsecase>()));
    gh.lazySingleton<_i27.DashboardRemoteDataSource>(
        () => _i27.DashboardRemoteDataSourceImpl(
              gh<_i17.NetworkCall>(),
              gh<_i6.DatabaseService>(),
            ));
    gh.lazySingleton<_i28.DashboardRepository>(() =>
        _i29.DashboardRepositoryImpl(gh<_i27.DashboardRemoteDataSource>()));
    gh.lazySingleton<_i30.GetCurrentUserDataUsecase>(
        () => _i30.GetCurrentUserDataUsecase(gh<_i11.HomeRepository>()));
    gh.lazySingleton<_i31.GetDashboardUsecase>(
        () => _i31.GetDashboardUsecase(gh<_i28.DashboardRepository>()));
    gh.lazySingleton<_i32.GetMemberListUsecase>(
        () => _i32.GetMemberListUsecase(gh<_i21.SaleRepository>()));
    gh.lazySingleton<_i33.GetProductItemsUsecase>(
        () => _i33.GetProductItemsUsecase(gh<_i21.SaleRepository>()));
    gh.lazySingleton<_i34.ItemRemoteDataSource>(
        () => _i34.ItemRemoteDataSourceImpl(
              gh<_i17.NetworkCall>(),
              gh<_i6.DatabaseService>(),
            ));
    gh.lazySingleton<_i35.ItemRepository>(
        () => _i36.ItemRepositoryImpl(gh<_i34.ItemRemoteDataSource>()));
    gh.lazySingleton<_i37.LoginRemoteDataSource>(
        () => _i37.LoginRemoteDataSourceImpl(
              gh<_i17.NetworkCall>(),
              gh<_i6.DatabaseService>(),
            ));
    gh.lazySingleton<_i38.LoginRepository>(() => _i39.LoginRepositoryImpl(
          gh<_i37.LoginRemoteDataSource>(),
          gh<_i16.LoginLocalDataSource>(),
        ));
    gh.factory<_i40.SaleCubit>(() => _i40.SaleCubit(
          gh<_i33.GetProductItemsUsecase>(),
          gh<_i32.GetMemberListUsecase>(),
          gh<_i23.SellProductUsecase>(),
        ));
    gh.lazySingleton<_i41.SharedPreferenceService>(
        () => _i41.SharedPreferenceServiceImpl(gh<_i25.SharedPreferences>()));
    gh.factory<_i42.DashboardCubit>(
        () => _i42.DashboardCubit(gh<_i31.GetDashboardUsecase>()));
    gh.lazySingleton<_i43.GetLoginUsecase>(
        () => _i43.GetLoginUsecase(gh<_i38.LoginRepository>()));
    gh.lazySingleton<_i44.GetProductUsecase>(
        () => _i44.GetProductUsecase(gh<_i35.ItemRepository>()));
    gh.lazySingleton<_i45.GetProfileLoginUsecase>(
        () => _i45.GetProfileLoginUsecase(gh<_i38.LoginRepository>()));
    gh.factory<_i46.ItemCubit>(
        () => _i46.ItemCubit(gh<_i44.GetProductUsecase>()));
    gh.factory<_i47.LoginCubit>(() => _i47.LoginCubit(
          gh<_i43.GetLoginUsecase>(),
          gh<_i45.GetProfileLoginUsecase>(),
        ));
    gh.lazySingleton<_i48.SettingLocalDatasource>(() =>
        _i48.SettingLocalDatasourceImpl(gh<_i41.SharedPreferenceService>()));
    gh.lazySingleton<_i49.SettingRepository>(() => _i50.SettingRepositoryImpl(
          gh<_i24.SettingRemoteDatasource>(),
          gh<_i48.SettingLocalDatasource>(),
        ));
    gh.lazySingleton<_i51.UpdateProfileUsecase>(
        () => _i51.UpdateProfileUsecase(gh<_i49.SettingRepository>()));
    gh.lazySingleton<_i52.ChangePasswordUsecase>(
        () => _i52.ChangePasswordUsecase(gh<_i49.SettingRepository>()));
    gh.lazySingleton<_i53.GetLanguageUsecase>(
        () => _i53.GetLanguageUsecase(gh<_i49.SettingRepository>()));
    gh.lazySingleton<_i54.GetProfileUsecase>(
        () => _i54.GetProfileUsecase(gh<_i49.SettingRepository>()));
    gh.lazySingleton<_i55.SetLanguageUsecase>(
        () => _i55.SetLanguageUsecase(gh<_i49.SettingRepository>()));
    gh.factory<_i56.SettingCubit>(() => _i56.SettingCubit(
          gh<_i51.UpdateProfileUsecase>(),
          gh<_i52.ChangePasswordUsecase>(),
          gh<_i53.GetLanguageUsecase>(),
          gh<_i55.SetLanguageUsecase>(),
          gh<_i54.GetProfileUsecase>(),
        ));
    return this;
  }
}

class _$InjectionModule extends _i57.InjectionModule {}
