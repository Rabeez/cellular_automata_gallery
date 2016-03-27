function seeds( gens )

	figure;
	in = gens;
	cells = zeros(100, 100);
	nextGen = zeros(100, 100);
	
	% place random starting 'seed' in approximate middle
	for y = 58:62
		for x = 58:62
			cells(x, y) = randi(2) - 1;
		end
	end

	drawGrid(cells, nextGen);	% show seed
	title('Generation 0')
	pause(0.000000000000001)
	
	while gens > 0
		
		for y = 1:100
			for x = 1:100
				
				% moore neighbourhood
				neighbours{1} = [x, y+1];
				neighbours{2} = [x, y-1];
				neighbours{3} = [x+1, y+1];
				neighbours{4} = [x+1, y];
				neighbours{5} = [x+1, y-1];
				neighbours{6} = [x-1, y+1];
				neighbours{7} = [x-1, y];
				neighbours{8} = [x-1, y-1];
				
				% troidal array
				for i = 3:5	% right to left
					if neighbours{i}(1) > 100
						neighbours{i}(1) = 1;
					end
				end
				for i = 6:8	% left to right
					if neighbours{i}(1) < 1
						neighbours{i}(1) = 100;
					end
				end
				for i = [1, 3, 6]	% top to bottom
					if neighbours{i}(2) > 100
						neighbours{i}(2) = 1;
					end
				end
				for i = [2, 5, 8]	% bottom to top
					if neighbours{i}(2) < 1
						neighbours{i}(2) = 100;
					end
				end
				
				% sum of neighbours
				sum = 0;
				for i = 1:8		
					sum = sum + cells(neighbours{i}(1), neighbours{i}(2));
				end
				
				% rules
				if cells(x, y) == 1
					nextGen(x, y) = 0;
				end
				if cells(x, y) == 0 && sum == 2
					nextGen(x, y) = 1;
				end
				
			end
		end
		
		drawGrid(nextGen, cells);	% show next generation
		title(strcat('Generation ', num2str(in-gens+1)))
		cells = nextGen;
		nextGen = zeros(100, 100);	% empty nextGen
		pause(0.00000000000001)
		
		gens = gens - 1;
	end
	
end

function drawGrid( cells, prev )
	
	axis equal; axis off; axis([0, 100, 0, 100]); cla;

	for y = 1:length(cells)
		for x = 1:length(cells)
% 			if cells(x, y) ~= prev(x, y)
				if cells(x, y) == 1
					rectangle('position', [x, y, 1, 1], 'facecolor', 'g');
				end
% 			end
		end
	end

end