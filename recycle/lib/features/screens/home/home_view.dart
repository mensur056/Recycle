import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:recycle/features/screens/home/cubit/home_cubit.dart';
import 'package:recycle/features/screens/home/provider/home_view_provider.dart';
import 'package:recycle/features/screens/home/service/general_service.dart';
import 'package:recycle/product/const/borders/project_borders.dart';
import 'package:recycle/product/const/padding/project_paddings.dart';
import 'package:recycle/product/const/paths/image_paths.dart';
import 'package:recycle/product/const/strings/home_strings.dart';
import 'package:recycle/product/widgets/catagory_card.dart';

import 'package:kartal/kartal.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with ImagePaths, ProjectPaddings, HomeString, TickerProviderStateMixin {
  late final AnimationController lottiController;

  double value = 1;
  @override
  void initState() {
    super.initState();
    lottiController = AnimationController(vsync: this, duration: context.durationNormal);
  }

  void changeLottiIcon() {
    lottiController.animateTo(HomeViewProvider().value);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeService(Dio())),
      child: Scaffold(
        bottomNavigationBar: const BottomNavBar(),
        appBar: appBar(),
        body: Padding(
          padding: paddingAll8,
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            children: [
              CatagoryCard(imagePath: plasticImage, title: plastic),
              CatagoryCard(imagePath: appleImage, title: organics),
              CatagoryCard(imagePath: glassImage, title: glass),
              CatagoryCard(imagePath: spoonImage, title: metal),
              CatagoryCard(imagePath: paperImage, title: paper),
              CatagoryCard(imagePath: otherImage, title: other),
            ],
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      actions: [_lottiThemeIcon()],
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            borderRadius: ProjectBorders.radiusCircularVertical44,
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[Color.fromARGB(255, 74, 214, 79), Color.fromARGB(255, 22, 210, 29)])),
      ),
      toolbarHeight: 100,
    );
  }

  Widget _lottiThemeIcon() => BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return InkWell(
            onTap: () {
              changeLottiIcon();
              context.read<HomeViewProvider>().changeThemeData();
            },
            child: LottieBuilder.asset(
              'assets/lotti/recycle_theme.json',
              controller: lottiController,
              repeat: false,
            ),
          );
        },
      );
}

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 2;
  double iconWidth = 32;

  void changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: (index) {
          changeIndex(index);
        },
        unselectedItemColor: Colors.grey,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: SvgPicture.asset(
              'assets/icons/ic_r_leaf.svg',
              width: iconWidth,
              color: currentIndex == 0 ? Colors.green : Colors.grey,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: SvgPicture.asset(
              'assets/icons/ic_r_notification.svg',
              width: iconWidth,
              color: currentIndex == 1 ? Colors.green : Colors.grey,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: SvgPicture.asset(
              'assets/icons/ic_r_recycle.svg',
              width: iconWidth,
              color: currentIndex == 2 ? Colors.green : Colors.grey,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: SvgPicture.asset(
              'assets/icons/ic_r_profile.svg',
              width: iconWidth,
              color: currentIndex == 3 ? Colors.green : Colors.grey,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: SvgPicture.asset(
              'assets/icons/ic_r_menu.svg',
              width: iconWidth,
              color: currentIndex == 4 ? Colors.green : Colors.grey,
            ),
          ),
        ]);
  }
}
