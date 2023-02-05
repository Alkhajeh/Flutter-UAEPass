import 'package:flutter/material.dart';

import 'package:uaepass/uaepass.dart';

void main() {
  Uaepass.init(
    env: UaePassEnv.stg,
    appScheme: 'poc',
    clientId: 'sandbox_stage',
    clientSecret: 'sandbox_stage',
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _uaepassPlugin = Uaepass.instance;
  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF55C9B2),
          foregroundColor: Colors.black,
          title: const Text('UAE Pass'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (isLoggedIn)
                Column(
                  children: [
                    Text('Name: ${_uaepassPlugin.user?.fullnameEN}'),
                    Text('Name: ${_uaepassPlugin.user?.fullnameAR}'),
                    Text(_uaepassPlugin.isLoggedIn().toString()),
                  ],
                ),
              Text('Default', style: Theme.of(context).textTheme.headlineSmall),
              uaepassButton(
                lang: UaepassLang.en,
                type: UaepassButtonType.normal,
                theme: UaePassButtonTheme.white,
              ),
              uaepassButton(
                lang: UaepassLang.ar,
                type: UaepassButtonType.normal,
                theme: UaePassButtonTheme.white,
              ),
              uaepassButton(
                lang: UaepassLang.en,
                type: UaepassButtonType.normal,
                theme: UaePassButtonTheme.outline,
              ),
              uaepassButton(
                lang: UaepassLang.ar,
                type: UaepassButtonType.normal,
                theme: UaePassButtonTheme.outline,
              ),
              uaepassButton(
                lang: UaepassLang.en,
                type: UaepassButtonType.normal,
                theme: UaePassButtonTheme.dark,
              ),
              uaepassButton(
                lang: UaepassLang.ar,
                type: UaepassButtonType.normal,
                theme: UaePassButtonTheme.dark,
              ),
              const Divider(),
              Text('Pill', style: Theme.of(context).textTheme.headlineSmall),
              uaepassButton(
                lang: UaepassLang.en,
                type: UaepassButtonType.pill,
                theme: UaePassButtonTheme.white,
              ),
              uaepassButton(
                lang: UaepassLang.ar,
                type: UaepassButtonType.pill,
                theme: UaePassButtonTheme.white,
              ),
              uaepassButton(
                lang: UaepassLang.en,
                type: UaepassButtonType.pill,
                theme: UaePassButtonTheme.outline,
              ),
              uaepassButton(
                lang: UaepassLang.ar,
                type: UaepassButtonType.pill,
                theme: UaePassButtonTheme.outline,
              ),
              uaepassButton(
                lang: UaepassLang.en,
                type: UaepassButtonType.pill,
                theme: UaePassButtonTheme.dark,
              ),
              uaepassButton(
                lang: UaepassLang.ar,
                type: UaepassButtonType.pill,
                theme: UaePassButtonTheme.dark,
              ),
              const Divider(),
              Text('Sharp', style: Theme.of(context).textTheme.headlineSmall),
              uaepassButton(
                lang: UaepassLang.en,
                type: UaepassButtonType.sharp,
                theme: UaePassButtonTheme.white,
              ),
              uaepassButton(
                lang: UaepassLang.ar,
                type: UaepassButtonType.sharp,
                theme: UaePassButtonTheme.white,
              ),
              uaepassButton(
                lang: UaepassLang.en,
                type: UaepassButtonType.sharp,
                theme: UaePassButtonTheme.outline,
              ),
              uaepassButton(
                lang: UaepassLang.ar,
                type: UaepassButtonType.sharp,
                theme: UaePassButtonTheme.outline,
              ),
              uaepassButton(
                lang: UaepassLang.en,
                type: UaepassButtonType.sharp,
                theme: UaePassButtonTheme.dark,
              ),
              uaepassButton(
                lang: UaepassLang.ar,
                type: UaepassButtonType.sharp,
                theme: UaePassButtonTheme.dark,
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }

  UaepassLoginButton uaepassButton({
    required UaepassButtonType type,
    required UaePassButtonTheme theme,
    required UaepassLang lang,
  }) {
    return UaepassLoginButton(
      type: type,
      theme: theme,
      lang: lang,
      onCallback: () =>
          setState(() => isLoggedIn = Uaepass.instance.isLoggedIn()),
    );
  }
}
