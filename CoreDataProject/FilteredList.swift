//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Md. Masud Rana on 2/14/23.
//

import CoreData
import SwiftUI

struct FilteredList<T: NSManagedObject, Content: View>: View {
    @FetchRequest var fetchRequest: FetchedResults<T>
    let content: (T) -> Content

    var body: some View {
        List(fetchRequest, id: \.self) { item in
            self.content(item)
        }
    }

    init(filerKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
        _fetchRequest = FetchRequest<T>(sortDescriptors: [], predicate: NSPredicate(
            format: "%K BEGINSWITH %@",
            filerKey,
            filterValue
        ))
        self.content = content
    }
}
