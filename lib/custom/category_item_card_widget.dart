import 'package:flutter/material.dart';

import '../data_model/category_response.dart';
import '../my_theme.dart';
import '../screens/category_list_n_product/category_products.dart';
import 'box_decorations.dart';
import 'device_info.dart';

class CategoryItemCardWidget extends StatelessWidget {
  final CategoryResponse categoryResponse;
  final int index;

  const CategoryItemCardWidget({
    Key? key,
    required this.categoryResponse,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var itemWidth = ((DeviceInfo(context).width! - 36) / 3);
    return Container(
      decoration: BoxDecorations.buildBoxDecoration_1(),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return CategoryProducts(
                  slug: categoryResponse.categories![index].slug ?? "",
                );
              },
            ),
          );
        },
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                constraints: BoxConstraints(maxHeight: itemWidth - 28),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(6),
                      topLeft: Radius.circular(6)),
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/placeholder.png',
                    image: categoryResponse.categories![index].banner!,
                    fit: BoxFit.cover,
                    height: itemWidth,
                    width: DeviceInfo(context).width,
                  ),
                ),
              ),
              Container(
                height: 60,
                alignment: Alignment.center,
                width: DeviceInfo(context).width,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Text(
                  categoryResponse.categories![index].name!,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                      color: MyTheme.font_grey,
                      fontSize: 10,
                      height: 1.6,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
