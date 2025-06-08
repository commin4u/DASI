import 'package:authentication/data/login_service.dart';
import 'package:authentication/domain/login_bloc.dart';
import 'package:authentication/presentation/authentication_screen.dart';
import 'package:core/api_response_interceptor.dart';
import 'package:dasi/l10n/arb/app_localizations.dart';
import 'package:dasi/theme.dart';
import 'package:dasi/util.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:home/data/listing_repository.dart';
import 'package:home/data/listing_service.dart';
import 'package:home/domain/blocs/listing_cubit.dart';
import 'package:home/presentation/create_listing_screen.dart';
import 'package:home/presentation/create_order_screen.dart';
import 'package:home/presentation/home_screen.dart';
import 'package:home/presentation/listing_details_screen.dart';

class App extends StatelessWidget {
  App({super.key});

  final GoRouter _router = GoRouter(
    initialLocation: _checkInitialLocation(),
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      GoRoute(
        name: 'auth',
        path: '/auth',
        builder: (BuildContext context, GoRouterState state) {
          return AuthenticationScreen();
        },
      ),
      GoRoute(
        name: 'home',
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            name: 'createOrder',
            path: 'order/create',
            builder: (BuildContext context, GoRouterState state) {
              return const CreateOrderScreen();
            },
          ),
          GoRoute(
            name: 'listingDetails',
            path: 'listing/:id',
            builder: (BuildContext context, GoRouterState state) {
              final id = state.pathParameters['id']!;
              return ListingDetailsScreen(id: id);
            },
          ),
          GoRoute(
            path: 'listing',
            name: 'createListing',
            builder: (BuildContext context, GoRouterState state) {
              // Placeholder for create listing screen
              return const CreateListingScreen();
            },
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {

    final brightness = View.of(context).platformDispatcher.platformBrightness;
    final textTheme = createTextTheme(context, 'Belanosima', 'Belanosima');
    final theme = MaterialTheme(textTheme);

    final dio = Dio(
      BaseOptions(
        baseUrl: 'http://10.0.2.2:8085',
        connectTimeout: const Duration(milliseconds: 5000),
        receiveTimeout: const Duration(milliseconds: 3000),
      ),
    );

    dio.interceptors.addAll(
      <Interceptor>[
        ApiResponseInterceptor(router: _router),
      ],
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (BuildContext context) => LoginCubit(
            repository: MockLoginService(),
          ),
        ),
        BlocProvider<ListingCubit>(
          create: (BuildContext context) => ListingCubit(
            listingRepository: ListingRepositoryImpl(
              listingService: ListingService(
                dio,
              ),
            ),
          ),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: _router,
        theme: brightness == Brightness.light ? theme.light() : theme.dark(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }

  static String _checkInitialLocation() {
    // Check if the user is authenticated, if not redirect to auth page
    const isAuthenticated = true; // Replace with actual authentication check
    return isAuthenticated ? '/' : '/auth';
  }
}
