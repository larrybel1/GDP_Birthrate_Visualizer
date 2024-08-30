data = readtable('dataset.xlsx');

% Erased the bottom part of the original
data(652:end, :) = [] ;

% Orginize the data by country name 
sorteddata = sortrows(data,3); 

% Create individual sets corresponding to GDP, infant mortality & Female infant morality rate
GDP = sorteddata(1:217,8:end) ;
IMR = sorteddata(218:434, 8:end) ;
FIMR = sorteddata(435:end, 8:end) ;
list_of_names = sorteddata(1:217,1) ;

ask_country = input('Please enter a country, first letting uppercase rest lowercase: ','s');
index = {ask_country} ;


% Starts the Cycle for creating the tables, 
for i = 1:59
    % Keeps Track of the year for the title 
    year = 1962+i ;
    
    % Converts the tables into arrays 
    xGDP = table2array(GDP) ;
    yIRM = table2array(IMR) ;
    country_names = table2array(list_of_names) ;

    % Plots the arrays, specifically each column in the arrays
    x = xGDP(:,i);
    y = yIRM(:,i); 
    sz = 10; 
    scatter(x,y, sz, "filled", "red")
    axis([0 250000 0 200]);

    % Look for specific country
    position = strcmp( index, country_names);
    x_look = xGDP(position, i);
    y_look = yIRM(position, i);

    % Labeling the graph
    title(year, 'Color','w')
    xlabel("GDP per Capita", 'FontSize', 10) ;
    ylabel("Infant Mortalality Rate per Capita", 'FontSize', 10) ;
    set(gca,'Color',[0 0 0],'XColor',[1 1 1],'YColor',[1 1 1])
    set(gcf,'Color',[0 0 0])

    % Adds names to specific dot
    c = cellstr(index) ;
    dx = 0.1 ;
    dy = 0.1 ;
    text(x_look+dx,y_look+dy, c,'Color', 'w', "fontsize", 10) ; 
    
    % Allows for there to be a pause between each year 
    %pause(.05)
    
   
    frame = getframe(gcf); % saves the current figure in the variable "frame"
    images{i} = frame2im(frame); % stores the frame in the list "images"

end


% filename to save the gif. It will save to the Current Folder
filename = 'motiongraph_country.gif'; 

% variable to control the number of seconds for each frame of gif
gif_time = 0.01; 

% loop that writes the saved "frames" into the gif file
for i = 1:length(images)
    
    [A,map] = rgb2ind(images{i},256);
    if i == 1
        imwrite(A,map,filename,"gif","LoopCount",Inf,"DelayTime",gif_time);
    else
        imwrite(A,map,filename,"gif","WriteMode","append","DelayTime",gif_time);
    end
    
end