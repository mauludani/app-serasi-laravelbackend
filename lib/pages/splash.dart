part of 'pages.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool isLoading = false;
  afterSplash() async {
    final SharedPreferences memo = await SharedPreferences.getInstance();

    Future.delayed(Duration(milliseconds: 1500)).then((value) {
      memo.getBool('signed_in') == true || memo.getBool('guest_user') == true
          ? gotoMainMenuPage()
          : gotoHomePage();
    });
  }

  gotoHomePage() {
    Get.offNamed("/Welcome");
  }

  gotoMainMenuPage() async {
    final SharedPreferences memo = await SharedPreferences.getInstance();
    await context
        .read<UserCubit>()
        .signIn(memo.getString("nis") ?? '', memo.getString("pass") ?? '');
    // context.read<AbsensiCubit>().getAbsensis();
    UserState state = context.read<UserCubit>().state;
    if (state is UserLoaded) {
      context.read<NilaiCubit>().getNilais();
      // context.read<AbsensiCubit>().getAbsensis();
      Get.offAll(MainMenuPages());
    }
  }

  @override
  void initState() {
    afterSplash();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: "FFFFFF".toColor(),
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/logo-trisakti.png'),
              height: 120,
              width: 120,
              fit: BoxFit.contain,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Aplikasi Administrasi',
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                    color: Colors.black,
                    letterSpacing: .5,
                    fontSize: 22,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Text('SMK TRISAKTI TULANGAN',
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        color: Colors.black45,
                        letterSpacing: .5,
                        fontSize: 12,
                        fontWeight: FontWeight.w700))),
          ],
        ),
      ),
    );
  }
}
