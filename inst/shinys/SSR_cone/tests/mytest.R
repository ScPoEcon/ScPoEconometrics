app <- ShinyDriver$new("../")
app$snapshotInit("mytest")

# Input '`.clientValue-plotly_hover-A`' was set, but doesn't have an input binding.
app$snapshot(list(output = "regPlot_ssr"))
app$setInputs(s_ssr = 1)
app$setInputs(i_ssr = -2)
app$setInputs(i_ssr = 0.5)
app$setInputs(s_ssr = 0.25)
app$setInputs(s_ssr = -2.25)
app$setInputs(s_ssr = 2.75)

