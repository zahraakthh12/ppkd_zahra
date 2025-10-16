import 'package:flutter/material.dart';

class Tugas5 extends StatefulWidget {
  const Tugas5({super.key});

  @override
  State<Tugas5> createState() => _Tugas5State();
}

class _Tugas5State extends State<Tugas5> {
  bool showText = true;
  bool showIcon = true;
  bool showText2 = true;
  bool showBox = true;
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tugas 5 Flutter", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
      backgroundColor: Color.fromARGB(255, 185, 151, 158)),
      backgroundColor: Color.fromARGB(255, 245, 230, 236),
      body: Column(
        children: [
          Padding(padding: const EdgeInsets.only(top: 20, bottom: 10, right: 30, left: 30),
          child:

          // Soal 1: ElevatedButton
          Container(
            padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
              decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255), borderRadius: BorderRadius.circular(5), 
              boxShadow: [BoxShadow(color: Color.fromARGB(255, 207, 186, 191), 
                                    offset: Offset(2, 2), 
                                    spreadRadius: 3,
                                    blurRadius: 10)]),
            child: SizedBox(width: double.infinity,
            child: 
            Column(
              children: [
                if(showText)
                Text("Hallo! My name is Zahra Khotimah. Nice to meet you!!", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 138, 108, 114)), textAlign: TextAlign.center,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 245, 230, 236)),
                  onPressed: (){
                    print("Show Text: $showText");
                    showText = !showText;
                    setState((){});
                  }, child: Text(showText? "Hide Name!" : "Show Name"),),
              ],
            ),),
          ),
          ),

          // Soal 2: IconButton
          Column(
            children: [
              IconButton(onPressed: (){
                print("Show Icon: $showIcon");
                showIcon = !showIcon;
                setState(() {});
              }, icon: Icon(showIcon ? Icons.favorite : Icons.favorite,
              color: showIcon ? Colors.red : Colors.grey)),

              if(showIcon)
              Text("Liked", style: TextStyle(fontSize: 12)),
            ],
          ),

          // Soal 3: TextButtton
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, right: 30, left: 30),
            child: Container(
              padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
              decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255), borderRadius: BorderRadius.circular(5), 
              boxShadow: [BoxShadow(color: Color.fromARGB(255, 207, 186, 191), 
                                    offset: Offset(2, 2), 
                                    spreadRadius: 3,
                                    blurRadius: 10)]),
              child: Column(
                children: [
                  if (showText2)
                  Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  textAlign: TextAlign.justify,),
                  TextButton(
                    onPressed: (){
                    print("Show Text: $showText2");
                    showText2 = !showText2;
                    setState(() {});
                  }, child: Text(showText2 ? "Hide!" : "See More!")),
                ],
              ),
            ),
          ),

          // Soal 5: InkWell
          InkWell(splashColor: const Color.fromARGB(255, 229, 183, 199),
          onTap: (){
                    print("Touched Box");
                    setState(() {
                      showBox = !showBox;
                    });},
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255), borderRadius: BorderRadius.circular(5), 
              boxShadow: [BoxShadow(color: Color.fromARGB(255, 207, 186, 191), 
                                    offset: Offset(2, 2), 
                                    spreadRadius: 3,
                                    blurRadius: 10)]),
              child: Center(
              child: Text(showBox? "  " : "Aloha!", style: TextStyle(fontWeight: FontWeight.bold),)),),
          ),),

          // Soal 6: GestureDetector
          // GestureDetector(
          //   onTap: (){
          //     print("Ditekan sekali");
          //     setState(() {
          //       counter+=1;
          //     });
          //   },

          //   onDoubleTap: (){
          //     print("Ditekan dua kali");
          //     setState(() {
          //       counter +=2;
          //     });
          //   },

          //   onLongPress: (){
          //     print("Tahan lama");
          //     setState(() {
          //       counter += 3;
          //     });
          //   },
          // )

        ],),

        // Soal 4: FloatingActionButton
        floatingActionButton: FloatingActionButton(onPressed: (){
          print("Kurang $counter");
          counter--;
          setState(() {});
        },backgroundColor: const Color.fromARGB(255, 221, 210, 194),
        child: Icon(Icons.add)),
    );
  }
}