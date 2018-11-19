require './board'
require './cell'

describe "board" do

  let(:board) do
    board = Board.new(<<~FOO)
       * * .
      . . * .
       * . .
      . . . .
    FOO
  end

  it "#cells" do
    expect(board.cells.size).to eq(4)
  end

  it "#get(x, y)" do
    expect(board.get(0, 0)).to be_kind_of(AliveCell)
    expect(board.get(0, 3)).to be_kind_of(DeadCell)
    expect(board.get(1, 1)).to be_kind_of(DeadCell)
    expect(board.get(2, 1)).to be_kind_of(AliveCell)
    expect(board.get(1, 2)).to be_kind_of(DeadCell)
    expect(board.get(0, 2)).to be_kind_of(AliveCell)
  end

  it '#neighbors(x, y)' do
    expect(board.neighbors(0, 0)).to eq(1)
    expect(board.neighbors(1, 0)).to eq(2)
    expect(board.neighbors(2, 1)).to eq(1)
    expect(board.neighbors(1, 1)).to eq(4)
  end
  
  it '#show(width, height)' do
    expect(board.show(4, 4)).to eq(<<~FOO)
       * * .
      . . * .
       * . .
      . . . .
    FOO
  end

  it '#next_board' do
    next_board = board.next_board

    expect(next_board.object_id).not_to eq(board.object_id)

    expect(next_board.show(4, 4)).to eq(<<~FOO)
       * * .
      . . * .
       * . .
      . . . .
    FOO
  end
end
