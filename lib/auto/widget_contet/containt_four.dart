import 'package:flutter/material.dart';
import 'package:food_aap/cart/cart.dart';



class ContaintFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // الجزء العلوي: الصورة والخلفية الملونة
            Stack(
              children: [
                Container(
                  height: 300,
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFCD38B), // لون الخلفية البرتقالي الفاتح
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Image.network(
                      'https://pngimg.com/uploads/pizza/pizza_PNG44048.png', // رابط صورة بيتزا تجريبية
                      height: 220,
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 30,
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.5),
                    child: const Icon(Icons.arrow_back_ios_new, size: 18, color: Colors.black),
                  ),
                ),
                const Positioned(
                  top: 40,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
                      "Details",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // اسم المطعم
                  const Row(
                    children: [
                      Icon(Icons.restaurant, color: Colors.red, size: 16),
                      SizedBox(width: 8),
                      Text("Uttora Coffee House", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // اسم المنتج
                  const Text(
                    "Pizza Calzone European",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),

                  // الوصف
                  const Text(
                    "Prosciutto e funghi is a pizza variety that is topped with tomato sauce, mozzarella, and ham.",
                    style: TextStyle(color: Colors.grey, height: 1.5),
                  ),
                  const SizedBox(height: 20),

                  // التقييم، التوصيل، والوقت
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildInfoIcon(Icons.star_border, "4.7", Colors.orange),
                      _buildInfoIcon(Icons.delivery_dining_outlined, "Free", Colors.orange),
                      _buildInfoIcon(Icons.access_time, "20 min", Colors.orange),
                    ],
                  ),
                  const SizedBox(height: 30),

                  // اختيار الحجم
                  const Text("SIZE:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      _buildSizeOption("10\"", false),
                      const SizedBox(width: 15),
                      _buildSizeOption("14\"", true),
                      const SizedBox(width: 15),
                      _buildSizeOption("16\"", false),
                    ],
                  ),
                ],
              ),
            ),

            const Spacer(),

            // الجزء السفلي: السعر وعداد الكمية
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "\$32",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF2D323F), // لون غامق
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Row(
                      children: [
                        IconButton(onPressed: () {}, icon: const Icon(Icons.remove, color: Colors.white)),
                        const Text("2", style: TextStyle(color: Colors.white, fontSize: 18)),
                        IconButton(onPressed: () {}, icon: const Icon(Icons.add, color: Colors.white)),
                      ],
                    ),
                  )
                ],
              ),
            ),
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(
                 MaterialPageRoute<void>(
      builder: (BuildContext context) => Cart(),
    ),
  );
            }, child: Text("p"))
          ],
        ),
      ),
    );
  }

  // ويدجت مساعدة لمعلومات التقييم والوقت
  Widget _buildInfoIcon(IconData icon, String text, Color color) {
    return Row(
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(width: 5),
        Text(text, style: const TextStyle(fontWeight: FontWeight.w500)),
      ],
    );
  }

  // ويدجت مساعدة لاختيار الحجم
  Widget _buildSizeOption(String size, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.orange : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: isSelected ? Colors.orange : Colors.grey.shade300),
      ),
      child: Text(
        size,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}