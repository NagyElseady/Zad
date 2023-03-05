import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../zad_states.dart';

class ZadCubit extends Cubit<ZadStates> {
  ZadCubit() : super(ZadInitialState());

  static ZadCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/file.txt');
  }
}
