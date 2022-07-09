import 'package:flutter_bloc/flutter_bloc.dart';

class StatusClickCard extends Cubit<bool> {
  StatusClickCard() : super(false);
  void setPage(bool newPage) {
    emit(newPage);
  }
}
