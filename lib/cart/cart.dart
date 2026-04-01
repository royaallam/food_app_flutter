import 'package:flutter/material.dart';



class Cart  extends StatelessWidget {
  const Cart  ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {},
        ),
        title: const Text('Cart', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('DONE', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
      body: Column(
        children: [
          // قائمة المنتجات
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                CartItem(
                  title: 'Pizza Calzone European',
                  price: 64,
                  quantity: 2,
                  imageUrl: 'https://via.placeholder.com/100', // استبدلها برابط الصورة الحقيقية
                ),
                SizedBox(height: 16),
                CartItem(
                  title: 'Pizza Calzone European',
                  price: 32,
                  quantity: 1,
                  imageUrl: 'https://via.placeholder.com/100',
                ),
              ],
            ),
          ),
          
          // منطقة الدفع والعنوان
          Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('DELIVERY ADDRESS', style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold)),
                    TextButton(
                      onPressed: () {},
                      child: const Text('EDIT', style: TextStyle(color: Colors.orange, fontSize: 12)),
                    ),
                  ],
                ),
                const Text(
                  '2118 Thornridge Cir. Syracuse',
                  style: TextStyle(color: Colors.black54, fontSize: 16),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('TOTAL:', style: TextStyle(color: Colors.grey, fontSize: 16)),
                    const Text('\$96', style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold)),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Breakdown >', style: TextStyle(color: Colors.orange)),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange[700],
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    ),
                    onPressed: () {
                      
                    },
                    child: const Text('PLACE ORDER', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final String title;
  final int price;
  final int quantity;
  final String imageUrl;

  const CartItem({
    super.key,
    required this.title,
    required this.price,
    required this.quantity,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(imageUrl, width: 80, height: 80, ), // استخدم Image.asset لصورك المحلية
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
                    const Icon(Icons.cancel, color: Colors.redAccent, size: 20),
                  ],
                ),
                const SizedBox(height: 8),
                Text('\$$price', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('14"', style: TextStyle(color: Colors.grey)),
                    Row(
                      children: [
                        _buildQtyBtn(Icons.remove),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text('$quantity', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        ),
                        _buildQtyBtn(Icons.add),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQtyBtn(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 16, color: Colors.white),
    );
  }
}