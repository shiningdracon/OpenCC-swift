import COpenCC

public final class OpenCC {
	var ptr: opencc_t?
	public init?(configFile: String) {
		configFile.withCString { p in
			let errVal: opencc_t = UnsafeMutableRawPointer(bitPattern: -1)!
			self.ptr = opencc_open(p)
			if self.ptr == errVal {
				self.ptr = nil
			}
		}
		if self.ptr == nil {
			return nil
		}
	}
	deinit {
		if self.ptr != nil {
			opencc_close(self.ptr!)
			self.ptr = nil
		}
	}

	public func convert(_ input: String) -> String? {
		var ret: String? = nil
		if self.ptr != nil {
			input.withCString { p in
				if let _output: UnsafeMutablePointer<CChar> = opencc_convert_utf8(self.ptr!, p, Int(strlen(p))) {
					if let output = String.init(validatingUTF8: _output) {
						ret = output
					}
					opencc_convert_utf8_free(_output)
				}
			}
		}
		return ret
	}
}

