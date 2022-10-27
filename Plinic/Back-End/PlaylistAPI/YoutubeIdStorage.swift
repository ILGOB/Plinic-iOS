//
//  YoutubeIdStorage.swift
//  Plinic
//
//  Created by Jaewon on 2022/10/27.
//

import Foundation

struct YoutubeIdStorage {
    static let ids: [String] = [
        "T6tTohWiu5A",
        "3YHGEuefsbI",
        "btGlnFgCVX8",
        "ee2mcqcGL_c",
        "u-YGV5xt-jk",
        "js1CtxSY38I",
        "C_cpDd0WYTk",
        "_JNgoVcNxig",
        "xqnWLDkjjwc",
        "VQZXXciZb_c",
        "8IJzYAda1wA",
        "ZEcqHA7dbwM",
        "gv4_wIybG6A",
        "6POZlJAZsok",
        "UZWmtxLiiFE",
        "m45DTO8sKcE",
        "lwk5OUII9Vc",
        "hQGcmVGt0cc",
        "XZ868t23Pb4",
        "Wc5IbN4xw70",
        "cPAbx5kgCJo"
    ]
    
    static var randomIds: String {
        self.ids.randomElement() ?? "XZ868t23Pb4"
    }
}
