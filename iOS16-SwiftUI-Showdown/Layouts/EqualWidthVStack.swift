//
//  EqualWidthVStack.swift
//  iOS16-SwiftUI-Showdown
//
//  Created by Łukasz Stachnik on 14/09/2022.
//

import SwiftUI

struct EqualWidthVStack: Layout {
    
    func sizeThatFits(proposal: ProposedViewSize, // size proposal for layouts container view
                      subviews: Subviews,
                      cache: inout ()) -> CGSize {
        // Return a size
        let maxSize = maxSize(subviews: subviews)
        let spacing = spacing(subviews: subviews)
        let totalSpacing = spacing.reduce(.zero) { $0 + $1 }
        
        return CGSize(width: maxSize.width, // this is the ideal size the layout needs to layout all views in the largest view width with spacings
                      height: maxSize.height * CGFloat(subviews.count) + totalSpacing)
    }
    
    func placeSubviews(in bounds: CGRect,
                       proposal: ProposedViewSize,
                       subviews: Subviews,
                       cache: inout ()) {
        // Place a child views
        let maxSize = maxSize(subviews: subviews)
        let spacing = spacing(subviews: subviews)
        
        let sizeProposal = ProposedViewSize(width: maxSize.width,
                                            height: maxSize.height)
        var y = bounds.minY + maxSize.height / 2
        
        for index in subviews.indices {
            subviews[index].place(
                at: CGPoint(x: bounds.midX, y: y),
                anchor: .center,
                proposal: sizeProposal)
            y += maxSize.height + spacing[index]
        }
    }
    
    private func maxSize(subviews: Subviews) -> CGSize {
        let subviewsSizes = subviews.map { $0.sizeThatFits(.unspecified) } // get me an ideal size
        return subviewsSizes.reduce(.zero) { currentMax, subviewSize in
            CGSize(width: max(currentMax.width, subviewSize.width), // compare every subview size width in the array with currentMax (0 when starting)
                   height: max(currentMax.height, subviewSize.height)) // compare every subview size height in the array with currentMax (0 when starting)
        }
    }
    
    private func spacing(subviews: Subviews) -> [CGFloat] {
        return subviews.indices.map { index in
            guard index < subviews.count - 1 else { return 0 } // force the last spacing to be 0 while there is nothing more to compare against
            return subviews[index].spacing.distance(to: subviews[index + 1].spacing, // get spacing to next subview on the horizontal axis
                                             along: .vertical)
        }
    }
}
