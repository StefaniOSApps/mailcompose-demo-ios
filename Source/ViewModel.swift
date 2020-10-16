//
//  ViewModel.swift
//  wkwebview-demo-ios
//
//  Created by Stefan Nebel on 16.10.20.
//

import Foundation

struct ViewModel {

  let htmlText: String

  static var `default`: ViewModel {
    return .init(htmlText: """
    <h4 class=\"red-text\">Heading</h4><p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>
    """
    )
  }

  init(htmlText: String) {
    self.htmlText = htmlText
  }
}
