abstract class NewsStates{}

class NewsInitialState extends NewsStates{}
class NewsBottomNavState extends NewsStates{}
class NewsGetBusinessLoadingState extends NewsStates{}
class NewsGetBusinessSuccessfulState extends NewsStates{}
class NewsGetBusinessErrorState extends NewsStates{
  final String error;
  NewsGetBusinessErrorState(this.error);
}

class NewsGetSportsLoadingState extends NewsStates{}
class NewsGetSportsSuccessfulState extends NewsStates{}
class NewsGetSportsErrorState extends NewsStates{
  final String error;
  NewsGetSportsErrorState(this.error);
}

class NewsGetScienceLoadingState extends NewsStates{}
class NewsGetScienceSuccessfulState extends NewsStates{}
class NewsGetScienceErrorState extends NewsStates{
  final String error;
  NewsGetScienceErrorState(this.error);
}

class NewsChangeAppTheme extends NewsStates{}

class NewsGetSearchLoadingState extends NewsStates{}
class NewsGetSearchSuccessfulState extends NewsStates{}
class NewsGetSearchErrorState extends NewsStates{
  final String error;
  NewsGetSearchErrorState(this.error);
}
