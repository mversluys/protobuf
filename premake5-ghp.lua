
local function common_setup()

	includedirs { 'src' }

	filter 'system:not windows'
		defines { 'HAVE_PTHREAD' }

	filter { 'system:windows' }
	
		disablewarnings { 
			'4018', -- warning C4018: '<': signed/unsigned mismatch
			'4146', -- warning C4146: unary minus operator applied to unsigned type, result still unsigned
			'4244', -- warning C4244: '=': conversion from 'X' to 'Y', possible loss of data
			'4305', -- warning C4305: 'initializing': truncation from 'X' to 'Y'
			'4456', -- warning C4456: declaration of 'X' hides previous local declaration
			'4506', -- warning C4506: no definition for inline function 'X'
			'4715', -- warning C4715: 'X': not all control paths return a value
			'4800', -- warning C4800: 'X': forcing value to bool 'true' or 'false' (performance warning)
			'4996', -- warning C4996: 'X': The POSIX name for this item is deprecated. Instead, use the ISO C and C++ conformant name: _X. See online help for details.
		}
		linkoptions {
			'/ignore:4221', -- warning LNK4221: This object file does not define any previously undefined public symbols, so it will not be used by any link operation that consumes this library
		}
		defines { '_CRT_SECURE_NO_WARNINGS' }

	filter { }

end

lib_lite_files = { 
	'src/google/protobuf/stubs/atomicops_internals_x86_gcc.cc',
	'src/google/protobuf/stubs/atomicops_internals_x86_msvc.cc',
	'src/google/protobuf/stubs/common.cc',
	'src/google/protobuf/stubs/once.cc',
	'src/google/protobuf/stubs/hash.h',
	'src/google/protobuf/stubs/map_util.h',
	'src/google/protobuf/stubs/shared_ptr.h',
	'src/google/protobuf/stubs/stringprintf.cc',
	'src/google/protobuf/stubs/stringprintf.h',
	'src/google/protobuf/extension_set.cc',
	'src/google/protobuf/generated_message_util.cc',
	'src/google/protobuf/message_lite.cc',
	'src/google/protobuf/repeated_field.cc',
	'src/google/protobuf/wire_format_lite.cc',
	'src/google/protobuf/io/coded_stream.cc',
	'src/google/protobuf/io/coded_stream_inl.h',
	'src/google/protobuf/io/zero_copy_stream.cc',
	'src/google/protobuf/io/zero_copy_stream_impl_lite.cc',
}

project 'google-protobuf-lite'
	kind 'StaticLib'
	common_setup()
	files(lib_lite_files)

project 'google-protobuf'
	kind 'StaticLib'
	common_setup()
	files(lib_lite_files)
	files {
		'src/google/protobuf/stubs/strutil.cc',
		'src/google/protobuf/stubs/strutil.h',
		'src/google/protobuf/stubs/substitute.cc',
		'src/google/protobuf/stubs/substitute.h',
		'src/google/protobuf/stubs/structurally_valid.cc',
		'src/google/protobuf/descriptor.cc',
		'src/google/protobuf/descriptor.pb.cc',
		'src/google/protobuf/descriptor_database.cc',
		'src/google/protobuf/dynamic_message.cc',
		'src/google/protobuf/extension_set_heavy.cc',
		'src/google/protobuf/generated_message_reflection.cc',
		'src/google/protobuf/message.cc',
		'src/google/protobuf/reflection_ops.cc',
		'src/google/protobuf/service.cc',
		'src/google/protobuf/text_format.cc',
		'src/google/protobuf/unknown_field_set.cc',
		'src/google/protobuf/wire_format.cc',
		'src/google/protobuf/io/gzip_stream.cc',
		'src/google/protobuf/io/printer.cc',
		'src/google/protobuf/io/strtod.cc',
		'src/google/protobuf/io/tokenizer.cc',
		'src/google/protobuf/io/zero_copy_stream_impl.cc',
		'src/google/protobuf/compiler/importer.cc',
		'src/google/protobuf/compiler/parser.cc',
	}

project 'google-protoc'
	kind 'ConsoleApp'
	common_setup()
	files {
		'src/google/protobuf/compiler/code_generator.cc',
		'src/google/protobuf/compiler/command_line_interface.cc',
		'src/google/protobuf/compiler/plugin.cc',
		'src/google/protobuf/compiler/plugin.pb.cc',
		'src/google/protobuf/compiler/subprocess.cc',
		'src/google/protobuf/compiler/subprocess.h',
		'src/google/protobuf/compiler/zip_writer.cc',
		'src/google/protobuf/compiler/zip_writer.h',
		'src/google/protobuf/compiler/cpp/cpp_enum.cc',
		'src/google/protobuf/compiler/cpp/cpp_enum.h',
		'src/google/protobuf/compiler/cpp/cpp_enum_field.cc',
		'src/google/protobuf/compiler/cpp/cpp_enum_field.h',
		'src/google/protobuf/compiler/cpp/cpp_extension.cc',
		'src/google/protobuf/compiler/cpp/cpp_extension.h',
		'src/google/protobuf/compiler/cpp/cpp_field.cc',
		'src/google/protobuf/compiler/cpp/cpp_field.h',
		'src/google/protobuf/compiler/cpp/cpp_file.cc',
		'src/google/protobuf/compiler/cpp/cpp_file.h',
		'src/google/protobuf/compiler/cpp/cpp_generator.cc',
		'src/google/protobuf/compiler/cpp/cpp_helpers.cc',
		'src/google/protobuf/compiler/cpp/cpp_helpers.h',
		'src/google/protobuf/compiler/cpp/cpp_message.cc',
		'src/google/protobuf/compiler/cpp/cpp_message.h',
		'src/google/protobuf/compiler/cpp/cpp_message_field.cc',
		'src/google/protobuf/compiler/cpp/cpp_message_field.h',
		'src/google/protobuf/compiler/cpp/cpp_options.h',
		'src/google/protobuf/compiler/cpp/cpp_primitive_field.cc',
		'src/google/protobuf/compiler/cpp/cpp_primitive_field.h',
		'src/google/protobuf/compiler/cpp/cpp_service.cc',
		'src/google/protobuf/compiler/cpp/cpp_service.h',
		'src/google/protobuf/compiler/cpp/cpp_string_field.cc',
		'src/google/protobuf/compiler/cpp/cpp_string_field.h',
		'src/google/protobuf/compiler/java/java_context.cc',
		'src/google/protobuf/compiler/java/java_context.h',
		'src/google/protobuf/compiler/java/java_enum.cc',
		'src/google/protobuf/compiler/java/java_enum.h',
		'src/google/protobuf/compiler/java/java_enum_field.cc',
		'src/google/protobuf/compiler/java/java_enum_field.h',
		'src/google/protobuf/compiler/java/java_extension.cc',
		'src/google/protobuf/compiler/java/java_extension.h',
		'src/google/protobuf/compiler/java/java_field.cc',
		'src/google/protobuf/compiler/java/java_field.h',
		'src/google/protobuf/compiler/java/java_file.cc',
		'src/google/protobuf/compiler/java/java_file.h',
		'src/google/protobuf/compiler/java/java_generator.cc',
		'src/google/protobuf/compiler/java/java_generator_factory.cc',
		'src/google/protobuf/compiler/java/java_generator_factory.h',
		'src/google/protobuf/compiler/java/java_helpers.cc',
		'src/google/protobuf/compiler/java/java_helpers.h',
		'src/google/protobuf/compiler/java/java_lazy_message_field.cc',
		'src/google/protobuf/compiler/java/java_lazy_message_field.h',
		'src/google/protobuf/compiler/java/java_message.cc',
		'src/google/protobuf/compiler/java/java_message.h',
		'src/google/protobuf/compiler/java/java_message_field.cc',
		'src/google/protobuf/compiler/java/java_message_field.h',
		'src/google/protobuf/compiler/java/java_name_resolver.cc',
		'src/google/protobuf/compiler/java/java_name_resolver.h',
		'src/google/protobuf/compiler/java/java_primitive_field.cc',
		'src/google/protobuf/compiler/java/java_primitive_field.h',
		'src/google/protobuf/compiler/java/java_shared_code_generator.cc',
		'src/google/protobuf/compiler/java/java_shared_code_generator.h',
		'src/google/protobuf/compiler/java/java_service.cc',
		'src/google/protobuf/compiler/java/java_service.h',
		'src/google/protobuf/compiler/java/java_string_field.cc',
		'src/google/protobuf/compiler/java/java_string_field.h',
		'src/google/protobuf/compiler/java/java_doc_comment.cc',
		'src/google/protobuf/compiler/java/java_doc_comment.h',
		'src/google/protobuf/compiler/python/python_generator.cc',
	}
	files {
		'src/google/protobuf/compiler/main.cc',
	}
	links { 'google-protobuf' }


ghp.export_includedirs('src')

ghp.export_project('google-protobuf-lite', 'lib-lite')
ghp.export_project('google-protobuf', 'lib')
ghp.export_project('google-protoc', 'compiler')
