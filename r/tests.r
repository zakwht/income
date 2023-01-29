income <- read.csv(file = './data/data.csv')
income
#                         name female  male     ratio
# 1  Newfoundland and Labrador  25314 40880 1.6149166
# 2       Prince Edward Island  28065 36021 1.2834848
# 3                Nova Scotia  26750 38379 1.4347290
# 4              New Brunswick  25796 37516 1.4543340
# 5                     Quebec  28522 37842 1.3267653
# 6                    Ontario  28676 39889 1.3910239
# 7                   Manitoba  29220 40379 1.3818960
# 8               Saskatchewan  31978 46117 1.4421477
# 9                    Alberta  33213 54891 1.6526962
# 10          British Columbia  27543 40370 1.4657082
# 11                     Yukon  43192 48685 1.1271763
# 12     Northwest Territories  46322 54924 1.1857001
# 13                   Nunavut  30326 28817 0.9502407
summary(income)
#      name               female           male           ratio       
#  Length:13          Min.   :25314   Min.   :28817   Min.   :0.9502  
#  Class :character   1st Qu.:27543   1st Qu.:37842   1st Qu.:1.2835  
#  Mode  :character   Median :28676   Median :40370   Median :1.3910  
#                     Mean   :31147   Mean   :41901   Mean   :1.3624  
#                     3rd Qu.:31978   3rd Qu.:46117   3rd Qu.:1.4543  
#                     Max.   :46322   Max.   :54924   Max.   :1.6527  


#====================================#
#========== VARIANCE TEST ===========#
#====================================#
var(income$female)
# [1] 41848637
var(income$male)
# [1] 55480051
var.test(income$female, income$male)

# 	F test to compare two variances

# data:  income$female and income$male
# F = 0.7543, num df = 12, denom df = 12, p-value = 0.633
# alternative hypothesis: true ratio of variances is not equal to 1
# 95 percent confidence interval:
#  0.2301608 2.4720521
# sample estimates:
# ratio of variances 
#          0.7543006 


#====================================#
#========== PAIRED T-TEST ===========#
#====================================#
t.test(income$female, income$male, paired=TRUE, alternative="less")

# 	Paired t-test

# data:  income$female and income$male
# t = -7.1496, df = 12, p-value = 5.824e-06
# alternative hypothesis: true difference in means is less than 0
# 95 percent confidence interval:
#       -Inf -8072.674
# sample estimates:
# mean of the differences 
#               -10753.31 


#============================#
#========== ANOVA ===========#
#============================#
aov.data <- data.frame( 
              sex = rep(c("female", "male"), each=nrow(income)),
              income = c(income$female, income$male)
            )
aov.data
#       sex income
# 1  female  25314
# 2  female  28065
# 3  female  26750
# 4  female  25796
# 5  female  28522
# 6  female  28676
# 7  female  29220
# 8  female  31978
# 9  female  33213
# 10 female  27543
# 11 female  43192
# 12 female  46322
# 13 female  30326
# 14   male  40880
# 15   male  36021
# 16   male  38379
# 17   male  37516
# 18   male  37842
# 19   male  39889
# 20   male  40379
# 21   male  46117
# 22   male  54891
# 23   male  40370
# 24   male  48685
# 25   male  54924
# 26   male  28817
one.way <- aov(income ~ sex, data=aov.data)
summary(one.way)
#             Df    Sum Sq   Mean Sq F value   Pr(>F)    
# sex          1 7.516e+08 751618571   15.45 0.000629 ***
# Residuals   24 1.168e+09  48664344                     
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1


#===================================#
#========== RATIO T-TEST ===========#
#===================================#
mean(income$ratio)
# [1] 1.362371
t.test(income$ratio, mu=1, alternative="less")

# 	One Sample t-test

# data:  income$ratio
# t = -7.5003, df = 12, p-value = 3.615e-06
# alternative hypothesis: true mean is less than 1
# 95 percent confidence interval:
#       -Inf 0.8089892
# sample estimates:
# mean of x 
# 0.7494515 


#================================#
#========== SIGN TEST ===========#
#================================#
income$male - income$female
#  [1] 15566  7956 11629 11720  9320 11213 11159 14139 21678 12827  5493  8602 -1509
sign(income$male - income$female)
#  [1]  1  1  1  1  1  1  1  1  1  1  1  1 -1
n_success <- length(which(income$male > income$female))
binom.test(n_success, n=nrow(income), p=0.5, alternative="greater")

# 	Exact binomial test

# data:  n_success and nrow(income)
# number of successes = 12, number of trials = 13, p-value = 0.001709
# alternative hypothesis: true probability of success is greater than 0.5
# 95 percent confidence interval:
#  0.6836602 1.0000000
# sample estimates:
# probability of success 
#              0.9230769 