
import 'package:flutter/material.dart';
import 'package:food_aap/auto/widget_contet/res_containt_eginht.dart';



class  DestalsConNine  extends StatefulWidget {
  const DestalsConNine ({super.key});

  @override
  State<DestalsConNine> createState() => _DestalsConSixState();
}

class _DestalsConSixState extends State<DestalsConNine> {
    int quantity=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
            //part one iamge +bt
          
          SliverAppBar(
            expandedHeight: 300,
            backgroundColor: Colors.white,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new, size: 18, color: Colors.black),
                  onPressed: () {
                    Navigator.of(context).pop(ResContaintEginht);
                  },
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: const Icon(Icons.more_horiz, color: Colors.black),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
                child: Image.network(
                  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?q=80&w=1000', // صورة افتراضية للطبق العلوي
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          
          //containt des restant
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  //dev-time-like
                  Row(
                    children: [
                      const Icon(Icons.star_border, color: Colors.orange, size: 20),
                      const SizedBox(width: 4),
                      const Text("4.7", style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(width: 20),
                      const Icon(Icons.delivery_dining_outlined, color: Colors.orange, size: 20),
                      const SizedBox(width: 4),
                      const Text("Free", style: TextStyle(color: Colors.grey)),
                      const SizedBox(width: 20),
                      const Icon(Icons.access_time, color: Colors.orange, size: 20),
                      const SizedBox(width: 4),
                      const Text("20 min", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Spicy Restaurant",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Maecenas sed diam eget risus varius blandit sit amet non magna. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.",
                    style: TextStyle(color: Colors.grey, height: 1.5),
                  ),
                  const SizedBox(height: 25),

                  // (Categories)
                  
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildCategoryItem("Burger", isSelected: true),
                        _buildCategoryItem("Sandwich"),
                        _buildCategoryItem("Pizza"),
                        _buildCategoryItem("Sanwi"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    "Burger (10)",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),

                  
                  //list burger grid
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    children: [
                      _buildFoodCard("Burger Ferguson", "Spicy Restaurant", "40"),
                      _buildFoodCard("Rockin' Burgers", "Cafecafachino", "40"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // bur-snd
  Widget _buildCategoryItem(String title, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
      decoration: BoxDecoration(
        color: isSelected ? Colors.orange : Colors.transparent,
        borderRadius: BorderRadius.circular(25),
        border: isSelected ? null : Border.all(color: Colors.grey.shade300),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.grey.shade600,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  // ويلجت مخصصة لبطاقة الطعام
  Widget _buildFoodCard(String name, String restaurant, String price) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Image.network(
                'https://pngimg.com/uploads/burger_sandwich/burger_sandwich_PNG4135.png', // صورة برجر افتراضية
                width: 120,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text(restaurant, style: const TextStyle(color: Colors.grey, fontSize: 13)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("\$$price", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
              child: InkWell(
                
                onTap: (){
                quantity==0;
                setState(() {
                    
                  quantity++;
                  print(quantity);
                });
                
                },
                child: Row(
                  children: [
                    Text("$quantity",style: TextStyle(color: Colors.black),),
                    const Icon(Icons.add, color: Colors.white, size: 20),
                  ],
                )),
            ),
          ],
        ),
      ],
    );
  }
}