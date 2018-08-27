app <- ShinyDriver$new("../")
app$snapshotInit("mytest")

app$snapshot()
app$setInputs(scale_x = 2)
app$snapshot()
app$setInputs(scale_y = 2)
app$setInputs(scale_x = 1)
