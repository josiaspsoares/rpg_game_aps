import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'pages/landing_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, widget) => ResponsiveWrapper.builder(
          ClampingScrollWrapper.builder(context, widget!),
          maxWidth: 800,
          minWidth: 480,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(480, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ],
          background: Container(color: const Color(0xFFF5F5F5))),
      title: 'RPG Game',
      routes: {
        '/': (context) => LandingPage(),
      },
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: const MaterialColor(4294930827, {
          50: Color(0xffffe5ea),
          100: Color(0xffffccd5),
          200: Color(0xffff99ac),
          300: Color(0xffff6682),
          400: Color(0xffff3358),
          500: Color(0xffff002f),
          600: Color(0xffcc0025),
          700: Color(0xff99001c),
          800: Color(0xff660013),
          900: Color(0xff330009)
        }),
      ),
    );
  }
}
