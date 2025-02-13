import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:side_proj/admin_module/menu_feature/presentation/components/customized_text_form_category.dart';
import 'package:side_proj/admin_module/menu_feature/presentation/controller/amin_menu_cubit.dart';
import 'package:side_proj/admin_module/menu_feature/presentation/controller/amin_menu_states.dart';
import 'package:side_proj/services/services_locator.dart';
import 'package:side_proj/shared/components.dart';
import 'package:side_proj/shared/constants.dart';

class AddingNewCategoryTable extends StatelessWidget {
  const AddingNewCategoryTable({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdminMenuCubit(getIt()),
      child: BlocBuilder<AdminMenuCubit, AdminMenuState>(
        builder: (context, state) {
          return Form(
            key: AdminMenuCubit.get(context).formKey,
            child: Center(
              child: Material(
                child: Container(
                  width: 600,
                  height: 400,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(.2),
                        spreadRadius: 1.2,
                        blurRadius: .3,
                        offset: Offset.fromDirection(.1),
                      )
                    ],
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Adding new category',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        Row(
                          children: [
                            const Text(
                              'Category name',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            customizedTextFormCategory(
                              controller: AdminMenuCubit.get(context)
                                  .categoryNameController,
                              hintText: 'Pizza',
                              validatorText: 'Required',
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            const Text(
                              'Category item  ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            customizedTextFormCategory(
                              controller: AdminMenuCubit.get(context)
                                  .categoryItemController,
                              hintText: 'Ranch',
                              validatorText: 'Required',
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            const Text(
                              '&',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            const Text(
                              'price ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            customizedTextFormCategory(
                              controller: AdminMenuCubit.get(context)
                                  .categoryPriceController,
                              width: 60,
                              hintText: '150',
                              textType: TextInputType.number,
                              validatorText: 'Required',
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            BlocBuilder<AdminMenuCubit, AdminMenuState>(
                              builder: (context, state) {
                                return SizedBox(
                                  width: 90,
                                  height: 50,
                                  child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      foregroundColor: Colors.black,
                                      side:
                                          const BorderSide(color: Colors.black),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    onPressed: () {
                                      if (AdminMenuCubit.get(context)
                                          .formKey
                                          .currentState!
                                          .validate()) {
                                        log(kRestaurantId.toString());
                                        AdminMenuCubit.get(context).addItemMenu(
                                            categoryId:
                                                AdminMenuCubit.get(context)
                                                    .categoryNameController
                                                    .text,
                                            itemName:
                                                AdminMenuCubit.get(context)
                                                    .categoryItemController
                                                    .text,
                                            itemPrice: int.parse(
                                                AdminMenuCubit.get(context)
                                                    .categoryPriceController
                                                    .text));
                                      }
                                    },
                                    child: const Text('Add'),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            CustomizedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                width: 90,
                                height: 50,
                                text: const Center(
                                  child: Text(
                                    'Done',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                )),
                            const SizedBox(
                              width: 7,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
