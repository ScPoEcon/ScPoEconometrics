
gitbook <- function(){
  bookdown::render_book('index.Rmd', 'bookdown::gitbook')
}

pdfbook <- function(){
  bookdown::render_book('index.Rmd', 'bookdown::pdf_book')
}

pasta_maker <- function(){
  pasta_jar <- tibble::tibble(id = 1:1980,color = sample(c(rep("Red",488),rep("Green",492),rep("White",1000)), size = 1980 ))
  usethis::use_data(pasta_jar,overwrite = TRUE)
  pasta_jar
}

pasta_image <- function(){
  data(pasta_jar)
  pasta_jar$cf = as.numeric(factor(pasta_jar$color))
  m = matrix(c(pasta_jar$cf),44,45)
  image(m,col = c("green","orange","white"),xaxt="n",yaxt = "n")
}
