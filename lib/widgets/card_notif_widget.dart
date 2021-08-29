part of 'widgets.dart';

class CardNotifWidget extends StatelessWidget {
  final bool baru;
  const CardNotifWidget({Key key, this.baru}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: baru ? 90 : 65,
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        boxShadow: [shadow],
        color: baru ? Color(0xffDEEBFE) : Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: context.mediaQuery.size.width * 0.8 - 76,
            height: 51,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                baru
                    ? Container(
                        width: 45,
                        height: 15,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Color(0xffF8EBE6),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: Color(0xffB67E75)),
                            ),
                            Text('Baru',
                                style: font.copyWith(
                                    fontSize: 8,
                                    color: Color(0xffB67E75),
                                    fontWeight: bold)),
                          ],
                        ),
                      )
                    : SizedBox(),
                Text('Absensi',
                    style: font.copyWith(
                        fontSize: 14, color: Colors.black, fontWeight: bold)),
                Text('23:59 : 27 Juli 2021',
                    style:
                        font.copyWith(fontSize: 10, color: Color(0xff79787E)))
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Container(
              width: 14,
              height: 14,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7), color: Colors.blue),
            ),
          )
        ],
      ),
    );
  }
}
