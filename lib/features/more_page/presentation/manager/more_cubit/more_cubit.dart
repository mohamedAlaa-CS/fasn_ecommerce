import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'more_state.dart';

class MoreCubit extends Cubit<MoreState> {
  MoreCubit() : super(MoreInitial());

  static MoreCubit get(context) => BlocProvider.of(context);
  bool settingIsShow = false;

  changeSettingIsShow() {
    settingIsShow = !settingIsShow;
    emit(MoreChangeSettingIsShow());
  }
}
