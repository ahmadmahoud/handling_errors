import 'package:get_it/get_it.dart';
import 'package:handling_error/core/util/bloc/cubit.dart';
import 'package:handling_error/core/util/database/remote/dio_helper.dart';
import 'package:handling_error/core/util/database/repository.dart';

final di = GetIt.instance;

Future<void> init() async {

  di.registerFactory(() => AppBloc(
    repository: di(),
  ));

  di.registerLazySingleton<DioHelper>(
        () => DioImpl(),
  );

  di.registerLazySingleton<Repository>(
        () => RepositoryImplementation(
      dioHelper: di(),
    ),
  );
}


 // registerFactory => start with run app
 // registerLazySingleton => start is used only .