import 'package:flutter/material.dart';
import 'package:food_aap/auto/widget_contet/containt_recet_search.dart';
import 'package:food_aap/auto/widget_contet/containt_six.dart';



class ContaontDestSall extends StatefulWidget {
  @override
  State<ContaontDestSall> createState() => _ContaontDestSallState();
}

class _ContaontDestSallState extends State<ContaontDestSall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Icon(Icons.menu, color: Colors.black),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("DELIVER TO", style: TextStyle(color: Colors.orange, fontSize: 12)),
            Row(
              children: [
                Text("Halal Lab office", style: TextStyle(color: Colors.black, fontSize: 14)),
                Icon(Icons.arrow_drop_down, color: Colors.black),
              ],
            ),
          ], 
        ),
        actions: [
          Stack(
            children: [
              IconButton(icon: Icon(Icons.shopping_bag_outlined, color: Colors.black), onPressed: () {}),
              Positioned(
                right: 8, top: 8,
                child: CircleAvatar(radius: 8, backgroundColor: Colors.orange, child: Text("2", style: TextStyle(fontSize: 10, color: Colors.white))),
              )
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hey Halal, Good Afternoon!", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 15),
            
            // Search Bar
            InkWell(
              onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
      builder: (BuildContext context) => const ContaintRecetSearch(),
    ),
                  );
                },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(15)),
                child: TextField(
                  decoration: InputDecoration(icon: Icon(Icons.search), hintText: "Search dishes, restaurants", border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(height: 25),

            // All Categories Header
            _buildSectionHeader("All Categories"),
            SizedBox(height: 15),

            // Categories List
            SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildFoodCategory("Pizza", "\$70", "images/pazza.png"), 
                  _buildFoodCategory("Burger", "\$50", "images/buger.jpeg"),
                ],
              ),
            ),
            SizedBox(height: 25),

            // Open Restaurants Header
            _buildSectionHeader("Open Restaurants",),
            SizedBox(height: 15),

            // Restaurant Card
            _buildRestaurantCard(),
          ],
        ),
      ),
    );
  }

  // Header Widget
  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
      builder: (BuildContext context) => ContaintSix(),
    ),
  );
            
          },
          child: Row(children: [Text("See All", style: TextStyle(color: Colors.grey)), Icon(Icons.arrow_forward_ios, size: 12, color: Colors.grey)])),
        
      ],
    );
  }

  // Food Category Item
  Widget _buildFoodCategory(String name, String price, String image) {
    return Container(
      width: 140,
      margin: EdgeInsets.only(right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(image), fit: BoxFit.contain),
              ),
            ),
          ),
          Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Starting", style: TextStyle(color: Colors.grey, fontSize: 12)),
              Text(price, style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          )
        ],
      ),
    );
  }

  // Restaurant Card Item
  Widget _buildRestaurantCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(image: AssetImage("images/food_one.jpeg"), fit: BoxFit.cover),
          ),
        ),
        SizedBox(height: 10),
        Text("Rose Garden Restaurant", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text("Burger - Chicken - Rice - Wings", style: TextStyle(color: Colors.grey)),
        SizedBox(height: 8),
        Row(
          children: [
            Icon(Icons.star_border, color: Colors.orange, size: 20),
            Text(" 4.7"),
            SizedBox(width: 20),
            Icon(Icons.delivery_dining_outlined, color: Colors.orange, size: 20),
            Text(" Free"),
            SizedBox(width: 20),
            Icon(Icons.access_time, color: Colors.orange, size: 20),
            Text(" 20 min"),
          ],
        )
      ],
    );
  }
}