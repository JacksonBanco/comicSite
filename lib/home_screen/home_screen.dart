import 'package:flutter/material.dart';
import 'package:webtoon/models/webtoon_,model.dart';
import 'package:webtoon/services/api_service.dart';

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
             return Column(
               children: [
                 Container(
                    width: 250,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 7,
                          offset: Offset(10,10),
                          color: Colors.black.withOpacity(0.5),
                        )
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.network(webtoon.thumb)
                 ),
                 const SizedBox(
                   height: 10,
                 ),
                 Text(
                   webtoon.title,
                   style: const TextStyle(
                     fontSize: 25,
                     fontWeight: FontWeight.w600,
                   ),
                 ),
               ],
             );
             },
           separatorBuilder: (context, index)=>const SizedBox(width: 40,),
         );
  }
}
