import 'package:authentication/data/authorization_interceptor.dart';
import 'package:authentication/data/login_service.dart';
import 'package:authentication/data/token_storage_service.dart';
import 'package:authentication/domain/login_bloc.dart';
import 'package:authentication/presentation/authentication_screen.dart';
import 'package:core/api_response_interceptor.dart';
import 'package:dasi/l10n/arb/app_localizations.dart';
import 'package:dasi/main_development.dart';
import 'package:dasi/theme.dart';
import 'package:dasi/util.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';
import 'package:home/data/listing_repository.dart';
import 'package:home/data/listing_service.dart';
import 'package:home/data/order_service.dart';
import 'package:home/domain/blocs/create_order_cubit.dart';
import 'package:home/domain/blocs/listing_cubit.dart';
import 'package:home/domain/blocs/listing_details_cubit.dart';
import 'package:home/presentation/create_listing_screen.dart';
import 'package:home/presentation/create_order_screen.dart';
import 'package:home/presentation/home_screen.dart';
import 'package:home/presentation/listing_details_screen.dart';

class App extends StatefulWidget {
  App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final GoRouter _router = GoRouter(
    initialLocation: '/',
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
              return ListingDetailsScreen(id: int.parse(id));
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
  void initState() {
    super.initState();

    NotificationService.init();
  }

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    final textTheme = createTextTheme(context, 'Belanosima', 'Belanosima');
    final theme = MaterialTheme(textTheme);
    final tokenStorageService = TokenStorageService();
    final dio = Dio( BaseOptions( baseUrl: 'http://10.0.2.2:8085', connectTimeout: const Duration(milliseconds: 5000), receiveTimeout: const Duration(milliseconds: 3000) ) )
      ..interceptors.addAll( <Interceptor>[ ApiResponseInterceptor(router: _router), AuthorizationInterceptor(tokenStorageService: tokenStorageService) ] );
    final listingRepository = ListingRepositoryImpl( listingService: ListingService( dio ) );
    final authLoginService = ApiLoginService( Dio( BaseOptions( baseUrl: 'http://10.0.2.2:9000' ) ) );
    final orderDio = Dio( BaseOptions( baseUrl: 'http://10.0.2.2:8089' ) )
      ..interceptors.addAll( <Interceptor>[ ApiResponseInterceptor(router: _router), AuthorizationInterceptor(tokenStorageService: tokenStorageService) ] );
    final orderService = OrderService( orderDio ) ;

    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>( create: (BuildContext context) => LoginCubit( authLoginService: authLoginService, tokenStorageService: tokenStorageService) ),
        BlocProvider<ListingCubit>( create: (BuildContext context) => ListingCubit( listingRepository: listingRepository, orderService: orderService ) ),
        BlocProvider<ListingDetailsCubit>( create: (BuildContext context) => ListingDetailsCubit( listingRepository:listingRepository ) ),
        BlocProvider<CreateOrderCubit>( create: (BuildContext context) => CreateOrderCubit( orderService: orderService ) ),
      ],
      child: MaterialApp.router(
        routerConfig: _router,
        theme: brightness == Brightness.light ? theme.light() : theme.dark(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}

class NotificationService {
  static const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description: 'This channel is used for important notifications.', // description
    importance: Importance.max,
  );

  static Future<void> init() async {
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(channel);

    await flutterLocalNotificationsPlugin.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings(),
      ),
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        // Handle notification tap
        print('Notification tapped: ${response.payload}');
      },
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground
    );

    await FirebaseMessaging.instance.getToken().then((message) {
      if (message != null) {
        print('Firebase Messaging Token: $message');
      } else {
        print('Failed to get Firebase Messaging Token');
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final notification = message.notification;
      final android = message.notification?.android;

      print('Notification handled $notification, $android');

      // If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                icon: android.smallIcon,
                importance: Importance.max,
                priority: Priority.max,

              ),
            ));
      }
    });
  }
}
