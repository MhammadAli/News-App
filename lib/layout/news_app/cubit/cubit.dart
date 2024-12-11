import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/news_app/cubit/states.dart';
import 'package:untitled/modules/business/business_screen.dart';
import 'package:untitled/modules/science/science_screen.dart';
import 'package:untitled/modules/settings_screen/settings_screen.dart';
import 'package:untitled/modules/sports/sports_screen.dart';
import 'package:untitled/shared/network/local/cache_helper.dart';

import '../../../shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.business,
        ),
        label: 'Business'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.sports,
        ),
        label: 'Sports'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.science,
        ),
        label: 'Science'),
  ];

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];

  void getBusinessNews() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apikey': 'a1ceb6ab7d534930aa1daf9167497b95'
      },
    ).then(
      (value) {
        print(value.data.toString());
        business = value.data['articles'];
        emit(NewsGetBusinessSuccessfulState());
      },
    ).catchError((error) {
      print(error.toString());
      emit(
        NewsGetBusinessErrorState(error.toString()),
      );
    });
  }

  List<dynamic> sports = [];

  void getSportsNews() {
    emit(NewsGetSportsLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'sports',
        'apikey': 'a1ceb6ab7d534930aa1daf9167497b95'
      },
    ).then(
      (value) {
        print(value.data.toString());
        sports = value.data['articles'];
        emit(NewsGetSportsSuccessfulState());
      },
    ).catchError((error) {
      print(error.toString());
      emit(
        NewsGetSportsErrorState(error.toString()),
      );
    });
  }

  List<dynamic> science = [];

  void getScienceNews() {
    emit(NewsGetScienceLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'science',
        'apikey': 'a1ceb6ab7d534930aa1daf9167497b95'
      },
    ).then(
      (value) {
        print(value.data.toString());
        science = value.data['articles'];
        emit(NewsGetScienceSuccessfulState());
      },
    ).catchError((error) {
      print(error.toString());
      emit(
        NewsGetScienceErrorState(error.toString()),
      );
    });
  }

  var isDark = false;

  void changeAppTheme({
    bool? fromShared,
  }) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(NewsChangeAppTheme());
    } else {
      isDark = !isDark;
      CacheHelper.setBoolean(key: 'isDark', value: isDark).then((value) {
        emit(NewsChangeAppTheme());
      });
    }
  }

List<dynamic> search = [];
  void getSearchNews(String query) {
    emit(NewsGetSearchLoadingState());
    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': '$query',
        'apikey': 'a1ceb6ab7d534930aa1daf9167497b95'
      },
    ).then(
          (value) {
        print(value.data.toString());
        search = value.data['articles'];
        emit(NewsGetSearchSuccessfulState());
      },
    ).catchError((error) {
      print(error.toString());
      emit(
        NewsGetSearchErrorState(error.toString()),
      );
    });
  }
}
