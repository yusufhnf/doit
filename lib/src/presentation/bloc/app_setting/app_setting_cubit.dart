import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_setting_state.dart';

class AppSettingCubit extends Cubit<AppSettingState> {
  AppSettingCubit() : super(AppSettingInitial());
}
