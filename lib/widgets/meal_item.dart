import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    required this.meal,
    required this.onSelectMeal,
    super.key,
  });

  final Meal meal;
  final void Function(BuildContext context, Meal meal) onSelectMeal;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        clipBehavior: Clip.hardEdge,
        elevation: 2,
        child: InkWell(
          onTap: () {
            onSelectMeal(
              context,
              meal,
            );
          },
          child: Stack(
            children: [
              Hero(
                tag: meal.id,
                child: FadeInImage(
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(meal.imageUrl),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black54,
                  padding: const EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 44,
                  ),
                  child: Column(
                    children: [
                      Text(
                        meal.title,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MealItemTrait(
                            icon: Icons.access_time,
                            label: '${meal.duration.toString()} min',
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          MealItemTrait(
                            icon: Icons.work_outline,
                            label: meal.complexity.toString(),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          MealItemTrait(
                            icon: Icons.attach_money,
                            label: meal.affordability.toString(),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.bottomCenter,
//       margin: const EdgeInsets.all(12),
//       height: 200,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         image: DecorationImage(
//           fit: BoxFit.cover,
//           image: NetworkImage(meal.imageUrl),
//         ),
//       ),
//       child: Container(
//         padding: const EdgeInsets.symmetric(
//           vertical: 10,
//         ),
//         height: 80,
//         decoration: const BoxDecoration(
//           color: Color.fromARGB(123, 47, 46, 46),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               meal.title,
//               style: const TextStyle().copyWith(
//                 color: Colors.white,
//                 fontSize: 20,
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Icon(Icons.access_time),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 Text(
//                   '${meal.duration.toString()} min',
//                   style: const TextStyle().copyWith(color: Colors.white),
//                 ),
//                 const SizedBox(
//                   width: 30,
//                 ),
//                 const Icon(Icons.work_outlined),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 Text(
//                   meal.complexity.toString(),
//                   style: const TextStyle().copyWith(color: Colors.white),
//                 ),
//                 const SizedBox(
//                   width: 30,
//                 ),
//                 const Icon(Icons.attach_money),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 Text(
//                   meal.affordability.toString(),
//                   style: const TextStyle().copyWith(color: Colors.white),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
}
