import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';
import 'injections.config.dart';
	
final getIt = GetIt.instance;  
  
@injectableInit
void configureDependencies() => getIt.init();