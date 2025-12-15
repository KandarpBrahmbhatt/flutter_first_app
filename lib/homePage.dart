import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    // 🔹 Product images list (different images)
    final List<String> productImages = [
      "images/Screenshot 2025-12-14 152123.png",
      "images/Screenshot 2025-12-14 152138.png",
      "images/Screenshot 2025-12-15 111217.png",
      "images/Screenshot 2025-12-14 233346.png",
    ];

    // 🔹 Category data (NEW – different images)
    final List<Map<String, String>> categories = [
      {"name": "Cat", "image": "images/Screenshot 2025-12-10 114744.png"},
      {"name": "Dog", "image": "images/Screenshot 2025-12-14 155713.png"},
      {"name": "Bird", "image": "images/Screenshot 2025-12-14 155718.png"},
      {"name": "Fish", "image": "images/Screenshot 2025-12-14 155733.png"},
    ];

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.location_on, color: Colors.black),
        title: const Text(
          "Zurich, love road",
          style: TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [_circleIcon(Icons.search), _circleIcon(Icons.notifications)],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Banner Image
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.asset(
                "images/Screenshot 2025-12-09 132407.png",
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 12),

            // 🔹 Categories
            const ListTile(
              title: Text("Categories"),
              trailing: Text(
                "See All",
                style: TextStyle(color: Color(0xFF368777)),
              ),
            ),

            // 🔹 Categories with DIFFERENT IMAGES
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 80,
                    margin: const EdgeInsets.only(right: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipOval(
                          child: Container(
                            height: 60,
                            width: 60,
                            color: Colors.grey.shade200,
                            child: Image.asset(
                              categories[index]["image"]!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(categories[index]["name"]!),
                      ],
                    ),
                  );
                },
              ),
            ),

            // 🔹 Products
            const ListTile(
              title: Text("Top Selling"),
              trailing: Text("See All"),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: productImages.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.72,
                ),
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                            child: Image.asset(
                              productImages[index],
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Chiken and green",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            "\$120",
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  //  Reusable circular icon button
  Widget _circleIcon(IconData icon) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      height: 40,
      width: 40,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(icon, color: Colors.black),
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        iconSize: 22,
      ),
    );
  }
}
