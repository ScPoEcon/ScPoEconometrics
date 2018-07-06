app <- ShinyDriver$new("../")
app$snapshotInit("mytest")

app$snapshot()
app$setInputs(scale_x = -1.5)
app$setInputs(scale_y = -3)
app$setInputs(scale_x = 0)
app$snapshot()
