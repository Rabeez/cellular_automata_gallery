function brain( gens, size )
	
	% 0 -> off, 1 -> on, 2 -> dying
	figure;
	in = gens;
	cells = zeros(size, size);
	nextGen = zeros(size, size);
	drawGrid(cells);	% show blank screen
	
	% place random starting 'seed' in approximate middle
	for y = floor(.48*size)-10:10+floor(.48*size)
		for x = floor(.48*size)-10:10+floor(.48*size)
			cells(x, y) = randi(2) - 1;
		end
	end

	title('Generation 0')
	pause(0.000000000000001)
	
	while gens > 0
		
		if sum(cells) == 0	% all cells dead
			break;
		end
		
		for y = 1:size
			for x = 1:size
				
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
					if neighbours{i}(1) > size
						neighbours{i}(1) = 1;
					end
				end
				for i = 6:8	% left to right
					if neighbours{i}(1) < 1
						neighbours{i}(1) = size;
					end
				end
				for i = [1, 3, 6]	% top to bottom
					if neighbours{i}(2) > size
						neighbours{i}(2) = 1;
					end
				end
				for i = [2, 5, 8]	% bottom to top
					if neighbours{i}(2) < 1
						neighbours{i}(2) = size;
					end
				end
				
				% sum of neighbours
				sumOn = 0;
				for i = 1:8	% sum of on
					if cells(neighbours{i}(1), neighbours{i}(2)) == 1
						sumOn = sumOn + cells(neighbours{i}(1), neighbours{i}(2));
					end
				end
				sumDy = 0;
				for i = 1:8	% sum of on
					if cells(neighbours{i}(1), neighbours{i}(2)) == 2
						sumDy = sumDy + cells(neighbours{i}(1), neighbours{i}(2));
					end
				end
				
				% rules
				if cells(x, y) == 0 && sumOn == 2	% reproduction
					nextGen(x, y) = 1;
				end
				if cells(x, y) == 1	% limbo
					nextGen(x, y) = 2;
				end
				if cells(x, y) == 2	% death
					nextGen(x, y) = 0;
				end
				
			end
		end
		
		drawGrid(nextGen);	% show next generation
		title(strcat('Generation ', num2str(in-gens+1)))
		cells = nextGen;
		nextGen = zeros(size, size);	% empty nextGen
		pause(0.00000000000001)
		
		gens = gens - 1;
	end

end

function drawGrid( cells )
	
	% set manual axis properties
	len = length(cells);
	set(gcf, 'units','normalized','outerposition',[0 0 1 1]);
	axis equal; grid on; cla; axis([-1, len+1, -1, len+1]);
	set(gca, 'xtick', 0:len, 'ytick', 0:len);
	set(gca, 'xticklabel', '', 'yticklabel', '');
	
	for y = 1:len
		for x = 1:len
			if cells(x, y) == 1
				rectangle('position', [x, y, 1, 1], 'facecolor', 'g');
			end
			if cells(x, y) == 2
				rectangle('position', [x, y, 1, 1], 'facecolor', 'b');
			end
		end
	end

end