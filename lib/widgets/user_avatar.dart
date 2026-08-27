import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final String name;
  final String? imageUrl;
  final bool isMuted;
  final bool isSpeaking;
  final double size;

  const UserAvatar({
    super.key,
    required this.name,
    this.imageUrl,
    this.isMuted = false,
    this.isSpeaking = false,
    this.size = 58,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: size + 8,
          height: size + 8,
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: isSpeaking
                ? const LinearGradient(
                    colors: [
                      Color(0xFF7B61FF),
                      Color(0xFFFF5FA2),
                    ],
                  )
                : null,
            border: isSpeaking
                ? null
                : Border.all(
                    color: Colors.white24,
                  ),
          ),
          child: ClipOval(
            child: imageUrl != null
                ? Image.network(
                    imageUrl!,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => _fallback(),
                  )
                : _fallback(),
          ),
        ),
        const SizedBox(height: 6),
        SizedBox(
          width: 85,
          child: Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ),
        if (isMuted)
          const Icon(
            Icons.mic_off_rounded,
            color: Colors.redAccent,
            size: 15,
          ),
      ],
    );
  }

  Widget _fallback() {
    return Container(
      color: const Color(0xFF302A50),
      alignment: Alignment.center,
      child: Text(
        name.isNotEmpty ? name[0].toUpperCase() : '?',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
