import SwiftUI

struct ContentView: View {
    @State private var date: Date = .now
    @State private var dateStyle: DateFormatter.Style = .short
    @State private var timeStyle: DateFormatter.Style = .short
    @State private var dateFormat: String = ""
    @State private var amSymbol: String = ""
    @State private var pmSymbol: String = ""
    @State private var localeIdentifier: String = Locale.current.identifier

    private var formatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = dateStyle
        formatter.timeStyle = timeStyle
        if !dateFormat.isEmpty {
            formatter.dateFormat = dateFormat
        }
        if !amSymbol.isEmpty {
            formatter.amSymbol = amSymbol
        }
        if !pmSymbol.isEmpty {
            formatter.pmSymbol = pmSymbol
        }
        formatter.locale = localeIdentifier.isEmpty ? .current : .init(identifier: localeIdentifier)
        return formatter
    }

    var body: some View {
        ScrollView {
            VStack {
                dateSelector
                formatterOptions
                result
            }
            .padding()
        }
    }

    var dateSelector: some View {
        Group {
            Text("Date:")
                .font(.title2.bold())
            DatePicker("", selection: $date)
                .datePickerStyle(.compact)
                .labelsHidden()
        }
    }

    var formatterOptions: some View {
        Group {
            Text("Date Formatter options:")
                .font(.title2.bold())

            HStack {
                Text("Date style:")
                Picker("", selection: $dateStyle) {
                    ForEach(DateFormatter.Style.allCases, id: \.self) { source in
                        Text(source.description)
                    }
                }.pickerStyle(.segmented)
            }

            HStack {
                Text("Time style:")
                Picker("", selection: $timeStyle) {
                    ForEach(DateFormatter.Style.allCases, id: \.self) { source in
                        Text(source.description)
                    }
                }.pickerStyle(.segmented)
            }

            HStack {
                Text("Date format:")
                TextField("i.e: EEE, YYYY, MM, DD, hh:ss a", text: $dateFormat)
                    .textFieldStyle(.roundedBorder)
                    .autocorrectionDisabled()
            }

            HStack {
                Text("AM symbol:")
                TextField("am", text: $amSymbol)
                    .textFieldStyle(.roundedBorder)
                    .autocorrectionDisabled()
            }

            HStack {
                Text("PM symbol:")
                TextField("pm", text: $pmSymbol)
                    .textFieldStyle(.roundedBorder)
                    .autocorrectionDisabled()
            }

            HStack {
                Text("Locale identifier:")
                TextField("en_US", text: $localeIdentifier)
                    .textFieldStyle(.roundedBorder)
                    .autocorrectionDisabled()
            }
        }
    }

    var result: some View {
        VStack {
            Text("Result:")
                .font(.title.bold())
            Text(formatter.string(from: date))
                .font(.title3)
        }
        .padding()
        .background(.teal)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

extension DateFormatter.Style {
    var description: String {
        switch self {
        case .none:
            return "None"
        case .short:
            return "Short"
        case .medium:
            return "Medium"
        case .long:
            return "Long"
        case .full:
            return "Full"
        default:
            return "Unknown"
        }
    }

    static var allCases: [DateFormatter.Style] = [.none, .short, .medium, .long, .full]
}
