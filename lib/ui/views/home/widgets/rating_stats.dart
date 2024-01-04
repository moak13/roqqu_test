import 'package:flutter/material.dart';
import 'package:sisyphus/models/rating_model.dart';

class RatingStats extends StatelessWidget {
  final RatingModel? rating;
  const RatingStats({
    super.key,
    this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                rating?.iconData,
                size: 13,
                color: rating?.statusColor,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                rating?.status ?? '',
                style: TextStyle(
                  color: rating?.statusColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            rating?.readings ?? '',
            style: TextStyle(
              color: rating?.readingsColor,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
