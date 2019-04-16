-- scaffold geniefile for WHLSL

WHLSL_script = path.getabsolute(path.getdirectory(_SCRIPT))
WHLSL_root = path.join(WHLSL_script, "WHLSL")

WHLSL_includedirs = {
	path.join(WHLSL_script, "config"),
	WHLSL_root,
}

WHLSL_libdirs = {}
WHLSL_links = {}
WHLSL_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { WHLSL_includedirs }
	end,

	_add_defines = function()
		defines { WHLSL_defines }
	end,

	_add_libdirs = function()
		libdirs { WHLSL_libdirs }
	end,

	_add_external_links = function()
		links { WHLSL_links }
	end,

	_add_self_links = function()
		links { "WHLSL" }
	end,

	_create_projects = function()

project "WHLSL"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		WHLSL_includedirs,
	}

	defines {}

	files {
		path.join(WHLSL_script, "config", "**.h"),
		path.join(WHLSL_root, "**.h"),
		path.join(WHLSL_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
