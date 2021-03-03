//
//  DatePicker.swift
//  SwiftUIExamples
//
//  Created by Cedric Bahirwe on 9/4/20.
//  Copyright © 2020 Cedric Bahirwe. All rights reserved.
//

import SwiftUI


struct DatePickerView: View {
    @State var showCalendar = false
    
    @State var today = Date()
    var images = [ "thai-red-curry-thumb", "thai-red-curry-thumb",  "mushroom-tagliatelle-thumb"]
    
    var body: some View {
        VStack {
            CalendarView(selectedDate: $today, closeView: $showCalendar, baseDate: Date(), selectedDateChanged: {
                date in
                today = date
                print(today)
            })
        }
    }
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView()
    }
}
