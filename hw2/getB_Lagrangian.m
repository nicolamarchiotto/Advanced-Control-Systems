function [B]=getB_Lagrangian()
%Comutation of B in parametric way

[m,~]=getLinkMassesAndCOMs();

[J,~,~,~]=getJacobians();

Jv=J(1:3,:);

B=zeros(3,3);
for i = 1:3
sup = m(i)*[Jv(:,1:i) zeros(3,3-i)].'*[Jv(:,1:i) zeros(3,3-i)];
B=B+sup;
end
end



