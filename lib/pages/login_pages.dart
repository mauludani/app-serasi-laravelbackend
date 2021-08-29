part of 'pages.dart';

class LoginPages extends StatefulWidget {
  @override
  _LoginPagesState createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                  width: double.infinity,
                  height: context.mediaQuery.size.height * 0.5,
                  color: Colors.white,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(
                            child: Image(
                              image: AssetImage('assets/logo.png'),
                              height: 120,
                              width: 120,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 24),
                          child: Text(
                            "MONITORING",
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  color: "DE4C4C".toColor(),
                                  letterSpacing: .5,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        Container(
                          // margin: EdgeInsets.only(top: 10),
                          child: Text(
                            "Aplikasi Administrasi",
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                color: Colors.black87,
                                letterSpacing: .5,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Container(
                            margin:
                                EdgeInsets.only(top: 24, left: 34, right: 34),
                            child: RichText(
                              text: TextSpan(children: <TextSpan>[
                                TextSpan(
                                  text: "Masukan ",
                                  style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                      color: Colors.black87,
                                      letterSpacing: .5,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                TextSpan(
                                  text: "Nomer Induk Siswa ",
                                  style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                        color: Colors.black,
                                        letterSpacing: .5,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                TextSpan(
                                  text: "anda dan lihat laporan belajar anda !",
                                  style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                      color: Colors.black87,
                                      letterSpacing: .5,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ]),
                              textAlign: TextAlign.center,
                            ))
                      ],
                    ),
                  )),
              Container(
                width: double.infinity,
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 34),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                            color: 'EEEEEE'.toColor(),
                            borderRadius: BorderRadius.circular(11)),
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    color: Colors.grey,
                                    letterSpacing: .5,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                              hintText: "Nomer Induk Siswa"),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 34, right: 34, top: 20),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                            color: 'EEEEEE'.toColor(),
                            borderRadius: BorderRadius.circular(11)),
                        child: TextField(
                          obscureText: true,
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    color: Colors.grey,
                                    letterSpacing: .5,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                              hintText: "Password"),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 34, right: 34, top: 20),
                        child: isLoading
                            ? loadingIndicator
                            : ElevatedButton(
                                onPressed: () async {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  var status = await OneSignal.shared
                                      .getPermissionSubscriptionState();
                                  await context.read<UserCubit>().signIn(
                                      emailController.text,
                                      passwordController.text);

                                  UserState state =
                                      context.read<UserCubit>().state;

                                  if (state is UserLoaded) {
                                    var playerId =
                                        status.subscriptionStatus.userId;
                                    print('loginberhasil');
                                    await context
                                        .read<UserCubit>()
                                        .updateDeviceId(
                                            emailController.text, playerId);
                                    
                                      Get.offAll(MainMenuPages());
                                  } else {
                                    setState(() {
                                      Get.snackbar("", "",
                                          backgroundColor: "D9435E".toColor(),
                                          icon: Icon(
                                            MdiIcons.closeCircleOutline,
                                            color: Colors.white,
                                          ),
                                          titleText: Text(
                                            "Masuk Gagal",
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          messageText: Text(
                                            (state as UserLoadingFailed)
                                                .message,
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                color: Colors.white),
                                          ));
                                      isLoading = false;
                                    });
                                  }
                                },
                                child: Text(
                                  "Masuk",
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          letterSpacing: .5,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700)),
                                ),
                                style: ElevatedButton.styleFrom(
                                    minimumSize: Size(double.infinity, 50)),
                              ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
