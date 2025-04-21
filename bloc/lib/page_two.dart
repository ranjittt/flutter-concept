import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation/cubit/common_state.dart';
import 'package:navigation/cubit/counter_cubit.dart';

class PageTwo extends StatefulWidget {
  PageTwo({super.key});

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("This is page"),
            BlocBuilder<CounterCubit, CommonState>(
              builder: (context, state) {
                if (state is CommonLoadingState) {
                  return CupertinoActivityIndicator();
                } else if (state is CommonSuccessState) {
                  return Text("${state.value}");
                } else {
                  return Text("I don't know");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
