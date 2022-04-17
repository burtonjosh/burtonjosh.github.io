# This file was generated, do not modify it. # hide
logistic_model = golf_logistic(x,y,n)
fit_logistic = sample(logistic_model,NUTS(),MCMCThreads(),2000,4) # hide
fit_logistic = sample(logistic_model,NUTS(),MCMCThreads(),2000,4)