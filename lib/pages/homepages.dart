part of 'pages.dart';

class HomePages extends StatelessWidget {
  const HomePages({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          Container(
            width: double.infinity,
            height: context.mediaQuery.size.width * 0.5,
            margin: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                image: DecorationImage(
                    image: AssetImage("assets/sampul.jpg"), fit: BoxFit.cover)),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Kesiswaan",
                    style: font.copyWith(fontWeight: bold, fontSize: 18)),
                Text("Geser >>",
                    style: font.copyWith(fontSize: 12, color: biruColor)),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 124,
            margin: EdgeInsets.symmetric(
              vertical: 14,
            ),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 124,
                aspectRatio: 16 / 10,
                viewportFraction: 0.85,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 7),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
              items: [
                GestureDetector(
                  onTap: () {
                    Get.to(AbsensiPages());
                  },
                  child: KesiswaanWidget(
                    themeColor: Color(0xff22314B),
                    fontColor1: Colors.white,
                    fontColor2: Color(0xffC2C2C2),
                    pathImg: "assets/icon1.png",
                    title: 'Absensi',
                    subtitle: 'Siswa',
                    notif: true,
                  ),
                ),
                KesiswaanWidget(
                    themeColor: Color(0xff8F2110),
                    fontColor1: Colors.white,
                    fontColor2: Color(0xffC2C2C2),
                    pathImg: "assets/icon2.png",
                    title: 'Pelanggaran',
                    subtitle: 'Siswa',
                    notif: false),
                KesiswaanWidget(
                    themeColor: Color(0xffFFFFFF),
                    fontColor1: Colors.black,
                    fontColor2: Colors.black54,
                    pathImg: "assets/icon3.png",
                    title: 'Laporan',
                    subtitle: 'Kepribadian Siswa',
                    notif: false),
                GestureDetector(
                  onTap: () {
                    Get.to(NilaiPages());
                  },
                  child: KesiswaanWidget(
                      themeColor: Color(0xffFFFFFF),
                      fontColor1: Colors.black,
                      fontColor2: Colors.black54,
                      pathImg: "assets/icon3.png",
                      title: 'Nilai',
                      subtitle: 'Siswa',
                      notif: false),
                ),
              ].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return i;
                  },
                );
              }).toList(),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text("Pembayaran",
                style: font.copyWith(fontWeight: bold, fontSize: 18)),
          ),
          Container(
            width: double.infinity,
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Row(
                  children: [
                    SizedBox(width: 24, height: 120),
                    PembayaranWidget(
                      imgPath: "assets/icon4.png",
                      title: 'Daftar Pembayaran',
                      kurang: 0,
                      total: 10,
                    ),
                    SizedBox(width: 24, height: 120),
                    PembayaranWidget(
                      imgPath: "assets/icon5.png",
                      title: 'Daftar Tagihan',
                      kurang: 8,
                      total: 15,
                    ),
                    SizedBox(width: 24, height: 120),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
