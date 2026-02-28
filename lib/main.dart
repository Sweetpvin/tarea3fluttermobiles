import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductScreen(),
    );
  }
}

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text("Nothing Phone (2)"),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.star_border),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ✅ IMAGE FROM INTERNET
            Container(
              margin: const EdgeInsets.all(16),
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black26),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  "https://static0.pocketlintimages.com/wordpress/wp-content/uploads/wm/2023/07/nothingphone218-1.jpg?q=50&fit=crop&w=1600&h=900&dpr=1.5",
                  fit: BoxFit.cover,

                  /// loading indicator
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) return child;
                    return const Center(child: CircularProgressIndicator());
                  },

                  /// error image
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Icon(Icons.broken_image, size: 50),
                    );
                  },
                ),
              ),
            ),

            /// TITLE
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Description",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 10),

            /// DESCRIPTION
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "The Nothing Phone (2) features a 6.7-inch LTPO OLED display "
                "with a 120Hz adaptive refresh rate and HDR10+ support. "
                "Powered by the Qualcomm Snapdragon 8+ Gen 1 processor, "
                "it delivers flagship-level performance with up to 12GB RAM "
                "and 512GB storage.\n\n"
                "It includes a dual 50MP camera system (main and ultra-wide), "
                "a 32MP front camera, and supports 4K video recording at 60fps. "
                "The 4700mAh battery supports 45W fast charging, wireless "
                "charging, and reverse wireless charging.\n\n"
                "Running Nothing OS based on Android, the device stands out "
                "with its transparent industrial design and the Glyph Interface, "
                "a unique LED lighting system used for notifications, calls, "
                "timers, and interactive feedback.",
                style: TextStyle(fontSize: 15, height: 1.5),
              ),
            ),

            const SizedBox(height: 25),

            /// COLOR TITLE
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Color:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),

            const SizedBox(height: 10),

            /// COLOR OPTIONS
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                ColorCircle(color: Colors.white),
                ColorCircle(color: Colors.black),
                ColorCircle(color: Colors.grey),
                ColorCircle(color: Colors.blueGrey),
              ],
            ),

            const SizedBox(height: 30),

            /// BUTTONS
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                      ),
                      child: const Text(
                        "Add to Cart",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.favorite_border),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// COLOR CIRCLE WIDGET
class ColorCircle extends StatelessWidget {
  final Color color;

  const ColorCircle({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black26),
      ),
    );
  }
}
