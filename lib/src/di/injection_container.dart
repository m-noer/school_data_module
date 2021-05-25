import 'package:get_it/get_it.dart';
import 'package:school_data_module/school_data_module.dart';
import 'package:school_data_module/src/repositories/auth_repository_impl.dart';
import 'package:school_domain_module/school_domain_module.dart';

final inject = GetIt.instance;

Future<void> init() async {
  // Repository
  inject.registerFactory<AuthRepository>(() => AuthRepositoryImpl(inject()));

  // Datasources
  inject
      .registerFactory<RemoteDataSource>(() => RemoteDataSourceImpl(inject()));
}
