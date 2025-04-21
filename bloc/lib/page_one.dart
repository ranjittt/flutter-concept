import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation/cubit/common_state.dart';
import 'package:navigation/cubit/counter_cubit.dart';
import 'package:navigation/page_two.dart';

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  int value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        children: <Widget>[
          IconButton(
            onPressed: () {
              setState(() {
                BlocProvider.of<CounterCubit>(context).increment();
              });
            },
            icon: Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                BlocProvider.of<CounterCubit>(context).decrement();
              });
            },
            icon: Icon(Icons.minimize_outlined),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<CounterCubit, CommonState>(
              builder: (context, state) {
                if (state is CommonLoadingState) {
                  return CupertinoActivityIndicator();
                } else if (state is CommonSuccessState) {
                  return Text(
                    "${state.value}",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  );
                } else {
                  return Text("i dont know");
                }
              },
            ),
            TextButton(
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (_) => PageTwo()));
              },
              child: Text("Move to page 2"),
            ),
          ],
        ),
      ),
    );
  }
}
