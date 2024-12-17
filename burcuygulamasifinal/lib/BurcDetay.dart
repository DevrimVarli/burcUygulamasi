import 'package:burclar_uygulamasi/burclar.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';


class BurcDetay extends StatefulWidget {
  Burclar burc;

  BurcDetay(this.burc);

  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Color appbarRengi = Colors.transparent;
  late PaletteGenerator _generator;
  void initState() {
    super.initState();
    appbarRenginiBul();
    print('init state çalıstı');
    // _generator = PaletteGenerator.fromImageProvider(AssetImage(assetName));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            backgroundColor: appbarRengi,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("${widget.burc.burc_ad} Burcu ve Özellikleri"),
              centerTitle: true,
              background: Image.asset("resimler/${widget.burc.burc_buyukresim}",fit: BoxFit.cover,),
              
            ),
          ),
          SliverToBoxAdapter(
            child: Container(

              

              margin: EdgeInsets.all(16),
              padding:  EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Text(

                  "${widget.burc.burc_ozellik},",style: TextStyle(fontWeight: FontWeight.bold,color:appbarRengi),
                ),
              ),
            ),


          ),
          
        ],
      ),




    );
  }
  void appbarRenginiBul() async {
    _generator = await PaletteGenerator.fromImageProvider(
        AssetImage('resimler/${widget.burc.burc_buyukresim}'));
    appbarRengi = _generator.vibrantColor!.color;
    setState(() {});
    print(appbarRengi);
  }
}

