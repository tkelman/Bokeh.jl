module Bokeh
	include("plot.jl")
	# displays indented JSON, uses unminified js and saves the raw JSON to "bokeh_models.json" if true
	DEBUG = false
	debug(b::Bool) = (global DEBUG = b)
	# whether or not to show the plot immediately after `plot`
	AUTOOPEN = true
	autoopen(b::Bool) = (global AUTOOPEN = b)
	# default width of plot
	WIDTH = 800
	width(w::Int) = (global WIDTH = w)
	# default height of plot
	HEIGHT = 600
	height(h::Int) = (global HEIGHT = h)
	# default glyph type
	DEFAULT_GLYPHS_STR = "b|r|g|k|y|c|m|b--|r--|g--|k--|y--|c--|m--|--"
	DEFAULT_GLYPHS = convert(Vector{Glyph}, DEFAULT_GLYPHS_STR)
	default_glyphs(gs::Vector{Glyph}) = (global DEFAULT_GLYPHS = gs)
	default_glyphs(s::String) = (global DEFAULT_GLYPHS = convert(Vector{Glyph},s))
	default_glyphs() = DEFAULT_GLYPHS
	# default filename 
	FILENAME = "bokeh_plot.html"
	filename(fn::String) = (global FILENAME = fn)
	# default plot title
	TITLE = "Bokeh Plot"
	title(t::String) = (global TITLE = t)
	# number of points at which to evaluate functions
	COUNTEVAL = 500
	counteval(count::Int) = (global COUNTEVAL = count)

	export plot,
		   Glyphs,
		   Glyph,
		   Plot,
		   DataColumn, 
		   debug, 
		   autoopen, 
		   width,
		   height,
		   default_glyphs,
		   filename,
		   title
end