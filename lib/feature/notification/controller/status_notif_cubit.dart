import 'package:flutter_bloc/flutter_bloc.dart';

class StatusNotifCubit extends Cubit<bool> {
  StatusNotifCubit() : super(false);
  void setPage(bool newPage) {
    emit(newPage);
  }
}
