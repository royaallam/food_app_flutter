import 'package:flutter/material.dart';




class  ContaintThree    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9), // لون خلفية هادئ
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- شريط الأدوات العلوي ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildRoundButton(Icons.arrow_back_ios_new, Colors.black12,),
                  Row(
                    children: const [
                      Text("BURGER", style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                      Icon(Icons.arrow_drop_down, color: Colors.orange),
                    ],
                  ),
                  Row(
                    children: [
                      _buildRoundButton(Icons.search, Colors.black87, isPrimary: true),
                      const SizedBox(width: 10),
                      _buildRoundButton(Icons.tune, Colors.black12),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 30),
              const Text("Popular Burgers", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
              const SizedBox(height: 20),

              // --- قائمة البرجر (GridView) ---
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 0.75,
                children: [
                  _buildBurgerCard("Burger Bistro", "Rose Garden", 40, "assets/burger1.png"),
                  _buildBurgerCard("Smokin' Burger", "Cafenio Restaurant", 60, "assets/burger2.png"),
                  _buildBurgerCard("Buffalo Burgers", "Kaji Firm Kitchen", 75, "assets/burger3.png"),
                  _buildBurgerCard("Bullseye Burgers", "Kabak Restaurant", 94, "assets/burger4.png"),
                ],
              ),

              const SizedBox(height: 30),
              const Text("Open Restaurants", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
              const SizedBox(height: 15),

              // --- قسم المطاعم المفتوحة ---
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        'https://images.unsplash.com/photo-1504674900247-0877df9cc836', // صورة تجريبية
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text("Tasty Treat Gallery", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
                      child: Row(
                        children: const [
                          Icon(Icons.star_border, size: 18, color: Colors.orange),
                          Text(" 4.7  "),
                          Icon(Icons.delivery_dining, size: 18, color: Colors.orange),
                          Text(" Free  "),
                          Icon(Icons.access_time, size: 18, color: Colors.orange),
                          Text(" 20 min"),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ويجيت لإنشاء كرت البرجر
  Widget _buildBurgerCard(String name, String restaurant, int price, String imagePath) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: Icon(Icons.fastfood, size: 60, color: Colors.orange.shade300), // استبدلها بـ Image.asset
            ),
          ),
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          Text(restaurant, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$$price", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
                child: const Icon(Icons.add, color: Colors.white, size: 20),
              )
            ],
          )
        ],
      ),
    );
  }

  // ويجيت للأزرار الدائرية في الأعلى
  Widget _buildRoundButton(IconData icon, Color bgColor, {bool isPrimary = false}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isPrimary ? const Color(0xFF1A1D26) : Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Icon(icon, size: 20, color: isPrimary ? Colors.white : Colors.black87),
    );
  }
}