import 'package:flutter/material.dart';
import 'package:food_aap/auto/widget_contet/containt_four.dart';
import 'package:food_aap/auto/widget_contet/containt_three.dart';
import 'package:food_aap/auto/widget_contet/contaont_dest_sall.dart';



class ContaintRecetSearch extends StatefulWidget {
  const ContaintRecetSearch({super.key});

  @override
  State<ContaintRecetSearch> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<ContaintRecetSearch> {
  // قائمة البيانات التجريبية
  final List<Map<String, dynamic>> allItems = [
    {'name': 'European Pizza', 'shop': 'Uttora Coffe House', 'type': 'Pizza', 'rating': 4.7},
    {'name': 'Buffalo Pizza', 'shop': 'Cafenio Coffee Club', 'type': 'Pizza', 'rating': 4.0},
    {'name': 'Spicy Burger', 'shop': 'American Burger Shop', 'type': 'Burger', 'rating': 4.3},
    {'name': 'Club Sandwich', 'shop': 'Pansi Restaurant', 'type': 'Sandwich', 'rating': 4.5},
        {'name': 'polpulor Burgers', 'shop': 'Pansi Restaurant', 'type': 'Sandwich', 'rating': 4.5},

  ];

  // القائمة التي ستظهر للمستخدم (تتغير مع البحث)
  List<Map<String, dynamic>> displayedItems = [];
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    displayedItems = allItems; // في البداية نعرض كل شيء
  }

  void updateSearch(String query) {
    setState(() {
      searchQuery = query;
      displayedItems = allItems
          .where((item) =>
              item['name'].toLowerCase().contains(query.toLowerCase()) ||
              item['type'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: (){
            Navigator.of(context).pop(ContaontDestSall());
          },
          child: const Icon(Icons.arrow_back_ios, color: Colors.black)),
        title: const Text("Search", style: TextStyle(color: Colors.black)),
        actions: [
          Stack(
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black)),
              Positioned(
                right: 8, top: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
                  child: const Text("2", style: TextStyle(fontSize: 10, color: Colors.white)),
                ),
              )
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // حقل البحث
            TextField(
              onChanged: (value) => updateSearch(value),
              decoration: InputDecoration(
                hintText: "Pizza",
                prefixIcon: const Icon(Icons.search),
                suffixIcon: const Icon(Icons.close, size: 20),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 20),

            const Text("Recent Keywords", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            
            // الكلمات الدليلية (Chips)
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: ["Burger", "Sandwich", "Pizza"].map((label) => Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ActionChip(
                    label: Text(label),
                    onPressed: () => updateSearch(label),
                    shape: StadiumBorder(side: BorderSide(color: Colors.grey[300]!)),
                    backgroundColor: Colors.white,
                  ),
                )).toList(),
              ),
            ),
            const SizedBox(height: 20),

            const Text("Suggested Results", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),

            // قائمة النتائج
            Expanded(
              child: displayedItems.isEmpty 
                ? const Center(child: Text("No results found"))
                : ListView.builder(
                    itemCount: displayedItems.length,
                    itemBuilder: (context, index) {
                      final item = displayedItems[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 15),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(color: Colors.orange[100], width: 50, height: 50, child: const Icon(Icons.fastfood)),
                          ),
                          title: Text(item['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Row(
                            children: [
                              const Icon(Icons.star, color: Colors.orange, size: 16),
                              Text(" ${item['rating']}"),
                            ],
                          ),
                          trailing: InkWell(onTap:(){
                            Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (BuildContext context) =>  ContaintThree(),
    ),);
                          },
                            child: const Icon(Icons.arrow_forward_ios, size: 16)),
                        ),
                      );
                    },
                  ),
            ),
            SizedBox(height: 15,),
            Text("Popular Fast food",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
              Row(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Image.asset("images/pazza.png",height: 100,),
                        Text("European Pizza",style: TextStyle(color: Colors.black),),
                        Text("Uttara Coffe House",style: TextStyle(color: Colors.grey),)
                      ],
                    ),
                  ),
                   InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute<void>(
                      builder: (BuildContext context) =>  ContaintFour(),
                       ),);
                    },
                     child: Container(
                      child: Column(
                        children: [
                          Image.asset("images/pazz_margtra.jpg",height: 100,),
                          Text("Buffala Pizza",style: TextStyle(color: Colors.black),),
                          Text("Cafenio Coffee Club",style: TextStyle(color: Colors.grey),)
                        ],
                      ),
                                       ),
                   ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}