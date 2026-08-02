import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/di/injectoin.config.dart';


final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init();