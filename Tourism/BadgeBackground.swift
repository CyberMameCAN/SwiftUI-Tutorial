//
//  Badge.swift
//  Tourism
//
//  Created by としや on 2021/08/18.
//

import SwiftUI

struct BadgeBackground: View {
    var body: some View {
        GeometryReader { geometry in // 画面全体を使って大きなサイズで描画したい時の構造体
            Path { path in
                
                var width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
                
                let xScale: CGFloat = 0.832
                let xOffset = (width * (1.0 - xScale)) / 2.0
                width *= xScale
                
                path.move(
                    to: CGPoint(
                        x: xOffset + width * 0.95,
                        y: height * (0.20 + HexagonParameters.adjustment)
                    )
                )
                
                HexagonParameters.points.forEach {
                    path.addLine(
                        to: .init(
                                                            // $0 forEachの引数
                            x: xOffset + width * $0.useWidth.0 * $0.xFactors.0,
                            y: height * $0.useHeight.0 * $0.yFactors.0
                        )
                    )
                    
                    path.addQuadCurve(
                        to: .init(
                            x: xOffset + width * $0.useWidth.1 * $0.xFactors.1,
                            y: height * $0.useHeight.1 * $0.yFactors.1
                        ),
                        control: .init(
                            x: xOffset + width * $0.useWidth.2 * $0.xFactors.2,
                            y: height * $0.useHeight.2 * $0.yFactors.2
                        )
                    )
                }
            }.fill(LinearGradient(
                    gradient: .init(colors: [Self.gradientStart, Self.gradientEnd]),
                    startPoint: .init(x: 0.5, y: 0),
                    endPoint: .init(x: 0.5, y: 0.6)
            ))
            // アスペクト比を横幅に合わせ、Viewにフィットするように設定
            .aspectRatio(1, contentMode: .fit)
        }

//        Path { path in
//            path.addRect(CGRect(
//                            x: 50,
//                            y: 50,
//                            width: 100,
//                            height: 200))
//        }
//        Path { path in
//            path.addLines([CGPoint(x: 100, y: 100),
//                           CGPoint(x: 200, y: 200),
//                           CGPoint(x: 200, y: 100),
//                           CGPoint(x: 100, y: 100),
//            ])
////        }.stroke() // 塗りつぶさない（線のみ）
//        }.fill(Color.green) // 塗りつぶさない（線のみ）
//        Path { path in
//            path.move(to: CGPoint(x: 100, y: 100))
//            path.addLine(to: CGPoint(x: 200, y: 200))
//
//            path.move(to: CGPoint(x: 300, y: 100))
//            path.addLine(to: CGPoint(x: 250, y: 200))
//
//            path.addQuadCurve(to: CGPoint(x: 200, y: 200),
//                              control: CGPoint(x: 230, y: 230))
//        }.stroke()
    }
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 121.0 / 255)
}

struct BadgeBackground_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackground()
    }
}
