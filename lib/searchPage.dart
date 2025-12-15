import 'package:flutter/material.dart';

class Searchpage extends StatelessWidget {
  const Searchpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      /// app bar
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),

        /// SEARCH BAR
        title: Container(
          height: 42,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            children: const [
              Icon(Icons.search, color: Colors.grey),
              SizedBox(width: 8),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search here",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      ///body
      body: Column(
        children: [
          /// FILTER CHIPS
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                filterChip("Cat", Icons.pets, true),
                const SizedBox(width: 10),
                filterChip("Offers", Icons.local_offer, false),
                const SizedBox(width: 10),
                filterChip("4.0+", Icons.star_border, false),
              ],
            ),
          ),

          /// PRODUCT GRID
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 14,
                  childAspectRatio: 0.60,
                ),
                itemBuilder: (context, index) {
                  return productCard(products[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// FILTER CHIP
  static Widget filterChip(String text, IconData icon, bool showClose) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.orange),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.orange),
          const SizedBox(width: 6),
          Text(text),
          if (showClose) ...[
            const SizedBox(width: 6),
            const Icon(Icons.close, size: 14),
          ],
        ],
      ),
    );
  }

  /// product card
  static Widget productCard(Product product) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// IMAGE + DISCOUNT
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(14),
                ),
                child: product.image.startsWith("http")
                    ? Image.network(
                        product.image,
                        height: 140,
                        width: double.infinity,
                        fit: BoxFit.contain,
                      )
                    : Image.asset(
                        product.image,
                        height: 140,
                        width: double.infinity,
                        fit: BoxFit.contain,
                      ),
              ),
              if (product.discount != null)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      product.discount!,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),

                /// RATING
                Row(
                  children: [
                    const Icon(Icons.star, size: 16, color: Colors.orange),
                    const SizedBox(width: 4),
                    Text("${product.rating} (${product.reviews})"),
                  ],
                ),

                const SizedBox(height: 8),

                /// PRICE + ADD
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "\$${product.price}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (product.oldPrice != null)
                          Text(
                            "\$${product.oldPrice}",
                            style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                          ),
                      ],
                    ),
                    Container(
                      height: 36,
                      width: 36,
                      decoration: const BoxDecoration(
                        color: Colors.deepOrange,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
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
}

/// PRODUCT MODEL
class Product {
  final String title;
  final String image;
  final String price;
  final String? oldPrice;
  final String rating;
  final String reviews;
  final String? discount;

  Product({
    required this.title,
    required this.image,
    required this.price,
    this.oldPrice,
    required this.rating,
    required this.reviews,
    this.discount,
  });
}

/// PRODUCT DATA
List<Product> products = [
  Product(
    title: "Chicken & Green Pea Recipe",
    image: "images/Screenshot 2025-12-14 152123.png",
    price: "28.99",
    rating: "4.8",
    reviews: "2.2k",
  ),
  Product(
    title: "Blue Skin & Stomach Care",
    image: "images/Screenshot 2025-12-14 152138.png",
    price: "32.99",
    oldPrice: "44.99",
    rating: "5.0",
    reviews: "345",
    discount: "25% OFF",
  ),
  Product(
    title: "Nature diet with Chiken",
    image: "images/Screenshot 2025-12-14 233346.png",
    price: "32.99",
    oldPrice: "44.99",
    rating: "4.8",
    reviews: "345",
    discount: "25% OFF",
  ),
  Product(
    title: "Freedom Gain free Blue Buffalo",
    image: "images/Screenshot 2025-12-15 111217.png",
    price: "24.99",
    oldPrice: "44.99",
    rating: "4.9",
    reviews: "345",
    discount: "25% OFF",
  ),
];
