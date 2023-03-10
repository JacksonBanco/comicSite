import 'package:flutter/material.dart';
import 'package:webtoon/models/webtoon_,model.dart';
import 'package:webtoon/services/api_service.dart';
import 'package:webtoon/widgets/webtoons.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  Widget build(BuildContext context) {

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

      //多いデータを　連続適の見せるときListView
      //色んなデータを並べるとき使うWidget
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot){
          if(snapshot.hasData){
           return Column(
             children: [
               const SizedBox(
                 height: 50,
               ),
               Expanded(child: buildListView(snapshot))
             ],
           );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView buildListView(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
             scrollDirection: Axis.horizontal,
             itemCount: snapshot.data!.length,
             padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
             itemBuilder: (context, index) {
             var webtoon = snapshot.data![index];
             return Webtoon(
                 thumb: webtoon.thumb,
                 id: webtoon.id,
                 title: webtoon.title
              );
             },
           separatorBuilder: (context, index)=>const SizedBox(width: 40,),
         );
  }
}
