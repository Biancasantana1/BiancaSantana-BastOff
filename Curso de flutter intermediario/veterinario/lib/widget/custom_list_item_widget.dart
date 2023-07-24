import 'package:flutter/material.dart';
import 'package:veterinario/utils/assets_images_utils.dart';
import '../model/veterinarian_model.dart';
import '../pages/veterinarian_details_page.dart';

class CustomListItemWidget extends StatelessWidget {
  final Veterinarian veterinarian;

  const CustomListItemWidget({
    super.key,
    required this.veterinarian,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                VeterinarianDetailsPage(veterinarian: veterinarian),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(
            MediaQuery.of(context).size.width * 0.05,
            MediaQuery.of(context).size.height * 0.025,
            MediaQuery.of(context).size.width * 0.05,
            0),
        constraints: const BoxConstraints(
          maxWidth: 340,
          maxHeight: 150,
        ),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.12),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(
              width: 90,
              height: 100,
              child: Image.asset(
                veterinarian.imagePath,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    veterinarian.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Manrope',
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Service: ${veterinarian.specialty}',
                    style: const TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: 12,
                    ),
                  ),
                  Row(
                    children: [
                      Image.asset(AssetsImg.mapPin),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        veterinarian.distance,
                        style: const TextStyle(
                          color: Color(0XFFACA3A3),
                          fontFamily: 'Manrope',
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        veterinarian.rating,
                        style: const TextStyle(
                          color: Color(0XFF50CC98),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Manrope',
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(
                        width: 100,
                      ),
                      Image.asset(
                        veterinarian.icon1Path,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Image.asset(
                        veterinarian.icon2Path,
                      ),
                    ],
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
