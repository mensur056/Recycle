import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recycle/features/screens/home/cubit/home_cubit.dart';
import 'package:recycle/features/screens/home/service/general_service.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return HomeCubit(HomeService(Dio(BaseOptions(baseUrl: 'https://recycle-d84ec-default-rtdb.firebaseio.com/'))));
      },
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Text(state.token ?? 'askdjdsjkf'),
                ElevatedButton(
                  child: const Text(''),
                  onPressed: () {
                    context.read<HomeCubit>().initalComplate();
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
