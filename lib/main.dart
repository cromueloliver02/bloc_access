import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/counter/counter_cubit.dart';
import 'show_me_counter_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final CounterCubit _counterCubit;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Access: Named Route Access',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey,
      ),
      routes: {
        HomePage.id: (ctx) => BlocProvider<CounterCubit>.value(
              value: _counterCubit,
              child: const HomePage(),
            ),
        ShowMeCounterPage.id: (ctx) => BlocProvider<CounterCubit>.value(
              value: _counterCubit,
              child: const ShowMeCounterPage(),
            ),
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _counterCubit = CounterCubit();
  }

  @override
  void dispose() {
    _counterCubit.close();
    super.dispose();
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
