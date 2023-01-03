import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:webtoon/home_screen/detail_screen.dart';



class Webtoon extends StatelessWidget {
  final String title, id, thumb;
  const Webtoon({
    super.key,
    required this.thumb,
    required this.id,
    required this.title,
});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context, 
          MaterialPageRoute( //全てのあにアニメーション生成
            builder:(context)=>
              DetailScreen(thumb: thumb, id: id, title: title),
            fullscreenDialog: true,
          )
        );
      },
      child: Column(
        children: [
          Hero(
            tag: id,
            child: Container(
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
                child: Image.network(thumb)
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
