//
//  hw5widget.swift
//  hw5widget
//
//  Created by Dmitry Rykov on 10.07.2022.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(configuration: ConfigurationIntent(), suffixes: [])
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(configuration: configuration, suffixes: loadSuffixes())
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let entries: [SimpleEntry] = [SimpleEntry(configuration: configuration, suffixes: loadSuffixes())]
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
    
    func loadSuffixes() -> [Suffix] {
        [Suffix(suffix: "abc", count: 1), Suffix(suffix: "def", count: 2)]
    }
}

struct SimpleEntry: TimelineEntry {
    
    let date: Date = .init()
    let configuration: ConfigurationIntent
    let suffixes: [Suffix]
}

struct hw5widgetEntryView : View {
    
    var entry: Provider.Entry

    var body: some View {
        VStack {
            ForEach(entry.suffixes, id: \.self) { suffix in
                HStack {
                    Text(suffix.suffix)
                    Spacer()
                    Text("\(suffix.count)")
                }
            }
            Spacer()
            HStack {
                
                Link(destination: URL(string: Tab.input.rawValue)!, label:{ Text("Input")})
                Link(destination: URL(string: Tab.stats.rawValue)!, label:{ Text("Stats")})
            }
        }
        .padding()
    }
}

@main
struct hw5widget: Widget {
    
    let kind: String = "hw5widget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            hw5widgetEntryView(entry: entry)
        }
        .configurationDisplayName("Stats widget")
        .description("Shows suffixes stats")
        .supportedFamilies([.systemMedium])
    }
}

struct hw5widget_Previews: PreviewProvider {
    
    static var previews: some View {
        hw5widgetEntryView(entry: SimpleEntry(configuration: ConfigurationIntent(), suffixes: []))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
