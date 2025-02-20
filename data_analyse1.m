function [Poteintial, Fraction] = data_analyse1(isosbestic1, isosbestic2, apex, filename)
%%  Analyze reduction poteintial data in the folder of results excel. Get fraction to voltage plot.
% Fit equation A1/(10^((x-Ema)*n1*39.585/1000)+1)+A2/(10^((x-Emb)*n2*39.585/1000)+1)
resultMatrix = readmatrix(filename);

%% Get the rows of Highend, lowend, and Apex.
row1 = resultMatrix(find(resultMatrix == isosbestic1),2:end);
row2 = resultMatrix(find(resultMatrix == isosbestic2),2:end);
rowApex = resultMatrix(find(resultMatrix == apex),2:end);

%% Get modified Apex
modifiedApex = rowApex - (row1 - (isosbestic1-apex)/(isosbestic1-isosbestic2)*(row1 - row2));
Fraction = [];
for i = 1:numel(modifiedApex)
    Fraction = [Fraction modifiedApex(i)/modifiedApex(1)];
end

%% Plot
Poteintial = resultMatrix(1,2:end);
plot(Poteintial,Fraction)
end