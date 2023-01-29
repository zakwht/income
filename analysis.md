## Plot Analysis

### Ratio Plot
![ratio](/plots/ratio.jpg)

By plotting the ratio of female median income over male median income, we can see that in 12 of 13 provinces and territories, the male median is larger. In Alberta, the female median is $60.51$% of the male median. The exception is Nunavut, where the female median is $5$% greater.

### Boxplot
![boxplot](/plots/boxplot.jpg)

The boxplots for median incomes for each gender reveal males had a greater variance in median income across provinces. More importantly, the entire female boxplot, including the upper quartile, lies below the male inter-quartile range (with the exception of outliers), suggesting a statistically significant differnece between the groups.

## Preamble

### Assumptions

- The data is continuous
- The sample data have been randomly sampled from a population (data represents includes population)
- The distribution of data (across provinces) is approximately normal
- The data across groups is independent

### Variance

The variance of the female and male median incomes between provinces is $ \sigma_f = 41,848,637$ and $ \sigma_m = 55,480,051$, respectively. An F-test for homogeneity of variance is performed:

- $H_0: \sigma_f = \sigma_m$, the variances for median incomes are equal
- $H_1: \sigma_f \neq \sigma_m$, the variances are not equal 
- $F_{obs} = 0.7543$ with $12, 12$ degrees of freedom 
- $p$-value $= 0.633$; $H_0$ is not rejected. 

So we can assume that the variability of the data of females and males is similar.

## Statistical Tests

### Paired t-Test

Since the data is related, and paired, a paired t-test is performed to determine if there is a significant difference in data between each group:

- $H_0: \mu_f = \mu_m$, the means are the same for both groups
- $H_1: \mu_f \neq \mu_m$, the means are not the same
- $t_{obs} = -7.1496$ with $12$ degrees of freedom
- $p$-value = $5.824 \times 10^{-6}$; $H_0$ is rejected

With the rejection of the null hypothesis, we can conclude there is a difference in the mean median income for females and males.

### One-way ANOVA

Taking female and male as treatments, one-way analysis of variance was performed to detect statistical difference between means of each group:

- $H_0: \mu_f = \mu_m$, the means are the same for both groups
- $H_1: \mu_f \neq \mu_m$, the means are not the same
- $F_{obs} = 15.45$ with $1, 24$ degrees of freedom
- $p$-value = $0.000629$; $H_0$ is rejected

Since the null hypothesis is rejected, we can conclude there is a difference in the mean median income for females and males.

### t-Test for Ratio

Taking the ratio of medians for each province (female/male), a t-test was performed to determine if the true ratio of median income is 1 (ie, the median incomes are equal). The ratio accounts for variance derived from different provinces.

- $H_0: \mu_r = 1$, the true ratio is one
- $H_1: \mu_r < 1$, the true ratio is less than one (females make less than males)
- $t_{obs} = -7.5003$ with $12$ degrees of freedom
- $p$-value = $3.615 \times 10^{-6}$; $H_0$ is rejected

Since the null hypothesis is rejected, we can conclude the median income for females is statistically less proportionate to the male equivalent.

### Sign Test

A sign test was performed to determine if female median income tends to be less than male median income, to a statistically significant degree.

- $H_0: P(f > m) = P(f < m)$, female and male medians are equally likely to be greater
- $H_1: P(f > m) < P(f < m)$, the female median tends to be less
- $n = 13, k = 12$, the female median was smaller in 12 provinces
- $p$-value = $0.001709$; $H_0$ is rejected

With the null hypothesis rejected, we can conclude there is a statistically significant tendency for male median income to be greater than the female counterpart in any given province.
