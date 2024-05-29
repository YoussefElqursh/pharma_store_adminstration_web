import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_store_administration_web/modules/0-auth_module/1-login_screen/login_screen.dart';
import 'package:pharma_store_administration_web/shared/bloc_observer.dart';
import 'package:pharma_store_administration_web/shared/blocs/auth_bloc/login_bloc/login_auth_cubit.dart';
import 'package:pharma_store_administration_web/shared/components/constants.dart';
import 'package:pharma_store_administration_web/shared/network/local/app_router.dart';
import 'package:pharma_store_administration_web/shared/network/local/cache_helper.dart';

import 'layouts/home_layout.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.cacheInitialization();
  CacheHelper.getFromCache(key: 'token');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LoginAuthCubit()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: const Color(0xFF4A72FF)),
            useMaterial3: true,
          ),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: accessToken != null && accessToken != ''
              ? HomeScreen.routeName
              : LoginScreen.routeName,
        ));
  }
}
