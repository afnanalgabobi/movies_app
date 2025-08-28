import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/model/register_request.dart';
import 'package:movies_app/ui/auth/register_auth/cubit/register_states.dart';

import '../../../../api/api_manager.dart';

class RegisterViewModel extends Cubit<RegisterStates> {
  //todo: hold data - handle logic
  RegisterViewModel() : super(RegisterInitialState());

  Future<void> register(RegisterRequest request) async {
    try {
      //todo: Loading
      emit(RegisterLoadingState());
      var response = await ApiManager.registerAuth(request);
      //todo: success
      emit(RegisterSuccessState(response.user!));
    } catch (e) {
      //todo: error
      emit(RegisterErrorState(e.toString()));
    }
  }
}
