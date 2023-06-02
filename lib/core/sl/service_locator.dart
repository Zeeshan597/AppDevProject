import 'package:aitebar/core/bloc/search/search_cubit.dart';
import 'package:aitebar/core/services/domain/auth_facade.dart';
import 'package:aitebar/core/services/domain/funds_request_facade.dart';
import 'package:aitebar/core/services/firebase_service/auth_service.dart';
import 'package:aitebar/core/services/firebase_service/firebase_funds_request_service.dart';
import 'package:aitebar/core/services/picker/file_picker.dart';
import 'package:aitebar/core/services/picker/file_picker_facade.dart';
import 'package:aitebar/mobile/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:aitebar/mobile/features/auth/presentation/blocs/auth_form_cubit/auth_form_cubit.dart';
import 'package:aitebar/mobile/features/common/bloc/uploading_status_manager/uploading_status_manager_cubit.dart';
import 'package:aitebar/mobile/features/common/domain/cloud_storage_facade.dart';
import 'package:aitebar/mobile/features/common/insfrastruture/firebase_storage_service.dart';
import 'package:aitebar/mobile/features/create_funds_request/presentation/bloc/funds_request/funds_request_cubit.dart';
import 'package:aitebar/mobile/features/create_funds_request/presentation/bloc/request_fund_form_cubit/request_fund_form_cubit.dart';
import 'package:aitebar/mobile/features/dashboard/presentation/bloc/user_funds_requests/user_funds_requests_cubit.dart';
import 'package:aitebar/web/features/auth/domain/auth_facade.dart';
import 'package:aitebar/web/features/auth/infrastructure/firebase_auth_service.dart';
import 'package:aitebar/web/features/auth/presentation/bloc/admin/admin_cubit.dart';
import 'package:aitebar/web/features/auth/presentation/bloc/auth/auth_cubit.dart';
import 'package:aitebar/web/features/auth/presentation/bloc/login_form/login_form_cubit.dart';
import 'package:aitebar/web/features/dashboard/presentation/bloc/funds_requests/funds_requests_cubit.dart';
import 'package:aitebar/web/features/dashboard/presentation/bloc/users/users_cubit.dart';
import 'package:aitebar/web/features/funds_request_details/presentation/bloc/manage_funds_request/manage_funds_request_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void configureDependencies() {
  sl.registerLazySingleton(() => SearchCubit());
  sl.registerFactory<IAuthFacade>(() => AuthService());
  sl.registerFactory(() => AuthBloc());
  sl.registerLazySingleton(() => AuthFormCubit());
  sl.registerFactory<IFundsRequestFacade>(() => FirebaseFundsRequestService());
  sl.registerLazySingleton<FilePickerFacade>(() => FilePicker());
  sl.registerFactory(() => UploadingStatusManagerCubit());
  sl.registerLazySingleton<ICloudStorageFacade>(() => FirebaseStorageService());
  sl.registerFactory(() => FundsRequestCubit(sl(), sl()));
  sl.registerFactory(() => RequestFundFormCubit());
  sl.registerLazySingleton(() => UserFundsRequestsCubit(sl()));
  sl.registerLazySingleton<IAdminAuthFacade>(() => FirebaseAuthService());
  sl.registerLazySingleton(() => AdminCubit());
  sl.registerFactory(() => AuthCubit(sl()));
  sl.registerFactory(() => LoginFormCubit());
  sl.registerFactory(() => ManageFundsRequestCubit(sl()));
  sl.registerFactory(() => UsersCubit());
  sl.registerLazySingleton(() => FundsRequestsCubit());
}
