part of 'widgets.dart';

class KesiswaanWidget extends StatelessWidget {
  final Color themeColor, fontColor1, fontColor2;
  final String pathImg, title, subtitle;
  final bool notif;
  const KesiswaanWidget(
      {Key key,
      this.themeColor,
      this.notif,
      this.fontColor1,
      this.fontColor2,
      this.pathImg,
      this.subtitle,
      this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      // height: 116,
      // width: 244,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: themeColor,
        borderRadius: BorderRadius.circular(9),
        boxShadow: [shadow],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 150,
            child: notif
                ? CarouselSlider(
                    options: CarouselOptions(
                      height: 124,
                      aspectRatio: 16 / 10,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: false,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.vertical,
                    ),
                    items: [
                      SafeArea(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title,
                              style: font.copyWith(
                                  fontSize: 18,
                                  color: fontColor1,
                                  fontWeight: bold)),
                          Text(subtitle,
                              style: font.copyWith(
                                  fontSize: 12,
                                  color: fontColor2,
                                  fontWeight: regular)),
                        ],
                      )),
                      SafeArea(
                        child: Text('Kusowo Hadi S Terlambat',
                            style: font.copyWith(
                                fontSize: 16,
                                color: fontColor1,
                                fontWeight: bold)),
                      ),
                    ].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return i;
                        },
                      );
                    }).toList(),
                  )
                : SafeArea(
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: font.copyWith(
                              fontSize: 18,
                              color: fontColor1,
                              fontWeight: bold)),
                      Text(subtitle,
                          style: font.copyWith(
                              fontSize: 12,
                              color: fontColor2,
                              fontWeight: regular)),
                    ],
                  )),
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(pathImg), fit: BoxFit.contain)),
          )
        ],
      ),
    ));
  }
}
