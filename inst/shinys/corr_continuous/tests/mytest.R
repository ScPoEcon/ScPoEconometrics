app <- ShinyDriver$new("../")
app$snapshotInit("mytest")

app$snapshot()
app$setInputs(c = -0.55)
app$setInputs(c = -0.2)
app$setInputs(c = 0.5)
app$setInputs(c = 1)
app$setInputs(c = -1)
