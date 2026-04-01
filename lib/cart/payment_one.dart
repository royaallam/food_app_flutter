import 'package:flutter/material.dart';



class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  // متغير لتحديد طريقة الدفع المختارة
  String selectedMethod = 'Mastercard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // خلفية مائلة للرمادي مثل الصورة
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text('Payment', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // 1. شريط اختيار نوع البطاقة (Horizontal List)
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildPaymentOption('Cash', Icons.money),
                  _buildPaymentOption('Visa', Icons.credit_card),
                  _buildPaymentOption('Mastercard', Icons.credit_card, isSelected: true),
                  _buildPaymentOption('Paypal', Icons.payment),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // 2. عرض البطاقة أو الحالة (No card added)
            _buildEmptyCardView(),

            const Spacer(),

            // 3. عرض المجموع
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'TOTAL:',
                  style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$96',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // 4. زر التأكيد والدفع
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE67E44), // اللون البرتقالي الموجود بالصورة
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text(
                  'PAY & CONFIRM',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ويدجت لبناء خيارات الدفع العلوية
  Widget _buildPaymentOption(String title, IconData icon, {bool isSelected = false}) {
    return Container(
      width: 90,
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(15),
        border: isSelected ? Border.all(color: Colors.orangeAccent, width: 2) : null,
        boxShadow: isSelected ? [BoxShadow(color: Colors.black12, blurRadius: 5)] : [],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: isSelected ? Colors.orange : Colors.grey),
          const SizedBox(height: 5),
          Text(title, style: TextStyle(color: isSelected ? Colors.black : Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }

  // ويدجت لعرض شكل البطاقة الفارغة
  Widget _buildEmptyCardView() {
    return Column(
      children: [
        // رسمة البطاقة الافتراضية
        Container(
          height: 180,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFF2994A), Color(0xFFF2C94C)], // تدرج برتقالي وأصفر
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 20, left: 20,
                child: CircleAvatar(backgroundColor: Colors.white.withOpacity(0.3), radius: 15),
              ),
              const Center(
                child: Icon(Icons.credit_card, size: 80, color: Colors.white24),
              )
            ],
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'No master card added',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text(
          'You can add a mastercard and\nsave it for later',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 20),
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add, color: Colors.deepOrange),
          label: const Text('ADD NEW', style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}