import 'package:flutter/material.dart';
import 'package:webtoon/models/webtoon_,model.dart';
import 'package:webtoon/services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<WebtoonModel> webtoons = [];
  bool isLoading = true;

  void waitForWebToons() async{//非同期 処理 理由:受信するデータ(api)が配列
    webtoons = await ApiService.getTodaysToons();
    isLoading = false;
    setState(() {//画面の更新

    });
  }

  @override
  void initState(){
    super.initState();
    waitForWebToons();//データをもらう関数を呼び出し そのデータをwebtoonsの配列に入れる
  }

  Widget build(BuildContext context) {
    print(webtoons);
    print(isLoading);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
        title: const Text(
            "発売情報",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
        ),
      ),
    );
  }
}
