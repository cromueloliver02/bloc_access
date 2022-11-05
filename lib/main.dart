import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/counter/counter_cubit.dart';
import 'show_me_counter_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (ctx) => CounterCubit(),
      child: MaterialApp(
        title: 'Bloc Access: Generated Route Access',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.grey,
        ),
        routes: {
          HomePage.id: (ctx) => const HomePage(),
          ShowMeCounterPage.id: (ctx) => const ShowMeCounterPage(),
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  static const id = '/';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, ShowMeCounterPage.id),
              child: const Text(
                'Show Me Counter',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () => context.read<CounterCubit>().incrementCounter(),
              child: const Text(
                'Increment',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
