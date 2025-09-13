// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'login_page.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  final List<Map<String, dynamic>> allProducts = [
    {"name": "ساعة يد", "price": "50\$", "image": "https://cdn-icons-png.flaticon.com/512/992/992700.png", "category": "إكسسوارات"},
    {"name": "حقيبة", "price": "35\$", "image": "https://cdn-icons-png.flaticon.com/512/891/891462.png", "category": "إكسسوارات"},
    {"name": "حذاء", "price": "60\$", "image": "https://cdn-icons-png.flaticon.com/512/1404/1404945.png", "category": "أحذية"},
    {"name": "قميص", "price": "25\$", "image": "https://cdn-icons-png.flaticon.com/512/892/892458.png", "category": "ملابس"},
    {"name": "كمبيوتر محمول", "price": "750\$", "image": "https://cdn-icons-png.flaticon.com/512/3566/3566345.png", "category": "إلكترونيات"},
    {"name": "هاتف", "price": "400\$", "image": "https://cdn-icons-png.flaticon.com/512/724/724715.png", "category": "إلكترونيات"},
    {"name": "نظارة شمس", "price": "45\$", "image": "https://cdn-icons-png.flaticon.com/512/2945/2945448.png", "category": "إكسسوارات"},
    {"name": "سماعات", "price": "80\$", "image": "https://cdn-icons-png.flaticon.com/512/2945/2945413.png", "category": "إلكترونيات"},
  ];

  List<Map<String, dynamic>> filteredProducts = [];
  int _currentIndex = 0;
  final TextEditingController _searchController = TextEditingController();
  final List<String> categories = ["الكل", "إلكترونيات", "ملابس", "أحذية", "إكسسوارات"];

  @override
  void initState() {
    super.initState();
    filteredProducts = allProducts;
  }

  void _filterProducts(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredProducts = allProducts;
      } else {
        filteredProducts = allProducts
            .where((p) =>
                p["name"].toString().contains(query) ||
                p["name"].toString().toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _filterByCategory(int index) {
    setState(() {
      _currentIndex = index;
      if (index == 0) {
        filteredProducts = allProducts;
      } else {
        String selectedCategory = categories[index];
        filteredProducts = allProducts
            .where((p) => p["category"] == selectedCategory)
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text(
          "متجرنا",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        backgroundColor: const Color(0xFF6C63FF),
        elevation: 0,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const LoginPage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // شريط البحث
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: TextField(
                controller: _searchController,
                onChanged: _filterProducts,
                decoration: InputDecoration(
                  hintText: "ابحث عن منتج...",
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
              ),
            ),
          ),

          // فئات المنتجات
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ChoiceChip(
                    label: Text(categories[index]),
                    selected: _currentIndex == index,
                    selectedColor: const Color(0xFF6C63FF),
                    onSelected: (selected) {
                      _filterByCategory(index);
                    },
                    backgroundColor: Colors.white,
                    labelStyle: TextStyle(
                      color: _currentIndex == index ? Colors.white : Colors.grey,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 16),

          // عنوان القسم
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "منتجاتنا",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2D2D2D),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // عرض المنتجات بشكل بطاقات شبكية أنيقة
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                itemCount: filteredProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // صورة المنتج
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                            child: Container(
                              color: const Color(0xFFF5F5F5),
                              padding: const EdgeInsets.all(16),
                              child: Image.network(
                                product["image"],
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        
                        // تفاصيل المنتج
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product["name"],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Color(0xFF6C63FF), // تغيير لون النص إلى البنفسجي
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                product["price"],
                                style: const TextStyle(
                                  color: Color(0xFF6C63FF),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              // زر شراء
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF6C63FF),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                  ),
                                  child: const Text(
                                    "إضافة إلى السلة",
                                    style: TextStyle(fontSize: 14, color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      
      // شريط التنقل السفلي
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF6C63FF),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "الرئيسية",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "الفئات",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "المفضلة",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "حسابي",
          ),
        ],
      ),
    );
  }
}