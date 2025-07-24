import SwiftUI

struct ScheduleView: View {
    let artist: String
    @State private var appointmentDate = Date()

    var body: some View {
        VStack(spacing: 20) {
            Text("Schedule with \(artist)")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 32)

            DatePicker("Select time", selection: $appointmentDate, displayedComponents: [.date, .hourAndMinute])
                .datePickerStyle(.graphical)
                .padding()

            Spacer()
        }
        .navigationTitle("Scheduling")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        ScheduleView(artist: "Zulaa")
    }
}
