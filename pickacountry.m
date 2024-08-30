data = readtable('dataset.xlsx');

% Extracts the list of country names
country_name_list = data.CountryName;

% Ask the user for a Country
ask_country = input('Please enter a country, first letting uppercase rest lowercase: ','s');
% T = array2table(ask_country);
% 
% % % Looks for Country in the list 
% country_xx = data(strcmp(country_name_list,ask_country),:);
% 
% 
% 
% % % Checking for correct spelling 
% spell = ismember(T, country_xx(1,1)) ;
% if spell == 0
%     input('Please reenter the name of the country, First Letter uppercase, the rest lowercase: ', 's')
% end

% Looks for Country in the list 
country_x = data(strcmp(country_name_list,ask_country),:);

% determine the axis for the three individual graphs, the x_axis == years, 
x_axis_years = 1963:2021 ; 
y_axis_GDP = country_x{1,8:end}; % Gross Domestic Product GDP
y_axis_IMR = country_x{2,8:end}; % Infant Mortality Rate IMR
y_axis_FIMR = country_x{3,8:end};% Female Infant Mortality Rate FIMR

tiledlayout (3,1)

nexttile
plot(x_axis_years,y_axis_GDP,'Color', 'green', "LineWidth",2)
title('Change in GDP per Capita', ask_country, 'Color', 'w')
set(gca,'Color',[0 0 0],'XColor',[1 1 1],'YColor',[1 1 1])


nexttile
plot(x_axis_years,y_axis_IMR, 'Color', 'red', "LineWidth",2)
title('Change in Infant Mortality Rate','Color', 'w')
set(gca,'Color',[0 0 0],'XColor',[1 1 1],'YColor',[1 1 1])


nexttile
plot(x_axis_years,y_axis_FIMR, 'Color', 'red', "LineWidth",2)
title('Change in Female Infant Mortality Rate','Color', 'w')
set(gca,'Color',[0 0 0],'XColor',[1 1 1],'YColor',[1 1 1])


set(gcf,'Color',[0 0 0])




