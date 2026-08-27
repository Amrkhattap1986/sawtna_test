import 'package:flutter/material.dart';
import '../data/gifts_data.dart';

class RoomScreen extends StatefulWidget {
  final String roomName;
  final int users;

  const RoomScreen({
    super.key,
    required this.roomName,
    required this.users,
  });

  @override
  State<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  int coins = 1200;
  bool micOn = false;
  bool handRaised = false;
  final List<String> messages = [];

  void requestMic() {
    setState(() => handRaised = !handRaised);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          handRaised ? '✋ تم إرسال طلب الكلام' : 'تم إلغاء الطلب',
        ),
      ),
    );
  }

  void toggleMic() {
    setState(() => micOn = !micOn);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(micOn ? '🎙️ المايك مفتوح' : '🔇 المايك مغلق'),
      ),
    );
  }

  void openChat() {
    final controller = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF211B31),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 12,
            right: 12,
            top: 12,
            bottom: MediaQuery.of(context).viewInsets.bottom + 12,
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  autofocus: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: 'اكتب رسالة...',
                    hintStyle: TextStyle(color: Colors.white54),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF7B61FF)),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  if (controller.text.trim().isNotEmpty) {
                    setState(() {
                      messages.add(controller.text.trim());
                    });
                    Navigator.pop(context);
                  }
                },
                icon: const Icon(Icons.send, color: Colors.white),
              ),
            ],
          ),
        );
      },
    );
  }

  void openGifts() {
    final categories = GiftsData.categories;

    final groupedGifts = categories
        .map(
          (category) => GiftsData.gifts
              .where((gift) => gift.category == category)
              .toList(),
        )
        .toList();

    int tab = 0;
    int selected = 0;
    int quantity = 1;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF211B31),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (sheetContext) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            final list = groupedGifts[tab];

            if (list.isEmpty) {
              return const SizedBox(
                height: 250,
                child: Center(
                  child: Text(
                    'No gifts in this category',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            }

            if (selected >= list.length) {
              selected = 0;
            }

            final gift = list[selected];
            final total = gift.price * quantity;

            return SafeArea(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .76,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(14, 10, 14, 12),
                  child: Column(
                    children: [
                      Container(
                        width: 45,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.white30,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      const SizedBox(height: 10),

                      Row(
                        children: [
                          const Text(
                            '🎁 Gift Center',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '🪙 $coins',
                            style: const TextStyle(
                              color: Colors.amber,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),

                      SizedBox(
                        height: 42,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, i) {
                            final active = tab == i;

                            return GestureDetector(
                              onTap: () {
                                setModalState(() {
                                  tab = i;
                                  selected = 0;
                                  quantity = 1;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 8),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                ),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: active
                                      ? const Color(0xFF7B61FF)
                                      : const Color(0xFF302745),
                                  borderRadius: BorderRadius.circular(22),
                                ),
                                child: Text(
                                  categories[i],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: active
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 10),

                      Expanded(
                        child: GridView.builder(
                          itemCount: list.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            childAspectRatio: .80,
                          ),
                          itemBuilder: (context, i) {
                            final g = list[i];
                            final active = selected == i;

                            return GestureDetector(
                              onTap: () {
                                setModalState(() {
                                  selected = i;
                                  quantity = 1;
                                });
                              },
                              child: AnimatedContainer(
                                duration:
                                    const Duration(milliseconds: 180),
                                decoration: BoxDecoration(
                                  color: active
                                      ? const Color(0xFF5A3D82)
                                      : const Color(0xFF302745),
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: active
                                        ? const Color(0xFFB69CFF)
                                        : Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      g.emoji,
                                      style: TextStyle(
                                        fontSize: active ? 46 : 40,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      g.name,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '🪙 ${g.price}',
                                      style: const TextStyle(
                                        color: Colors.amber,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF302745),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            Text(
                              '${gift.emoji} ${gift.name}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: quantity > 1
                                  ? () {
                                      setModalState(() => quantity--);
                                    }
                                  : null,
                              icon: const Icon(
                                Icons.remove_circle_outline,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              '$quantity',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setModalState(() => quantity++);
                              },
                              icon: const Icon(
                                Icons.add_circle_outline,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 8),

                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            if (coins < total) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('🪙 Not enough coins'),
                                ),
                              );
                              return;
                            }

                            setState(() {
                              coins -= total;
                            });

                            Navigator.pop(sheetContext);

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  '🎁 ${gift.name} × $quantity sent! -$total coins',
                                ),
                              ),
                            );
                          },
                          icon: const Text(
                            '🎁',
                            style: TextStyle(fontSize: 22),
                          ),
                          label: Text(
                            'Send Gift • 🪙 $total',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF171322),
      appBar: AppBar(
        backgroundColor: const Color(0xFF171322),
        foregroundColor: Colors.white,
        title: Text(widget.roomName),
        actions: [
          Center(
            child: Text(
              '🪙 $coins',
              style: const TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF7B61FF), Color(0xFFFF5FA2)],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 28,
                  child: Icon(Icons.person),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    '${widget.roomName}\n${widget.users} users online',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Text(
            '🎙️ SPEAKERS',
            style: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              padding: const EdgeInsets.all(16),
              children: List.generate(
                8,
                (index) => Column(
                  children: [
                    CircleAvatar(
                      radius: 27,
                      backgroundColor:
                          Colors.primaries[index % Colors.primaries.length],
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'User ${index + 1}',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (messages.isNotEmpty)
            Container(
              height: 70,
              padding: const EdgeInsets.all(8),
              child: ListView(
                children: messages
                    .map(
                      (message) => Text(
                        '💬 $message',
                        style: const TextStyle(color: Colors.white),
                      ),
                    )
                    .toList(),
              ),
            ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 10,
            ),
            color: const Color(0xFF211B31),
            child: Row(
              children: [
                IconButton(
                  onPressed: toggleMic,
                  icon: Icon(
                    micOn ? Icons.mic : Icons.mic_off,
                    color: micOn ? Colors.greenAccent : Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: openChat,
                  icon: const Icon(
                    Icons.chat_bubble,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: requestMic,
                  icon: Icon(
                    handRaised
                        ? Icons.pan_tool
                        : Icons.pan_tool_outlined,
                    color: handRaised ? Colors.amber : Colors.white,
                  ),
                ),
                const Spacer(),
                ElevatedButton.icon(
                  onPressed: openGifts,
                  icon: const Text('🎁'),
                  label: const Text('Gift'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
