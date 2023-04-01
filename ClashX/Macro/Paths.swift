//
//  Paths.swift
//  ClashX
//
//  Created by CYC on 2018/8/26.
//  Copyright © 2018年 west2online. All rights reserved.
//
import Foundation

let kConfigFolderPath = "\(NSHomeDirectory())/.config/clash/"

let kDefaultConfigFilePath = "\(kConfigFolderPath)config.yaml"

let kDefauleMetaCoreName = "com.metacubex.ClashX.ProxyConfigHelper.meta"

struct Paths {
    static func localConfigPath(for name: String) -> String {
        return "\(kConfigFolderPath)\(configFileName(for: name))"
    }

    static func configFileName(for name: String) -> String {
        return "\(name).yaml"
    }

    static func defaultCorePath() -> URL? {
		Paths
			.applicationSupportDirectory()?
			.appendingPathComponent(".private_core")
			.appendingPathComponent(kDefauleMetaCoreName)
    }

    static func defaultCoreGzPath() -> String? {
		guard let path = Bundle.main.path(forResource: kDefauleMetaCoreName, ofType: "gz") else {
			return nil
		}
		return FileManager.default.fileExists(atPath: path) ? path : nil
    }

    static func alphaCorePath() -> URL? {
		Paths
			.applicationSupportDirectory()?
			.appendingPathComponent(kDefauleMetaCoreName)
    }

	static func applicationSupportDirectory() -> URL? {
		FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)
			.first?
			.appendingPathComponent("com.metacubex.ClashX.meta")
	}
	
	static func tempPath() -> String {
		NSTemporaryDirectory().appending("com.MetaCubeX.ClashX.meta")
	}
}
