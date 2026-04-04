import 'package:flutter/material.dart';
import 'package:food_aap/auto/widget_contet/containt_two.dart';
import 'package:food_aap/auto/widget_contet/contaont_dest_sall.dart';



class ContaintOne extends StatefulWidget {
  const ContaintOne({super.key});
 

  @override
  State<ContaintOne> createState() => _ContaintOneState();
}

class _ContaintOneState extends State<ContaintOne> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            // --- Header: Address & Cart ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(backgroundColor: Colors.grey[200], child: const Icon(Icons.menu, color: Colors.black)),
                Column(
                  children: [
                    const Text("DELIVER TO", style: TextStyle(color: Colors.orange, fontSize: 12, fontWeight: FontWeight.bold)),
                    Row(
                      children: const [
                        Text("Halal Lab office", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
                      child: const Icon(Icons.shopping_bag_outlined, color: Colors.white),
                    ),
                    Positioned(
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
                        child: const Text("2", style: TextStyle(color: Colors.white, fontSize: 10)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            
            const SizedBox(height: 20),
            const Text("Hey Halal, Good Afternoon!", style: TextStyle(fontSize: 18)),

            // --- Search Bar ---
            const SizedBox(height: 15),
            /*
            TextField(
              decoration: InputDecoration(
                hintText: "Search dishes, restaurants",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
                
              ),
              
            ),
            */
            Container(
              child:SearchAnchor(
            builder: (BuildContext context, 
            SearchController controller) {
              return SearchBar(
                controller: controller,
                padding: const WidgetStatePropertyAll<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 16.0),
                ),
                onTap: () {
                  controller.openView();
                },
                onChanged: (_) {
                  controller.openView();
                },
                leading: const Icon(Icons.search),
                trailing: <Widget>[
                  Tooltip(
                    message: 'Change brightness mode',
                    child: IconButton(
                      isSelected: isDark,
                      onPressed: () {
                        setState(() {
                          isDark = !isDark;
                        });
                      },
                      icon: const Icon(Icons.arrow_back),
                      selectedIcon: const Icon(Icons.brightness_2_outlined),
                    ),
                  ),
                ],
              );
            },
            suggestionsBuilder:
                (BuildContext context, SearchController controller) {
                  List<String> items = ["BURGER", "PIZZA", "HOT DOG"];

  // فلترة حسب النص المكتوب
  List<String> filteredItems = items.where((item) {
    return item.toLowerCase().contains(controller.text.toLowerCase());
  }).toList();

  return filteredItems.map((item) {
    return ListTile(
      title: Text(item),
      onTap: () {
        controller.closeView(item); // يحط الكلمة في البحث
      },
    );
  }).toList();


                },
          ),
            ),

            // --- Categories ---
            const SizedBox(height: 25),
            _buildSectionHeader("All Categories"),
            const SizedBox(height: 15),
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildCategoryItem("All", Icons.local_fire_department, isSelected: true),
                  _buildCategoryItem("Hot Dog", Icons.fastfood),
                  _buildCategoryItem("Burger", Icons.lunch_dining),
                ],
              ),
            ),

            // --- Open Restaurants ---
            const SizedBox(height: 25),
            _buildSectionHeader("Open Restaurants"),
            const SizedBox(height: 15),
            _buildRestaurantCard(),
          ],
        ),
      ),
    );
  }

  // Header Helper
  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        InkWell(
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute<void>(
      builder: (BuildContext context) => ContaontDestSall(),
    ),
            );
          },
          child: const Text("See All >", style: TextStyle(color: Colors.grey))),
      ],
    );
  }

  // Category Item Helper
  Widget _buildCategoryItem(String name, IconData icon, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: isSelected ? Colors.orange[100] : Colors.grey[100],
        borderRadius: BorderRadius.circular(25),
        border: isSelected ? Border.all(color: Colors.orange) : null,
      ),
      child: Row(
        children: [
          Icon(icon, color: isSelected ? Colors.orange : Colors.grey),
          const SizedBox(width: 8),
          Text(name, style: TextStyle(fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }

  // Restaurant Card Helper
  Widget _buildRestaurantCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(image: AssetImage( "images/food_one.jpeg"),)
          ),
        ),
        const SizedBox(height: 10),
        const Text("Rose Garden Restaurant", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const Text("Burger - Chicken - Rice - Wings", style: TextStyle(color: Colors.grey)),
        const SizedBox(height: 8),
        Row(
          children: const [
            Icon(Icons.star_border, color: Colors.orange, size: 20),
            Text(" 4.7"),
            SizedBox(width: 15),
            Icon(Icons.delivery_dining, color: Colors.orange, size: 20),
            Text(" Free"),
            SizedBox(width: 15),
            Icon(Icons.access_time, color: Colors.orange, size: 20),
            Text(" 20 min"),
          ],
        ),
      ],
    );
  }
}