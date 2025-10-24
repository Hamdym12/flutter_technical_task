import 'dart:developer';
import 'package:bloc/bloc.dart';

class AppBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    log('🔄 Bloc state changed: ${bloc.runtimeType} -> $change');
  }

  @override
  void onClose(BlocBase bloc) {
    log('❌ Bloc closed: ${bloc.runtimeType}');
  }

  @override
  void onCreate(BlocBase bloc) {
    log('✅ Bloc created: ${bloc.runtimeType}');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('🚨 Error in ${bloc.runtimeType}: $error\n$stackTrace');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    log('📢 Event received in ${bloc.runtimeType}: $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log('🔀 Transition in ${bloc.runtimeType}: $transition');
  }

  @override
  void onDone(Bloc bloc, Object? event, [Object? error, StackTrace? stackTrace]) {
    log('✅ Bloc done: ${bloc.runtimeType}');
  }
}