import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skycast/providers/weather_provider.dart';
import 'package:skycast/utils/dimens.dart';

class SearchFieldWidget extends ConsumerWidget {
  const SearchFieldWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController searchTEController = TextEditingController();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: radius16),
      child: TextFormField(
          controller: searchTEController,
          cursorColor: const Color(0xFF335AC7),
          cursorHeight: height32,
          onTapOutside: (_) {
            FocusScope.of(context).unfocus();
            ref.read(searchFieldProvider.notifier).state = false;
          },
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Colors.grey, fontSize: 18.sp),
          decoration: InputDecoration(
            hintText: 'Search for a city',
            suffixIcon: IconButton(
              icon: const Icon(
                Icons.search,
                color: Color(0xFF335AC7),
              ),
              onPressed: () {
                if (searchTEController.text.trim().isNotEmpty) {
                  ref.read(weatherSearchQueryProvider.notifier).state =
                      searchTEController.text.trim();

                  ref.refresh(weatherProvider);
                  FocusScope.of(context).unfocus();
                  ref.read(weatherSearchQueryProvider.notifier).state = null;
                  ref.read(searchFieldProvider.notifier).state = false;
                }
              },
            ),
          )),
    );
  }
}
