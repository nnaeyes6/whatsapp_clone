import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/featutes/auth/controller/auth_controller_riverpod.dart';
import 'package:whatsapp_clone/firebase_services/firebase_options.dart';
import 'package:whatsapp_clone/model/user_model.dart';
import 'package:whatsapp_clone/router.dart' as route;

import 'core/constants/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const ProviderScope(child: WhatsAppClone()));
}

class WhatsAppClone extends ConsumerStatefulWidget {
  const WhatsAppClone({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => WhatsAppCloneState();
}

class WhatsAppCloneState extends ConsumerState<WhatsAppClone> {
  final _navigationKey = GlobalKey<NavigatorState>();

  late final Future<void> _initialize;
  ProviderSubscription<UserModel>? _userModelSub;

  @override
  void initState() {
    super.initState();
    _initialize = ref.read(authControllerProvider).init().then((_) {
      _userModelSub = ref.listenManual(userDataAuthProvider, (previous, next) {
        if (next == UserModel.none) {
          _navigationKey.currentState!.clearAndNavigateToLanding();
        } else {
          _navigationKey.currentState!.clearAndNavigateToHome();
        }
      });
    });
  }

  @override
  void dispose() {
    _userModelSub?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialize,
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const SizedBox();
        }
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: _navigationKey,
          title: 'Whatsapp UI',
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: backgroundColor,
            appBarTheme: const AppBarTheme(color: appBarColor, elevation: 0),
          ),
          onGenerateRoute: route.onGenerateRoute,
          initialRoute: route.initialRoute(ref),
        );
      },
    );
  }
}
