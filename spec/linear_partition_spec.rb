RSpec.describe LinearPartition do
  let(:r1) { 1.5 }
  let(:r2) { 2.0 / 3.0 }
  let(:r3) { 1.0 }
  let(:k)  { 73 }
  let(:elems) {
    [r1, r1, r1, r2, r2, r2, r1, r1, r2, r1, r2, r1, r2,
     r2, r2, r2, r2, r2, r1, r2, r1, r1, r2, r1, r2, r2,
     r2, r2, r1, r1, r1, r1, r1, r1, r1, r1, r1, r2, r1,
     r1, r1, r2, r2, r2, r2, r1, r1, r2, r1, r1, r1, r1,
     r1, r1, r2, r2, r2, r1, r2, r1, r2, r1, r1, r1, r1,
     r2, r2, r2, r1, r1, r1, r1, r1, r1, r1, r1, r1, r1,
     r2, r1, r1, r1, r1, r1, r1, r1, r1, r1, r1, r1, r1,
     r2, r1, r1, r1, r1, r2, r2, r2, r2, r2, r1, r2, r1,
     r2, r2, r1, r1, r1, r2, r1, r1, r1, r1, r1, r1, r1,
     r1, r1, r2, r1, r2, r1, r1, r1, r1, r1, r1, r2, r2,
     r1, r2, r2, r1, r1, r1, r1, r1, r1, r1, r2, r2, r2,
     r2, r1, r1, r1, r1, r2, r1, r2, r2, r1, r2, r2, r2,
     r1, r1, r2, r1, r2, r2, r1, r1, r1, r1, r2, r2, r3,
     r1, r1, r2, r2, r1, r1, r1, r1, r1, r1, r1, r1, r1]
  }

  let(:solution) {
    [[r1, r1], [r1, r2, r2, r2], [r1, r1], [r2, r1], [r2, r1],
     [r2, r2, r2, r2, r2], [r2, r1, r2], [r1, r1], [r2, r1],
     [r2, r2, r2, r2], [r1, r1], [r1, r1], [r1, r1], [r1, r1],
     [r1, r2], [r1, r1], [r1, r2], [r2, r2, r2, r1], [r1, r2],
     [r1, r1], [r1, r1], [r1, r1], [r2, r2, r2, r1], [r2, r1, r2],
     [r1, r1], [r1, r1], [r2, r2, r2, r1], [r1, r1], [r1, r1],
     [r1, r1], [r1, r1], [r1, r2], [r1, r1], [r1, r1], [r1, r1],
     [r1, r1], [r1, r1], [r1, r1], [r2, r1], [r1, r1], [r1, r2, r2],
     [r2, r2, r2, r1], [r2, r1, r2, r2], [r1, r1], [r1, r2, r1],
     [r1, r1], [r1, r1], [r1, r1], [r1, r1], [r2, r1, r2], [r1, r1],
     [r1, r1], [r1, r1], [r2, r2, r1, r2], [r2, r1, r1], [r1, r1],
     [r1, r1], [r1, r2, r2, r2], [r2, r1, r1], [r1, r1],
     [r2, r1, r2], [r2, r1, r2, r2], [r2, r1, r1], [r2, r1, r2],
     [r2, r1, r1], [r1, r1], [r2, r2, r3], [r1, r1], [r2, r2, r1],
     [r1, r1], [r1, r1], [r1, r1], [r1, r1]]
  }


  it 'has a version number' do
    expect(LinearPartition::VERSION).not_to be nil
  end


  it 'simple_0' do
    expect([1,1,1,1,1,1].linpar(3)).to eq([[1,1],[1,1],[1,1]])
  end

  it 'simple_1' do
    expect([9,2,6,3,8,5,8,1,7,3,4].linpar(3)).to eq([[9,2,6,3],[8,5,8],[1,7,3,4]])
  end

  it 'simple_2' do
    expect([1, 2, 3, 4, 5, 6, 7, 8, 9].linpar(3)).to eq([[1, 2, 3, 4, 5], [6, 7], [8, 9]])
  end

  it 'simple_3' do
    expect([1, 2, 3, 4, 5, 6, 7, 8, 9].linpar(4)).to eq([[1, 2, 3, 4], [5, 6], [7, 8], [9]])
  end

  it 'real' do
    expect(elems.linpar(k)).to eq(solution)
  end
end
