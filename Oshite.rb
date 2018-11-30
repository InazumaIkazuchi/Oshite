require 'ffi'

module Oshite
	extend FFI::Library
	ffi_lib 'user32'
	ffi_convention :stdcall
	attach_function :keybd_event, [ :uchar, :uchar, :int, :pointer ], :void

	# key = keycode of the button
	def Oshite::down(key)
		keybd_event(key, 0, 0, nil);
	end
  
	def Oshite::up(key)
		keybd_event(key, 0, 2, nil);
	end

	def Oshite::press(key)
		Oshite::down(key);
		Oshite::up(key);
	end
end
