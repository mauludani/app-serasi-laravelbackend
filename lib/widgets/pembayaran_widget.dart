part of 'widgets.dart';

class PembayaranWidget extends StatelessWidget {
  final String imgPath, title;
  final int kurang, total;
  const PembayaranWidget(
      {Key key, this.imgPath, this.title, this.kurang, this.total})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double persen = 1 - (kurang / total);
    return Center(
        child: Container(
      height: 116,
      width: 186,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        borderRadius: BorderRadius.circular(9),
        boxShadow: [shadow],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(imgPath), fit: BoxFit.contain)),
              ),
              CircularPercentIndicator(
                radius: 40.0,
                lineWidth: 4.0,
                percent: persen,
                center: (kurang == 0)
                    ? Icon(
                        Icons.check,
                        size: 20,
                        color: Colors.blue,
                      )
                    : Text(kurang.toString(),
                        style: font.copyWith(
                            fontSize: 14, color: Colors.red, fontWeight: bold)),
                backgroundColor: Colors.black12,
                progressColor: (kurang == 0) ? Colors.blue : Colors.red,
              ),
            ],
          ),
          Text(title,
              style: font.copyWith(
                  fontSize: 14, color: Colors.black, fontWeight: bold)),
        ],
      ),
    ));
  }
}
