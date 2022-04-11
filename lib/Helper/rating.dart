// import 'package:flutter/material.dart';

// typedef void RatingChangeCallback(double rating);

// class StarRating extends StatelessWidget {
//   final int starCount;
//   final double rating;
//   final RatingChangeCallback onRatingChanged;
//   final Color color;

//   StarRating(
//       {this.starCount = 5,
//       this.rating = .0,
//     this.onRatingChanged = 4.0,
//      this.color});

//   Widget buildStar(BuildContext context, int index) {
//     Icon icon;
//     if (index >= rating) {
//       icon = new Icon(
//         Icons.star_border,
//         color: Theme.of(context).buttonColor,
//       );
//     } else if (index > rating - 1 && index < rating) {
//       icon = new Icon(
//         Icons.star_half,
//         color: Color(0xFFFF4C4C),
//       );
//     } else {
//       icon = new Icon(
//         Icons.star,
//         color: Color(0xFFFF4C4C),
//       );
//     }
//     return new InkResponse(
//       onTap:
//           onRatingChanged == null ? null : () => onRatingChanged(index + 1.0),
//       child: icon,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Row(
//         children:
//             new List.generate(starCount, (index) => buildStar(context, index)));
//   }
// }
