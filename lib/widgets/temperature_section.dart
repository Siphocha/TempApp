import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TempArea extends StatelessWidget {
  //This section is stateless as nothing changes in temp.
  //No data extrapolation needed here just order.
  final TextEditingController inputController;
  final double? convertedValue;
  final VoidCallback changedInput;

  const TempArea({
    //Main text controllers.
    //These are the values that master most.
    Key? key,
    required this.inputController,
    required this.convertedValue,
    required this.changedInput,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      //Put it in a row first,
      children: [
        // Input field
        Expanded(
          child: TextField(
            controller: inputController,
            keyboardType: const TextInputType.numberWithOptions(
              decimal: true,
              //decimals are allowed, and allowing negative ints.
              signed: true,
            ),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^-?\d*\.?\d*')),
              //Regular expressions are held from being used.
            ],
            decoration: InputDecoration(
              hintText: 'Temperature',
              //Putting the thermostat icon and temp word.
              prefixIcon: const Icon(Icons.thermostat),
            ),
            style: const TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
            onChanged: (_) => changedInput(),
          ),
        ),

        // Equals sign with animation and colouring
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Text(
              '=',
              key: ValueKey<double?>(convertedValue),
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ),

        // Result display with animation
        Expanded(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color:
                  convertedValue != null
                      ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
                      : Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color:
                    convertedValue != null
                        ? Theme.of(context).colorScheme.primary
                        : Colors.white,
              ),
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: Text(
                convertedValue?.toStringAsFixed(1) ?? '',
                key: ValueKey<double?>(convertedValue),
                style: TextStyle(
                  fontSize: 18,
                  color:
                      convertedValue != null
                          ? Theme.of(context).colorScheme.primary
                          : Colors.white,
                  fontWeight:
                      convertedValue != null
                          ? FontWeight.bold
                          : FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
