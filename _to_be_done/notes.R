


data("STAR",package = "AER")
x = as.data.table(STAR)

mx = melt.data.table(x, id = 1:3, measure.vars = patterns("star*"), variable.name = "grade", value.name = "classtype")
# mx[, grade := as.character(grade)]
ms = melt.data.table(x, id = 1:3, measure.vars = patterns("read*","math*", "schoolid*", "degree*","experience*","tethnicity*"), variable.name = "grade", value.name = c("read","math","schoolid","degree","experience","tethniticy"))

mx = cbind(mx,ms[,-c(1:4)])
mx = mx[complete.cases(mx)]

setkey(mx, classtype)
ecdfs = mx[classtype != "small", list(readcdf = list(ecdf(read)),mathcdf = list(ecdf(math))),by = grade]

om = par("mar")
par(mfcol=c(4,2),mar = c(2,om[2],2.5,om[4]))
ecdfs[,.SD[,plot(mathcdf[[1]],main = paste("math ecdf grade",.BY))],by = grade]
ecdfs[,.SD[,plot(readcdf[[1]],main = paste("read ecdf grade",.BY))],by = grade]
par(mfcol=c(1,1),mar = om)

setkey(ecdfs, grade)
setkey(mx,grade)

z=mx[,list(perc_read = ecdfs[(.BY),readcdf][[1]](read),perc_math = ecdfs[(.BY),mathcdf][[1]](math)),by=grade]
z[,score := rowMeans(.SD), .SDcols = c("perc_read","perc_math")]

mx = cbind(mx,z[,!"grade"])

ggplot(data = z, mapping = aes(x = score,color=classtype)) + geom_density() + facet_wrap(~grade)

summary(lm(score ~ classtype + schoolid,mx[grade == "stark"]))


ggplot(aes(x = x, y = y, xend = xend, yend = yend)) +
  geom_dag_point() +
  geom_dag_edges_diagonal() +
  geom_dag_text() +
  theme_dag()


dagify(y ~ x,
       x ~ z,
       y ~ z) %>%
  tidy_dagitty(layout = "tree") %>%
  ggplot(aes(x = x, y = y, xend = xend, yend = yend)) +
  geom_dag_point() +
  geom_dag_edges_diagonal() +
  geom_dag_text() +
  theme_dag() + scale_adjus

d = dagify(y ~ x,
           x ~ z,
           y ~ z) %>%
  tidy_dagitty(layout = "tree")

p1 = d %>%
  filter(name == "z") %>%
  ggplot(aes(x = x, y = y, xend = xend, yend = yend)) +
  geom_dag_point() +
  geom_dag_edges(edge_linetype = "dashed") +
  geom_dag_text() +
  theme_dag()

d2 = d %>%
  filter(name != "z") %>%
  ggdag()

p1 + geom_dag_point(data = d2)




# bootstrap from ungeviz repo

library(gganimate)
set.seed(69527)
x <- rnorm(15)
data <- data.frame(
x,
y = x + 0.5*rnorm(15)
)
bs <- bootstrapper(9)
library(ungeviz)
bs <- bootstrapper(9)
bs
p <- ggplot(data, aes(x, y)) +
geom_point(shape = 21, size = 6, fill = "white") +
geom_text(label = "0", hjust = 0.5, vjust = 0.5, size = 10/.pt) +
geom_point(data = bs, aes(group = .row), shape = 21, size = 6, fill = "blue") +
geom_text(
data = bs, aes(label = .copies, group = .row),
hjust = 0.5, vjust = 0.5, size = 10/.pt, color = "white"
) +
geom_smooth(data = bs, method = "lm", se = FALSE) +
ggtitle("Bootstrap demonstration") +
theme_bw()
p + facet_wrap(~.draw)
p + transition_states(.draw, 1, 1) +
enter_fade() + exit_fade()


# and groups by variable `KnownSex`
bsr <- bootstrapper(20, KnownSex)

ggplot(BlueJays, aes(BillLength, Head, color = KnownSex)) +
  geom_smooth(method = "lm", color = NA) +
  geom_point(alpha = 0.3) +
  # `.row` is a generated column providing a unique row number for all rows
  geom_point(data = bsr, aes(group = .row)) +
  geom_smooth(data = bsr, method = "lm", fullrange = TRUE, se = FALSE) +
  facet_wrap(~KnownSex, scales = "free_x") +
  scale_color_manual(values = c(F = "#D55E00", M = "#0072B2"), guide = "none") +
  theme_bw() +
  transition_states(.draw, 1, 1) +
  enter_fade() + exit_fade()

data("wage1", package = "wooldridge")
wage1$female = factor(wage1$female, labels = c("male","female"))
bs <- bootstrapper(20, female)

anim <- ggplot(wage1, aes(x = educ, y = lwage, color = female)) +
  geom_smooth(method = "lm", color = NA) +
  geom_point(alpha = 0.3) +
  # `.row` is a generated column providing a unique row number for all rows
  geom_point(data = bs, aes(group = .row)) +
  geom_smooth(data = bs, method = "lm", fullrange = TRUE, se = FALSE) +
  facet_wrap(~female, scales = "free_x") +
  scale_color_manual(values = c("male" = "#D55E00", "female" = "#0072B2"), guide = "none") +
  theme_bw() +
  transition_states(.draw, 1, 1) +
  enter_fade() + exit_fade()

animate(anim, renderer = gifski_renderer())
