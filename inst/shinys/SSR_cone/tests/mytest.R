app <- ShinyDriver$new("../")
app$snapshotInit("mytest")

# Input '`.clientValue-plotly_hover-A`' was set, but doesn't have an input binding.
app$snapshot()
app$setInputs(i_ssr = -2.75)
app$setInputs(s_ssr = 1.25)
app$setInputs(s_ssr = 1)
app$setInputs(i_ssr = -1.25)
app$setInputs(i_ssr = -1)
app$setInputs(s_ssr = 1.25)
app$snapshot()
