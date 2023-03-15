import 'package:flutter_bloc/flutter_bloc.dart';

import '../zad_states.dart';

class ZadCubit extends Cubit<ZadStates> {
  ZadCubit() : super(ZadInitialState());

  static ZadCubit get(context) => BlocProvider.of(context);
}
