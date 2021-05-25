import 'package:get_it/get_it.dart';
import 'package:school_data_module/src/repositories/auth_repository_impl.dart';

final inject = GetIt.instance;

Future<void> init() async {
  // Repository
  inject.registerFactory(() => AuthRepositoryImpl(inject()));
}
