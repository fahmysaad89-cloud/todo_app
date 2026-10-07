import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/features/counter/cubit/counter_cubit.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterCubit, CounterState>(
            builder: (context, state) {
              return Text(
                context.read<CounterCubit>().counter.toString(),
                style: TextStyle(fontSize: 20, fontWeight: .bold),
              );
            },
          ),
          Text('data'),
          Text('data'),
          Text('data'),
          BlocBuilder<CounterCubit, CounterState>(
            builder: (context, state) {
              return Row(
                spacing: 30.w,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      context.read<CounterCubit>().increamentcounter();
                    },
                    icon: Icon(Icons.add, size: 40),
                  ),
                  Text(
                    context.read<CounterCubit>().counter.toString(),
                    style: TextStyle(fontSize: 30, fontWeight: .bold),
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<CounterCubit>().decreamentcounter();
                    },
                    icon: Icon(Icons.remove, size: 40),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
