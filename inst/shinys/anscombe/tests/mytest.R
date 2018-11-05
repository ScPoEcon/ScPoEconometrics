app <- ShinyDriver$new("../")
app$snapshotInit("mytest")

app$snapshot()
app$setInputs(addr = "1")
app$setInputs(addr = c("1", "2"))
app$setInputs(addr = c("1", "2", "4"))
app$setInputs(addr = c("1", "2", "3", "4"))
app$snapshot()
