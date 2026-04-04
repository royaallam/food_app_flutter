import 'package:flutter/material.dart';
import 'package:food_aap/auto/widget_contet/hurry_offers_seven.dart';
import 'package:food_aap/auto/widget_contet/res_containt_eginht.dart';



class ContaintSix extends StatefulWidget {
  const ContaintSix({super.key});

  @override
  State<ContaintSix> createState() => _ContaintSixState();
}


class _ContaintSixState extends State<ContaintSix> {
  @override
void initState() {
  super.initState();

  WidgetsBinding.instance.addPostFrameCallback((_) {
    showDialog(
      context: context,
      barrierDismissible: false, // ما يتقفل إلا بزر
      builder: (context) => const DiscountDialog(),
    );
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              // --- Header Section ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[100],
                    child: const Icon(Icons.menu, color: Colors.black),
                  ),
                  Column(
                    children: [
                      const Text("DELIVER TO", style: TextStyle(color: Colors.orange, fontSize: 12, fontWeight: FontWeight.bold)),
                      Row(
                        children: const [
                          Text("Halal Lab office", style: TextStyle(fontWeight: FontWeight.w500)),
                          Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(color: Color(0xFF181C2E), shape: BoxShape.circle),
                        child: const Icon(Icons.shopping_bag_outlined, color: Colors.white),
                      ),
                      Positioned(
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
                          child: const Text("2", style: TextStyle(color: Colors.white, fontSize: 10)),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 25),
              // --- Greeting ---
              const Text.rich(
                TextSpan(
                  text: "Hey Halal, ",
                  style: TextStyle(fontSize: 18),
                  children: [
                    TextSpan(text: "Good Afternoon!", style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // --- Search Bar ---
              TextField(
                decoration: InputDecoration(
                  hintText: "Search dishes, restaurants",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              // --- Categories Section ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("All Categories", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                  TextButton(onPressed: () {}, child: const Text("See All >", style: TextStyle(color: Colors.grey))),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildCategoryItem("Pizza", "images/pazza.png"), // استبدل بمسار الصورة لديك
                    _buildCategoryItem("Burger", "images/buger.jpeg"),
                   // _buildCategoryItem("Pizza", "assets/sandwich.png"),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              // --- Open Restaurants Section ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Open Restaurants", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                  TextButton(onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
      builder: (BuildContext context) => ResContaintEginht(),
    ),
                    );
                  }, child: const Text("See All >", style: TextStyle(color: Colors.grey))),
                ],
              ),
              const SizedBox(height: 10),
              // --- Restaurant Card ---
              _buildRestaurantCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryItem(String title, String imagePath) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: Colors.transparent,
          child: Image.asset(imagePath), // تجريبي: استبدله بـ Image.asset
          ),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildRestaurantCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 160,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
              image: AssetImage("images/food_one.jpeg"), // تجريبي
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Text("Rose Garden Restaurant", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const Text("Burger - Chicken - Riche - Wings", style: TextStyle(color: Colors.grey)),
        const SizedBox(height: 10),
        Row(
          children: [
            const Icon(Icons.star_border, color: Colors.orange, size: 20),
            const SizedBox(width: 4),
            const Text("4.7", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(width: 20),
            const Icon(Icons.delivery_dining_outlined, color: Colors.orange, size: 20),
            const SizedBox(width: 4),
            const Text("Free"),
            const SizedBox(width: 20),
            const Icon(Icons.access_time, color: Colors.orange, size: 20),
            const SizedBox(width: 4),
            const Text("20 min"),
          ],
        ),
      ],
    );
  }
}