import 'package:flutter/material.dart';

class CustomListItem extends StatelessWidget {
  final String titulo;
  final String fecha;
  final String initials;
  final VoidCallback onClick; 
  final VoidCallback onIconClick; 

  const CustomListItem({
    super.key,
    required this.titulo,
    required this.fecha,
    required this.initials,
    required this.onClick,
    required this.onIconClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick, 
      child: Container(
        width: double.infinity,
        height: 65,
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 46,
                  height: double.infinity,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFA5D9D9), // PrimaryLight
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      initials,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titulo,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      fecha,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            
            
            GestureDetector(
              onTap: onIconClick,
            
              child: Container(
                color: Colors.transparent, 
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: const Icon(
                  Icons.arrow_forward_ios_rounded, 
                  size: 16, 
                  color: Color(0xFF919191)
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}