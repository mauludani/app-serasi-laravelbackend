part of 'widgets.dart';

class MySidebar extends StatefulWidget {
  @override
  _MySidebarState createState() => _MySidebarState();
}

class _MySidebarState extends State<MySidebar> {

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.all(10.0), children: [
      Container(
          height: context.mediaQuery.size.height - 150,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 170,
                width: double.infinity,
                padding: EdgeInsets.only(top: 24),
                child: Column(
                  children: [
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(45),
                          image: DecorationImage(
                              image: AssetImage('assets/profile.png'),
                              fit: BoxFit.cover)),
                    ),
                  ],
                ),
              ),
              Container(
                  child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 40),
                    primary: Colors.grey[300],
                    elevation: 0),
                onPressed: () async {
                  SharedPreferences preferences =
                      await SharedPreferences.getInstance();
                  context
                      .read<UserCubit>()
                      .updateDeviceId(preferences.getString("nis") ?? '', "");

                  await preferences.clear();
                  await OneSignal.shared.setSubscription(false);

                  Get.offAll(LoginPages());
                },
                child: Text(
                  "Keluar",
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: Colors.black,
                          letterSpacing: .5,
                          fontSize: 14,
                          fontWeight: FontWeight.w700)),
                ),
              ))
            ],
          ))
    ]);
  }
}
