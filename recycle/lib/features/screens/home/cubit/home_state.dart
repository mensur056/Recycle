part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.items,
    this.isLoading,
    this.token,
  });
  final List<UserModel>? items;
  final bool? isLoading;
  final String? token;
  @override
  List<Object?> get props => [
        items,
        isLoading,
        token,
      ];

  HomeState copyWith({List<UserModel>? items, bool? isLoading, String? token, bool? isDark}) {
    return HomeState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      token: token,
    );
  }
}
