part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({this.items, this.isLoading});
  final List<UserModel>? items;
  final bool? isLoading;
  @override
  List<Object?> get props => [items, isLoading];

  HomeState copyWith({List<UserModel>? items, bool? isLoading}) {
    return HomeState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
