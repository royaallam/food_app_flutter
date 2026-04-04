import 'package:flutter/material.dart';
import 'package:food_aap/auto/widget_contet/containt_four.dart';
import 'package:food_aap/auto/widget_contet/containt_one.dart';
import 'package:food_aap/auto/widget_contet/containt_three.dart';



class ContaintTwo extends StatelessWidget {
  const ContaintTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () {
            Navigator.of(context).pop(ContaintOne());
          },
        ),
        title: const Text(
          "Search",
          style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade900,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.shopping_bag_outlined, color: Colors.white),
                ),
                CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.orange.shade800,
                  child: const Text("2", style: TextStyle(fontSize: 10, color: Colors.white)),
                )
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // pizza
            TextField(
              decoration: InputDecoration(
                hintText: "Pizza",
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                suffixIcon: const Icon(Icons.cancel, color: Colors.grey, size: 20),
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 25),

            // Recent Keywords
            const Text("Recent Keywords", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            const SizedBox(height: 15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildKeywordChip("Burger"),
                  _buildKeywordChip("Sandwich"),
                  _buildKeywordChip("Pizza"),
                  _buildKeywordChip("Salad"),
                ],
              ),
            ),
            const SizedBox(height: 25),

            // Suggested Restaurants
            const Text("Suggested Restaurants", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            const SizedBox(height: 15),
            _buildRestaurantItem("Pansi Restaurant", "4.7", Icons.restaurant),
            _buildRestaurantItem("American Spicy Burger Shop", "4.3", Icons.fastfood),
            _buildRestaurantItem("Cafenio Coffee Club", "4.0", Icons.coffee),
            const SizedBox(height: 25),

            // Popular Fast Food
            const Text("Popular Fast Food", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            const SizedBox(height: 15),
            Row(
              children: [
                _buildFoodCard("European Pizza", "Uttora Coffee House", "https://img.freepik.com/free-photo/thin-crust-pizza-with-tomato-sauce-mozzarella-cheese-slices-pepperoni-black-olives_140725-1158.jpg"),
                const SizedBox(width: 15),
                _buildFoodCard("Buffalo Pizza", "Cafenio Coffee Club", "https://img.freepik.com/free-photo/pepperoni-pizza-with-white-background_144627-24867.jpg"),
              ],
            ),
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(
                 MaterialPageRoute<void>(
      builder: (BuildContext context) => ContaintThree(),
    ),
  );
            }, child: Text("b")),
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(
                 MaterialPageRoute<void>(
      builder: (BuildContext context) => ContaintFour(),
    ),
  );
            }, child: Text("p")),
          ],
        ),
      ),
    );
  }

  // 
  Widget _buildKeywordChip(String label) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey.shade700),
      ),
      
      child: Text(label, style: const TextStyle(color: Colors.black)),
      
    );
  }

  // widget list res
  Widget _buildRestaurantItem(String name, String rating, IconData icon) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: Colors.orange),
      ),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Row(
        children: [
          const Icon(Icons.star_border, size: 16, color: Colors.orange),
          const SizedBox(width: 4),
          Text(rating),
        ],
      ),
    );
  }


  Widget _buildFoodCard(String title, String shop, String imageUrl) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(imageUrl, height: 100, width: double.infinity, fit: BoxFit.cover),
            ),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(shop, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
        
      ),
      
    );
  }
}