import 'package:burclar_uygulamasi/VeritabaniYardimcisi.dart';
import 'package:burclar_uygulamasi/burclar.dart';

class Burclardao{

Future<List<Burclar>> tumBurclariGetir() async{
  var db=await VeritabaniYardimcisi.veritabaniErisim();
  List<Map<String,dynamic>> maps=await db.rawQuery("SELECT * FROM burclar");
  return List.generate(maps.length, (i){
    var satir=maps[i];
    return Burclar(burc_id: satir["burc_id"], burc_ad: satir["burc_ad"], burc_resim: satir["burc_resim"], burc_tarih: satir["burc_tarih"], burc_ozellik: satir["burc_ozellik"], burc_buyukresim: satir["burc_buyukresim"]);
  });
}

}