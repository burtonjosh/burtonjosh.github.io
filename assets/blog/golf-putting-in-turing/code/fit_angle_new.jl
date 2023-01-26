# This file was generated, do not modify it. # hide
data_new = readdlm("_assets/blog/golf-putting-in-turing/code/golf_data_new.txt")
x_new, n_new, y_new = data_new[:,1], data_new[:,2], data_new[:,3];
y = y_new./n_new
yerror_new = sqrt.(y .* (1 .-y)./n_new);

angle_model = golf_angle(x_new,y_new,n_new,r,R)
fit_angle = sample(angle_model,NUTS(),MCMCThreads(),2000,4)