import 'package:flutter/material.dart';
import 'package:food_aap/auto/widget_contet/containt_six.dart';
import 'package:food_aap/auto/widget_contet/destals_con_nine.dart';
import 'package:food_aap/auto/widget_contet/hurry_offers_seven.dart';



class ResContaintEginht extends StatelessWidget {
  const ResContaintEginht({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop(ContaintSix());
          },
          child: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20)),
        title: const Text("Restaurant View", style: TextStyle(color: Colors.black, fontSize: 18)),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (BuildContext context) => const DestalsConNine(),
    ),);
          }, icon: const Icon(Icons.more_horiz, color: Colors.black)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. صورة المطعم المنحنية
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(
                  'https://images.unsplash.com/photo-1552566626-52f8b828add9?q=80&w=1000',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),

              // 2. اسم المطعم والوصف
              const Text(
                "Spicy Restaurant",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "Maecenas sed diam eget risus varius blandit sit amet non magna. Integer posuere erat a ante venenatis dapibus.",
                style: TextStyle(color: Colors.grey, height: 1.4),
              ),
              const SizedBox(height: 15),

              // 3. التقييم والوقت
              Row(
                children: [
                  _infoIcon(Icons.star_border, "4.7"),
                  const SizedBox(width: 25),
                  _infoIcon(Icons.delivery_dining_outlined, "Free"),
                  const SizedBox(width: 25),
                  _infoIcon(Icons.access_time, "20 min"),
                ],
              ),
              const SizedBox(height: 25),

              // 4. التصنيفات
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildCategory("Burger", isSelected: true),
                    _buildCategory("Sandwich"),
                    _buildCategory("Pizza"),
                    _buildCategory("Sanwich"),
                  ],
                ),
              ),
              const SizedBox(height: 25),

              // 5. قسم البرجر مع Grid
              const Text("Burger (10)", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 15),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: 4, // عدد العناصر
                itemBuilder: (context, index) {
                  return const FoodItemCard();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ودجت أيقونات المعلومات (النجوم، الوقت)
  Widget _infoIcon(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, color: Colors.orange, size: 20),
        const SizedBox(width: 5),
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
      ],
    );
  }

  // ودجت أزرار التصنيف
  Widget _buildCategory(String title, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
      decoration: BoxDecoration(
        color: isSelected ? Colors.orange[400] : Colors.transparent,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: isSelected ? Colors.transparent : Colors.grey.shade300),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.grey[600],
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

// كود بطاقة المنتج (البرجر)
class FoodItemCard extends StatelessWidget {
  const FoodItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.05), blurRadius: 10, spreadRadius: 5),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: Image.network(
                'https://pngimg.com/uploads/burger_sandwich/burger_sandwich_PNG4135.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          const Text("Burger Ferguson", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          const Text("Spicy Restaurant", style: TextStyle(color: Colors.grey, fontSize: 11)),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("\$40", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(8)),
                child: const Icon(Icons.add, color: Colors.white, size: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }
}