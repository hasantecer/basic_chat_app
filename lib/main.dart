import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(ChatApp());

String isim = "Kullanıcı1";

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Chat Uygulaması Arayüzü",
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat Uygulaması"),
      ),
      body: AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  const AnaEkran({Key? key}) : super(key: key);

  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  final _t1 = TextEditingController();

  List<MesajBalonu> mesajListesi = [];
  listeyeEkle(String gelenMesaj) {
    setState(() {
      MesajBalonu mesajNesnesi = MesajBalonu(mesaj: gelenMesaj);
      mesajListesi.insert(0, mesajNesnesi);
      _t1.clear();
    });
  }

  Widget metinGirisAlani() {
    return Container(
      margin: EdgeInsets.all(15),
      child: Row(
        children: [
          const Flexible(child: TextField(),),
          IconButton(
              onPressed: () => listeyeEkle(_t1.text), icon: Icon(Icons.send)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Flexible(
            child: ListView.builder(
                reverse: true,
                itemCount: mesajListesi.length,
                itemBuilder: (_, indeksNumarasi) =>
                    mesajListesi[indeksNumarasi]),
          ),
          Divider(
            thickness: 1,
          ),
          metinGirisAlani(),
        ],
      ),
    );
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<TextEditingController>('_t1', _t1));
  }
}

class MesajBalonu extends StatelessWidget {
  String mesaj;
  MesajBalonu({required this.mesaj});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Row(
        children: [
          CircleAvatar(
            child: Text(isim[0]),
          ),
          Column(children: [
            Text(isim),
            Text(mesaj),
          ])
        ],
      ),
    );
  }
}
