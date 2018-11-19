class Board

# 
# 0:  . .
# 1:  * * .
# 2:  . .
# 
#    . .
#   * * .
#    . .



  def initialize(string)
    string.split("\n").each_with_index do |line, y|
      line.split(" ").each_with_index do |cell_symbol, x|
        cells << create_cell(cell_symbol, x, y)
      end
    end
    cells.compact!
  end


  def get(x, y)
    cells.find { |c| c.x == x && c.y == y } || DeadCell.new(x, y)
  end

  def to_s

  end

  def neighbors(x, y)
    offsets(y % 2).map do |offset|
      dx, dy = *offset
      get(x + dx, y + dy).value
    end.sum
  end

  def cells
    @cells ||= []
  end

  def create_cell(symbol, x, y)
  	cell_classes = {
      '*' => AliveCell,
      '.' => DeadCell
    }
    cell_classes[symbol].instance(x, y)
  end

  def show(height, width)
  	(0..height-1).map do |y|
      max_cells_in_line = (y % 2 == 0 ? width - 2 : width - 1)
      prefix = y % 2 == 0 ? " " : ""
      prefix + (0..max_cells_in_line).map do |x|
      	get(x, y).to_s
      end.join(" ")
    end.join("\n") + "\n"
  end

  def offsets(oddity)
  	oddity_to_offsets = {
      1 => [[ 0, -1],
            [ 0,  1],
            [-1,  0],
            [ 1,  0],
            [-1, -1],
            [-1,  1]],
      0 => [[ 0, -1],
            [ 0,  1],
            [-1,  0],
            [ 1,  0],
            [ 1,  1],
            [ 1, -1]], 
  	}
    oddity_to_offsets[oddity]
  end

end