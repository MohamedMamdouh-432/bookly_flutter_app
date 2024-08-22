import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class BooklyObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    log('$bloc: $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('$bloc: ${change.nextState}');
  }
}
