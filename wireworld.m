function wireworld( gens, size )

	% 0 -> empty, 1 -> conductor, 2 -> electron head, 3 -> electron tail
	figure;
	in = gens;
	cells = zeros(size, size);
	nextGen = zeros(size, size);
	drawGrid(cells);	% show blank screen
	
	% take seed as input
	cells = takeInput(cells);

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
				
				% sum of neighbours (electron heads only)
				sumEH = 0;
				for i = 1:8		
					if cells(neighbours{i}(1), neighbours{i}(2)) == 2
						sumEH = sumEH + cells(neighbours{i}(1), neighbours{i}(2));
					end
				end
				
				% rules
				if cells(x, y) == 0 	% empty to empty
					nextGen(x, y) = 0;
				end
				if cells(x, y) == 2 	% electron head to electron tail
					nextGen(x, y) = 3;
				end
				if cells(x, y) == 3 	% electron tail to conductor
					nextGen(x, y) = 1;
				end
				if cells(x, y) == 1 	% conductor to electron head
					if sumEH == 2 || sumEH == 4	% 1 or 2 electron heads
						nextGen(x, y) = 2;
					else					% otherwise conductor stays conductor
						nextGen(x, y) = 1;
					end
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

function cells = takeInput(in)

	cells = in;	
	
	while 1
		[x, y, key] = ginput(1);
		x = floor(x);
		y = floor(y);
		
		if key == 1		% left click
			if cells(x, y) == 0		% empty to conductor
				cells(x, y) = 1;
			elseif cells(x, y) == 1	% conductor to electron head
				cells(x, y) = 2;
			elseif cells(x, y) == 2	% electron head to electron tail
				cells(x, y) = 3;
			elseif cells(x, y) == 3	% electron tail to empty
				cells(x, y) = 0;
			end
		
			drawGrid(cells);	% show input
		else
			break;	% stop taking input
		end
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
			if cells(x, y) == 1	% conductor
				rectangle('position', [x, y, 1, 1], 'facecolor', 'y');
			end
			if cells(x, y) == 2	% electron head
				rectangle('position', [x, y, 1, 1], 'facecolor', 'b');
			end
			if cells(x, y) == 3	% electron head
				rectangle('position', [x, y, 1, 1], 'facecolor', 'r');
			end
		end
	end

end