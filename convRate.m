function convHistory = convRate

dof = 2.^(2:6);
convHistory = [];

for k = 1:length(dof)
	convHistory(k) = run2DMPM(dof(k));
end


figure(3); clf;
h = 1./(sqrt(2)*(1:length(dof)));
loglog(h,convHistory,'-bx')
p = polyfit(log(h),log(convHistory),1);
legend(['L^2 error (slope=' num2str(abs(p(1)),'%1.4f') ')'],'Location','NorthEastOutside')
title('Convergence History')
matlab2tikz('output/conv-rate.tikz')




end
