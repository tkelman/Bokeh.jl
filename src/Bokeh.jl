module Bokeh
	include("bokehjs.jl")
	include("objects.jl")
	include("display.jl")
	include("generate.jl")
	include("plot.jl")
	import Base: display

	# displays indented JSON, uses unminified js and saves the raw JSON to "bokeh_models.json" if true
	DEBUG = false
	debug(b::Bool) = (global DEBUG = b)
	debug() = DEBUG

	# whether or not to show the plot immediately after `plot`
	AUTOOPEN = true
	autoopen(b::Bool) = (global AUTOOPEN = b)
	autoopen() = AUTOOPEN

	# default width of plot
	WIDTH = 800
	width(w::Int) = (global WIDTH = w)
	width() = WIDTH
	# default height of plot
	HEIGHT = 600
	height(h::Int) = (global HEIGHT = h)
	height() = HEIGHT

	# default glyph type
	DEFAULT_GLYPHS_STR = "b|r|g|k|y|c|m|b--|r--|g--|k--|y--|c--|m--|--"
	DEFAULT_GLYPHS = convert(Vector{Glyph}, DEFAULT_GLYPHS_STR)
	glyphs(gs::Vector{Glyph}) = (global DEFAULT_GLYPHS = gs)
	glyphs(s::String) = (global DEFAULT_GLYPHS = convert(Vector{Glyph},s))
	glyphs() = DEFAULT_GLYPHS
	# default glyph size
	DEFAULT_SIZE = 8
	glyphsize(gs::Int) = (global DEFAULT_SIZE = gs)
	glyphsize() = DEFAULT_SIZE
	# default alpha value for filled glyphs
	DEFAULT_FILL_ALPHA = 0.7

	# default filename 
	FILENAME = "bokeh_plot.html"
	warn_overwrite() = ispath(FILENAME) && isinteractive() && !isdefined(Main, :IJulia) && warn(
	"$FILENAME already exists, it will be overwritten when a plot is generated.\nChange the output file with plotfile(<new file name>)")
	warn_overwrite()
	function plotfile(fn::String) 
		global FILENAME = fn
		warn_overwrite()
		nothing
	end
	plotfile() = FILENAME
	
	# default plot title
	TITLE = "Bokeh Plot"
	title(t::String) = (global TITLE = t)
	title() = TITLE

	# number of points at which to evaluate functions
	COUNTEVAL = 500
	counteval(count::Int) = (global COUNTEVAL = count)
	counteval() = COUNTEVAL

	# hold on to plots
	HOLD = false
	function hold(h::Bool)
		if !h
			global CURPLOT = nothing
		end
		global HOLD = h
	end
	hold() = hold(!HOLD)

	# current plot object
	CURPLOT = nothing
	curplot(cp::Plot) = (global CURPLOT = cp)
	curplot() = CURPLOT

	# tools to add to display
	TOOLS = [:pan, :wheelzoom, :boxzoom, :resize, :reset]
	tools(t::Vector{Symbol}) = (global TOOLS = t)
	tools() = TOOLS

	export plot,
		   setupnotebook,
		   Glyphs,
		   Glyph,
		   Plot,
		   DataColumn,
		   showplot,
		   debug, 
		   autoopen, 
		   width,
		   height,
		   glyphs,
		   glyphsize,
		   plotfile,
		   title,
		   counteval,
		   hold,
		   curplot,
		   tools
end