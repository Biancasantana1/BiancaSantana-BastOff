import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/scheduling_controller.dart';
import '../model/scheduling_model.dart';
import '../model/veterinarian_model.dart';

class VeterinarianDetailsPage extends StatefulWidget {
  final Veterinarian veterinarian;

  const VeterinarianDetailsPage({
    super.key,
    required this.veterinarian,
  });

  @override
  VeterinarianDetailsPageState createState() => VeterinarianDetailsPageState();
}

class VeterinarianDetailsPageState extends State<VeterinarianDetailsPage> {
  String selectedTime = '';

  @override
  Widget build(BuildContext context) {
    final schedulingController = Provider.of<SchedulingController>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF757EFA),
        title: const Text(
          'Detalhes do Veterinário',
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Manrope',
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(
                widget.veterinarian.imagePath,
              ),
              radius: 70,
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.veterinarian.name,
                  style: const TextStyle(
                    color: Color(0xFF757EFA),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Manrope',
                  ),
                ),
                const SizedBox(width: 10),
                Image.asset(widget.veterinarian.icon1Path),
                const SizedBox(width: 5),
                Image.asset(widget.veterinarian.icon2Path),
              ],
            ),
            Text(
              widget.veterinarian.specialty,
              style: const TextStyle(
                color: Color(0xFF9CA8FB),
                fontSize: 14,
                fontFamily: 'Manrope',
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
                color: Color(0xFF757EFA),
              ),
              title: const Text(
                'Endereço',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Manrope',
                ),
              ),
              subtitle: Text(
                widget.veterinarian.address,
                style: const TextStyle(
                  fontSize: 12,
                  fontFamily: 'Manrope',
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.phone,
                color: Color(0xFF757EFA),
              ),
              title: const Text(
                'Telefone',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Manrope',
                ),
              ),
              subtitle: Text(
                widget.veterinarian.phoneNumber,
                style: const TextStyle(
                  fontSize: 12,
                  fontFamily: 'Manrope',
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Horários Disponíveis',
              style: TextStyle(
                color: Color(0xFF757EFA),
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Manrope',
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: widget.veterinarian.availableHours.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  secondary: const Icon(
                    Icons.watch_later_outlined,
                    color: Color(0xFF757EFA),
                  ),
                  checkColor: Colors.white,
                  activeColor: const Color(0xFF757EFA),
                  title: Text(widget.veterinarian.availableHours[index]),
                  value:
                      widget.veterinarian.availableHours[index] == selectedTime,
                  onChanged: (bool? value) {
                    setState(
                      () {
                        if (value == true) {
                          selectedTime =
                              widget.veterinarian.availableHours[index];
                        } else {
                          selectedTime = '';
                        }
                      },
                    );
                  },
                );
              },
            ),
            ElevatedButton(
              onPressed: selectedTime == ''
                  ? null
                  : () {
                      Scheduling newScheduling = Scheduling(
                        veterinarian: widget.veterinarian,
                        selectedDate: '2023-07-22',
                        selectedTime: selectedTime,
                      );

                      schedulingController.addScheduling(newScheduling);

                      Navigator.pop(context);
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF757EFA),
              ),
              child: const Text(
                'Agendar',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Manrope',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
