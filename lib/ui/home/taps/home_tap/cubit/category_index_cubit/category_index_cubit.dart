import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/ui/home/taps/home_tap/cubit/category_index_cubit/category_index_states.dart';

class CategoryIndexCubit extends Cubit<CategoryIndexStates> {
  CategoryIndexCubit() : super(Intialstatues());
  // hold data
  int currentCategoryIndex = 1;
  // handel logic
  increaseIndex() {
    currentCategoryIndex++;
    emit(Increasestatues());
  }
}
