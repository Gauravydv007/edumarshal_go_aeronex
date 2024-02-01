import 'package:auto_route/auto_route.dart';
import 'package:edumarshal/core/router/router.gr.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../auth/auth.dart';

@RoutePage(
  deferredLoading: true,
)
class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DBRepository handler = DBRepository();
    handler.getUserById(1).then((value) {
      Future.delayed(const Duration(seconds: 2), () {
        value != null
            ? context.router.replace(
                HiddenDrawerRoute(accessToken: value.accessToken),
              )
            : context.router.replaceNamed('/login');
      });
    }).catchError((e) {
      if (kDebugMode) {
        print(e);
      }

      context.router.replaceNamed('/login');
      return null;
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SvgPicture.asset(
          'assets/images/Aeronex.svg',
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
