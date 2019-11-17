



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
