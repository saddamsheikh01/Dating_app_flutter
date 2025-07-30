import 'package:dataing_app/utils/constants/colors.dart';
import 'package:dataing_app/utils/constants/sizes.dart';
import 'package:dataing_app/common/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

Future<void> showBirthdayPicker(
  BuildContext context,
  DateTime? initialDate,
  Function(DateTime) onSaved,
) async {
  DateTime focusedDay =
      initialDate ?? DateTime.now().subtract(const Duration(days: 365 * 25));
  DateTime selectedDay = focusedDay;

  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) {
      return DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.6,
        maxChildSize: 0.9,
        minChildSize: 0.4,
        builder: (context, scrollController) {
          return StatefulBuilder(
            builder: (context, setModalState) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.lg,
                  vertical: TSizes.md,
                ),
                decoration: const BoxDecoration(

                  color: TColors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(TSizes.cardRadiusLg),
                  ),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      /// Drag Handle
                      Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(height: TSizes.spaceBtwItem),

                      /// Title
                      const Text(
                        'Birthday',
                        style: TextStyle(
                          fontSize: TSizes.fontSizeLg,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      /// Year & Month Display with Arrows
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: TSizes.sm,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.arrow_left,
                                color: TColors.primary,
                              ),
                              onPressed: () {
                                setModalState(() {
                                  focusedDay = DateTime(
                                    focusedDay.year - 1,
                                    focusedDay.month,
                                  );
                                });
                              },
                            ),
                            Column(
                              children: [
                                Text(
                                  DateFormat('yyyy').format(focusedDay),
                                  style: const TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: TColors.primary,
                                  ),
                                ),
                                Text(
                                  DateFormat('MMMM').format(focusedDay),
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: TColors.primary,
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.arrow_right,
                                color: TColors.primary,
                              ),
                              onPressed: () {
                                setModalState(() {
                                  focusedDay = DateTime(
                                    focusedDay.year + 1,
                                    focusedDay.month,
                                  );
                                });
                              },
                            ),
                          ],
                        ),
                      ),

                      /// Calendar
                      TableCalendar(
                        focusedDay: focusedDay,
                        firstDay: DateTime(1900),
                        lastDay: DateTime.now(),
                        currentDay: selectedDay,
                        calendarFormat: CalendarFormat.month,
                        availableGestures: AvailableGestures.horizontalSwipe,
                        onDaySelected: (selected, focused) {
                          setModalState(() {
                            selectedDay = selected;
                            focusedDay = focused;
                          });
                        },
                        selectedDayPredicate: (day) =>
                            isSameDay(day, selectedDay),
                        calendarStyle: CalendarStyle(
                          todayDecoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          selectedDecoration: const BoxDecoration(
                            color: TColors.primary,
                            shape: BoxShape.circle,
                          ),
                          selectedTextStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          defaultTextStyle: const TextStyle(
                            fontWeight: FontWeight.w500,

                          ),
                        ),
                        headerVisible: false,
                        daysOfWeekStyle: const DaysOfWeekStyle(
                          weekdayStyle: TextStyle(color: Colors.grey),
                          weekendStyle: TextStyle(color: Colors.grey),
                        ),
                      ),

                      const SizedBox(height: TSizes.spaceBtwSections),

                      /// Save Button
                      PrimaryButton(
                        text: 'Save',
                        onPressed: () {
                          onSaved(selectedDay);
                          Get.back();
                        },
                      ),
                      const SizedBox(height: TSizes.spaceBtwItem),
                    ],
                  ),
                ),
              );
            },
          );
        },
      );
    },
  );
}
