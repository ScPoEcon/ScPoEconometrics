app <- ShinyDriver$new("../")
app$snapshotInit("mytest")

# Input '`.clientValue-plotly_hover-A`' was set, but doesn't have an input binding.
app$snapshot(items=list(output=c("userguess_ssr","regPlot_ssr")))
app$setInputs(s_ssr = 1.5)
app$setInputs(s_ssr = 1.75)
app$setInputs(i_ssr = -1)
app$snapshot(items=list(output=c("userguess_ssr","regPlot_ssr")))
app$setInputs(i_ssr = -2.25)
app$setInputs(i_ssr = -2.75)
app$setInputs(s_ssr = 1.25)
app$snapshot(items=list(output=c("userguess_ssr","regPlot_ssr")))
