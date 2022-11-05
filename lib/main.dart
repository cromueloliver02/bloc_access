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
      title: 'Bloc Access: Generated Route Access',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case HomePage.id:
            return MaterialPageRoute(
              settings: settings,
              builder: (ctx) => BlocProvider.value(
                value: _counterCubit,
                child: const HomePage(),
              ),
            );
          case ShowMeCounterPage.id:
            return MaterialPageRoute(
              settings: settings,
              builder: (ctx) => BlocProvider.value(
                value: _counterCubit,
                child: const ShowMeCounterPage(),
              ),
            );
        }

        return null;
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
