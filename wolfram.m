function wolfram(gens, ruleNum)

	figure;
	axis([0, gens, -gens, 0]);
	cells = zeros(gens);		% gens by gens array
	len = length(cells);
	middle = ceil(len/2);
	cells(1, middle) = 1;		% set middle cell of first row to 1
	
	drawGrid(cells);			% show initial setup
	title('Generation 0')
	pause(0.0125);
	
	for row = 2:len
		for column = 1:len
			
			% find neighbours
			neighbour{1} = [row-1, column-1];
			neighbour{2} = [row-1, column];
			neighbour{3} = [row-1, column+1];
			
			% check for boundary cases and create troid effect
			if neighbour{1}(2) < 1
				neighbour{1}(2) = len;
			end
			if neighbour{3}(2) > len
				neighbour{3}(2) = 1;
			end
			
			cells(row, column) = rule(ruleNum, ...
				cells(neighbour{1}(1), neighbour{1}(2)), ...
				cells(neighbour{2}(1), neighbour{2}(2)), ...
				cells(neighbour{3}(1), neighbour{3}(2)));
			
		end
		% redraw grid after a row is done
		drawGrid(cells);
		title(strcat('Generation ', num2str(row)))
		pause(0.0125);
	end
	
end

function [out] = rule(ruleNum, neighbours1, neighbours2, neighbours3)

	ruleset = de2bi(ruleNum, 8);
	neighbours = [neighbours1, neighbours2, neighbours3];
	possibilities = [ [0, 0, 0];	% all possible combinations of a 3 bit sequence
					[0, 0, 1];
					[0, 1, 0];
					[0, 1, 1];
					[1, 0, 0];
					[1, 0, 1];
					[1, 1, 0];
					[1, 1, 1]; ];
				
	for i = 1:8
		if neighbours == possibilities(i, :)
			out = ruleset(i);
		end
	end
	
end

function drawGrid(array)

	cla; axis equal; axis off;
	
	for i = 1:length(array)
		for j = 1:length(array)
			if array(i, j) == 1
				rectangle('position', [j, -i, 1, 1], 'facecolor', 'k');
			end
		end
	end
	
end