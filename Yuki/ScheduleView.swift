import SwiftUI

struct ScheduleView: View {
    let artist: String

    // Next three days starting from today
    private var days: [Date] {
        let calendar = Calendar.current
        let start = calendar.startOfDay(for: Date())
        return (0..<3).compactMap { calendar.date(byAdding: .day, value: $0, to: start) }
    }

    @State private var selectedDay: Date = Calendar.current.startOfDay(for: Date())
    @State private var selectedTime: Date?
    @State private var showConfirmation: Bool = false

    private var columns: [GridItem] { Array(repeating: .init(.flexible()), count: 3) }

    private var dayFormatter: DateFormatter {
        let df = DateFormatter()
        df.dateFormat = "MMM d"
        return df
    }

    private var timeFormatter: DateFormatter {
        let df = DateFormatter()
        df.dateFormat = "h:mm a"
        return df
    }

    private func timeSlots(for day: Date) -> [Date] {
        let calendar = Calendar.current
        guard let start = calendar.date(bySettingHour: 9, minute: 0, second: 0, of: day) else { return [] }
        return (0...24).compactMap { calendar.date(byAdding: .minute, value: $0 * 30, to: start) }
    }

    private func confirmSelection() {
        showConfirmation = true
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Schedule with \(artist)")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 32)

                // Day selection
                HStack(spacing: 12) {
                    ForEach(days, id: \.self) { day in
                        Button(action: {
                            selectedDay = day
                            selectedTime = nil
                        }) {
                            Text(dayFormatter.string(from: day))
                                .foregroundColor(selectedDay == day ? .white : .primary)
                                .padding(8)
                                .frame(maxWidth: .infinity)
                                .background(selectedDay == day ? Color.brand : Color.gray.opacity(0.2))
                                .cornerRadius(8)
                        }
                    }
                }
                .padding(.horizontal)

                // Time slot selection
                LazyVGrid(columns: columns, spacing: 12) {
                    ForEach(timeSlots(for: selectedDay), id: \.self) { slot in
                        Button(action: {
                            selectedTime = slot
                            confirmSelection()
                        }) {
                            Text(timeFormatter.string(from: slot))
                                .frame(maxWidth: .infinity)
                                .padding(8)
                                .foregroundColor(selectedTime == slot ? .white : .primary)
                                .background(selectedTime == slot ? Color.brand : Color.gray.opacity(0.2))
                                .cornerRadius(8)
                        }
                    }
                }
                .padding(.horizontal)

                Spacer()
            }
        }
        .navigationTitle("Scheduling")
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $showConfirmation) {
            let time = selectedTime ?? Date()
            return Alert(
                title: Text("Time Selected"),
                message: Text("You chose \(dayFormatter.string(from: selectedDay)) at \(timeFormatter.string(from: time))"),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

#Preview {
    NavigationView {
        ScheduleView(artist: "Zulaa")
    }
}
