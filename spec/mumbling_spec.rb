require_relative '../Mumbling/mumbling.rb'

describe 'mumble' do
    it 'mumble method' do
        expect(mumble('ab')).to eq('A-Bb')
        expect(mumble('abadf')).to eq('A-Bb-Aaa-Dddd-Fffff')
        expect(mumble('abv')).to eq('A-Bb-Vvv')
        expect(mumble('abTG')).to eq('A-Bb-Ttt-Gggg')
        expect(mumble("QWERTY")).to eq("Q-Ww-Eee-Rrrr-Ttttt-Yyyyyy")
    end
end