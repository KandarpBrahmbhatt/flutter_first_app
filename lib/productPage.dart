import 'package:flutter/material.dart';

class Productpage extends StatefulWidget {
  const Productpage({super.key});

  @override
  State<Productpage> createState() => _ProductpageState();
}

class _ProductpageState extends State<Productpage> {
  int currentIndex = 0;
  int selectedFlavor = 0;
  int selectedSize = 0;

  final List<String> images = [
    "images/Screenshot 2025-12-14 152123.png",
    "images/Screenshot 2025-12-14 152138.png",
    "images/Screenshot 2025-12-15 111217.png",
  ];

  final List<String> flavors = [
    "Chicken & Green Pea",
    "Duck & Green Pea",
    "Salmon & Green Pea",
    "Turkey & Chickpea",
  ];

  final List<String> sizes = ["2", "4", "4.5", "5", "8", "10"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Detail"),
        actions: const [
          Icon(Icons.favorite_border),
          SizedBox(width: 12),
          Icon(Icons.share),
          SizedBox(width: 12),
        ],
      ),

      // scrollbale body
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image slider
            SizedBox(
              height: 220,
              child: PageView.builder(
                itemCount: images.length,
                onPageChanged: (index) {
                  setState(() => currentIndex = index);
                },
                itemBuilder: (context, index) {
                  return Center(
                    child: Image.asset(images[index], fit: BoxFit.contain),
                  );
                },
              ),
            ),

            const SizedBox(height: 10),

            // dot button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                images.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: currentIndex == index ? 10 : 8,
                  height: currentIndex == index ? 10 : 8,
                  decoration: BoxDecoration(
                    color: currentIndex == index ? Colors.green : Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Chicken and green pea Recipe",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 6),

            const Text(
              "By Natural Balance",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 20),

            // Price & Counter
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "\$28.99",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {},
                      ),
                      const Text("1", style: TextStyle(fontSize: 18)),
                      IconButton(icon: const Icon(Icons.add), onPressed: () {}),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Flavor
            const Text(
              "Flavor",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: flavors.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 3.5,
              ),
              itemBuilder: (context, index) {
                final bool isSelected = selectedFlavor == index;
                return GestureDetector(
                  onTap: () {
                    setState(() => selectedFlavor = index);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: isSelected
                            ? Colors.orange
                            : Colors.grey.shade400,
                        width: 1.5,
                      ),
                    ),
                    child: Text(
                      flavors[index],
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            // Size
            const Text(
              "Size in Pound",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: List.generate(sizes.length, (index) {
                final bool isSelected = selectedSize == index;
                return GestureDetector(
                  onTap: () {
                    setState(() => selectedSize = index);
                  },
                  child: Container(
                    height: 45,
                    width: 45,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected
                            ? Colors.orange
                            : Colors.grey.shade400,
                        width: 1.5,
                      ),
                    ),
                    child: Text(
                      sizes[index],
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              }),
            ),

            const SizedBox(height: 90), // space for button
          ],
        ),
      ),

      //  FIXED BUTTON
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF15866E),

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {},
            child: const Text(
              "Add to Cart",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
