import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer';

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log('onCreate -- ${bloc.runtimeType}');
    log('Bloc Instance: $bloc');
  }

  @override
  void onChange(BlocBase bloc, Change change, [StackTrace? stackTrace]) {
    super.onChange(bloc, change);
    log('onChange -- ${bloc.runtimeType}, $change');
    log('Bloc Instance: $bloc');
    log('Current State: ${change.currentState}');
    log('Next State: ${change.nextState}');
    if (stackTrace != null) {
      log('State change called from: $stackTrace');
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('onError -- ${bloc.runtimeType}  , ${bloc.stream}, $error');
    log('Bloc Instance: $bloc');
    log('StackTrace: $stackTrace');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    print('onClose -- ${bloc.runtimeType}');
    log('Bloc Instance: $bloc');
    log('StackTrace: ${StackTrace.current}');
    super.onClose(bloc);
  }
}
