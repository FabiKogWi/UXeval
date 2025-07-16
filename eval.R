setwd("C:/Users/User/Desktop/Code/UXeval")
eval_dat <- read.csv("Evaluation.csv")
eval_dat

# Age
max_age <- max(eval_dat$Q13_Age) # 26
min_age <- min(eval_dat$Q13_Age) # 22.125
mean_age <- mean(eval_dat$Q13_Age) # 20
max_age
min_age
mean_age

# Gender
genders <- table(eval_dat$Q12_Gender)
genders
# Weiblich: Männlich: Divers:
# 4         3         1 

education <- table(eval_dat$Q14_Bildung)
education
# Abitur:
# 5

# SUS-Fragebogen

q1 <- eval_dat$Q03_System.Usability.Scale..Ich.kann.mir.sehr.gut.vorstellen..die.App.regelmäßig.zu.nutzen. - 1
q3 <- eval_dat$Q03_System.Usability.Scale..Ich.empfinde.die.App.als.einfach.zu.nutzen. - 1
q5 <- eval_dat$Q03_System.Usability.Scale..Ich.finde..dass.die.verschiedenen.Funktionen.der.App.gut.integriert.sind. - 1
q7 <- eval_dat$Q03_System.Usability.Scale..Ich.kann.mir.vorstellen..dass.die.meisten.Leute.die.App.schnell.zu.beherrschen.lernen. - 1
q9 <- eval_dat$Q03_System.Usability.Scale..Ich.habe.mich.bei.der.Nutzung.der.App.sehr.sicher.gefühlt. - 1

q2 <- 5 - eval_dat$Q03_System.Usability.Scale..Ich.empfinde.die.App.als.unnötig.komplex.
q4 <- 5 - eval_dat$Q03_System.Usability.Scale..Ich.denke..dass.ich.technischen.Support.brauchen.würde..um.die.App.zu.nutzen.
q6 <- 5 - eval_dat$Q03_System.Usability.Scale..Ich.finde..dass.es.in.der.App.zu.viele.Inkonsistenzen.gibt.
q8 <- 5 - eval_dat$Q03_System.Usability.Scale..Ich.empfinde.die.Bedienung.als.sehr.umständlich.
q10 <- 5 - eval_dat$Q03_System.Usability.Scale..Ich.musste.eine.Menge.Dinge.lernen..bevor.ich.mit.der.App.arbeiten.konnte.


sus_scores <- 2.5 * (q1 + q2 + q3 + q4 + q5 + q6 + q7 + q8 + q9 + q10)

sus_mean <- mean(sus_scores)
sus_mean
sus_sd <- sd(sus_scores)
sus_sd

df <- data.frame(value = sus_scores)

library(ggplot2)

ggplot(df, aes(x = "", y = value)) + 
  geom_violin(fill = "skyblue", color = "black") + 
  geom_pointrange(aes( y = sus_mean, ymin = sus_mean - sus_sd, ymax = sus_mean + sus_sd),
                  color = "red", size = 1.2) + 
  geom_hline(yintercept = sus_mean, color = "black", linetype = "dotted", linewidth = 1) +
  labs(title = "Violin Plot of My Vector", 
       y = "Value") + 
  theme_minimal()

# Funktionsumfangsfragen

f6 <- eval_dat$Q06_Funktionsumfang.vermisst..Funktionsumfang
f6_mean <- mean(f6)
f6_mean # 2.375


f8 <- eval_dat$Q08..Funktionsumfang
f8_mean <- mean(f8)
f8_mean # 1.25

f6_sd <- sd(f6)
f8_sd <- sd(f8)


ggplot(data.frame(value = f6), aes(x = "", y = value)) + 
  geom_violin(fill = "skyblue", color = "black") + 
  geom_pointrange(aes( y = f6_mean, ymin = f6_mean - f6_sd, ymax = f6_mean + f6_sd),
                  color = "red", size = 1.2) + 
  geom_hline(yintercept = f6_mean, color = "black", linetype = "dotted", linewidth = 1) +
  labs(title = "Violin Plot of Funktionsumfang vermisst", 
       y = "Value") + 
  theme_minimal()

ggplot(data.frame(value = f8), aes(x = "", y = value)) + 
  geom_violin(fill = "skyblue", color = "black") + 
  geom_pointrange(aes( y = f8_mean, ymin = f8_mean - f8_sd, ymax = f8_mean + f8_sd),
                  color = "red", size = 1.2) + 
  geom_hline(yintercept = f8_mean, color = "black", linetype = "dotted", linewidth = 1) +
  labs(title = "Violin Plot of Funktionsumfang", 
       y = "Value") + 
  theme_minimal()




