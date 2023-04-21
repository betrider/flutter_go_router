import 'package:androidrouting/controller/navigation_cubit.dart';
import 'package:androidrouting/presentation/home/home_details_screen.dart';
import 'package:androidrouting/presentation/home/home_screen.dart';
import 'package:androidrouting/presentation/login_screen.dart';
import 'package:androidrouting/presentation/main_screen.dart';
import 'package:androidrouting/presentation/profile/profile_details_screen.dart';
import 'package:androidrouting/presentation/profile/profile_screen.dart';
import 'package:androidrouting/presentation/settings/settings_details_screen.dart';
import 'package:androidrouting/presentation/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/utils/constants.dart';
import 'screens/not_found_page.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter _router = GoRouter(
    initialLocation: Routes.homeNamedPage,
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          print(state.fullpath);
          return BlocProvider(
            create: (context) => NavigationCubit(),
            child: MainScreen(screen: child),
          );
        },
        routes: [
          GoRoute(
            path: Routes.homeNamedPage,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: HomeScreen(),
            ),
            routes: [
              // 1번 params 사용
              // GoRoute(
              //   parentNavigatorKey: _rootNavigatorKey,
              //   path: 'details/:title',
              //   builder: (context, state) => HomeDetailsScreen(
              //     title: state.params["title"]!,
              //   ),
              // ),

              // 2번 queryParams 사용
              GoRoute(
                parentNavigatorKey: _rootNavigatorKey,
                path: 'details',
                builder: (context, state) => HomeDetailsScreen(
                  title: state.queryParams["title"]!,
                ),
              ),

              // 2번 queryParams 사용
              // GoRoute(
              //   parentNavigatorKey: _rootNavigatorKey,
              //   name: 'details',
              //   path: 'details1234',
              //   builder: (context, state) => HomeDetailsScreen(
              //     title: state.queryParams["title"]!,
              //   ),
              // ),

              // 3번 extra 사용
              // GoRoute(
              //   parentNavigatorKey: _rootNavigatorKey,
              //   path: 'details',
              //   builder: (context, state) {
              //     Map<String,String> result = state.extra as Map<String,String>; 
              //     return HomeDetailsScreen(
              //       title: result["title"]!,
              //     );
              //   },
              // ),
            ],
          ),
          GoRoute(
            path: Routes.profileNamedPage,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ProfileScreen(),
            ),
            routes: [
              GoRoute(
                path: Routes.profileDetailsNamedPage,
                builder: (context, state) => const ProfileDetailsScreen(),
              ),
            ],
          ),
          GoRoute(
            path: Routes.settingsNamedPage,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: SettingScreen(),
            ),
            routes: [
              GoRoute(
                path: Routes.settingsDetailsNamedPage,
                builder: (context, state) => const SettingsDetailsScreen(),
              ),
            ],
          ),
        ],
      ),
      // 파라미터 사용 시
      GoRoute(
        path: "/login/:name",
        builder: (context, state) => LoginScreen(
          name: state.params["name"]!,
        ),
      ),

      // 다중페이지
      //
      // 최초 진입시 redirct 이후 재호출되면 builder 호출(builder 까지만 호출)
      GoRoute(
        path: "/",
        builder: (context, state) => const LoginScreen(name: "125"),
        // redirect: (context, state) {
        //   return "/";
        // },
        routes: [
          GoRoute(
            path: "a",
            builder: (context, state) => const PageA(),
            routes: [
              GoRoute(
                path: "b",
                builder: (context, state) => PageB(),
                routes: [
                  GoRoute(
                    path: "c",
                    builder: (context, state) => PageC(),
                  )
                ],
              )
            ],
          )
        ],
      )
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );

  static GoRouter get router => _router;
}

class PageA extends StatelessWidget {
  const PageA({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'PageA',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class PageB extends StatelessWidget {
  const PageB({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'PageB',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class PageC extends StatelessWidget {
  const PageC({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'PageC',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
