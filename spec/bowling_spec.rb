require_relative '../Bowling/bowling.rb'

describe Bowling do

    bowling = Bowling.new

    describe 'total_game_score' do

        it 'returns a score of 70 when a full game is played with no spares or strikes' do
            pins = "54 54 35 62 25 81 52 90 10 12"
            expect(bowling.total_game_score(pins)).to eq(70)
        end

        it 'returns a score of 0 when a full game is played with no spares or strikes (gutter game)' do
            pins = "00 00 00 00 00 00 00 00 00 00"
            expect(bowling.total_game_score(pins)).to eq(0)
        end

        it 'returns a score of 70 when a full game is played with 1 spare (not last frame)' do
            pins = "54 5/ 35 62 25 81 52 90 10 12"
            expect(bowling.total_game_score(pins)).to eq(74)
        end

        it 'returns a score of 87 when a full game is played with multiple spares (not last frame)' do
            pins = "54 5/ 35 62 2/ 81 52 9/ 10 12"
            expect(bowling.total_game_score(pins)).to eq(87)
        end

        it 'returns a score of 133 when a full game is played with all spares except last frame' do
            pins = "5/ 5/ 3/ 6/ 2/ 8/ 5/ 9/ 1/ 12"
            expect(bowling.total_game_score(pins)).to eq(133)
        end

        it 'returns a score of 100 when a full game is played spare in the last frame (1 bonus roll if it not strike)' do
            pins = "54 53 34 62 2/ 8/ 53 90 13 1/4"
            expect(bowling.total_game_score(pins)).to eq(100)
        end

        it 'returns a score of 147 when a full game is played with all spares' do
            pins = "5/ 5/ 3/ 6/ 2/ 8/ 5/ 9/ 1/ 1/7"
            expect(bowling.total_game_score(pins)).to eq(147)
        end

        it 'returns a score of 70 when a full game is played with 1 strike' do
            pins = "52 45 X 12 34 71 43 90 10 33"
            expect(bowling.total_game_score(pins)).to eq(70)
        end

        it 'returns a score of 70 when a full game is played with 2 strikes' do
            pins = "52 45 X 12 X 71 43 90 10 33"
            expect(bowling.total_game_score(pins)).to eq(81)
        end

        it 'returns a score of 101 when a full game is played with 2 strikes are made consecutively (doubel strike)' do
            pins = "54 45 70 12 X X 43 90 81 43"
            expect(bowling.total_game_score(pins)).to eq(101)
        end

        it 'returns a score of 127 when a full game is played with 2 strikes are made consecutively twice (double strike)' do
            pins = "X X 70 12 X X 43 90 81 43"
            expect(bowling.total_game_score(pins)).to eq(127)
        end

        it 'returns a score of 127 when a full game is played with 3 strikes are made consecutively (triple strike)' do
            pins = "X X 70 12 X X X 90 81 43"
            expect(bowling.total_game_score(pins)).to eq(157)
        end

        it 'returns a score of 127 when a full game is played with 3 strikes are made consecutively twice (triple strike)' do
            pins = "X X X 43 X X X 12 72 80"
            expect(bowling.total_game_score(pins)).to eq(162)
        end

        it 'returns a score of 127 when a full game is played with 9 strikes are made consecutively' do
            pins = "X X X X X X X X X 80"
            expect(bowling.total_game_score(pins)).to eq(264)
        end

        it 'returns a score of 95 when a full game is played with a strike in the last frame (2 bonus throws)' do
            pins = "35 81 X 27 10 90 34 61 63 X34"
            expect(bowling.total_game_score(pins)).to eq(95)
        end

        it 'returns a score of 300 when a full game is played with all stikes' do
            pins = "X X X X X X X X X XXX"
            expect(bowling.total_game_score(pins)).to eq(300)
        end

        it 'returns a score of 77 when a full game is played with a spare then a strike' do
            pins = "12 34 5/ X 12 45 90 07 12 30"
            expect(bowling.total_game_score(pins)).to eq(77)
        end
        
        it 'returns a score of 96 when a full game is played with a spare then a strike twice' do
            pins = "12 34 5/ X 12 4/ X 07 12 30"
            expect(bowling.total_game_score(pins)).to eq(96)
        end

        it 'returns a score of 75 when a full game is played with a strike then a spare right after' do
            pins = "12 34 53 X 1/ 43 12 07 12 30"
            expect(bowling.total_game_score(pins)).to eq(75)
        end

        it 'returns a score of 98 when a full game is played with a strike then a spare right after twice' do
            pins = "12 34 53 X 1/ 43 12 X 1/ 30"
            expect(bowling.total_game_score(pins)).to eq(98)
        end

        it 'returns a score of 172 when a full game is played with a mix of strikes and spares randomly' do
            pins = "12 X X 1/ 4/ X X 1/ 3/ X7/"
            expect(bowling.total_game_score(pins)).to eq(172)
        end

        it 'returns a score of 172 when a full game is played with a mix of strikes and spares randomly' do
            pins = "12 X X 1/ 4/ X X 1/ 3/ 7/X"
            expect(bowling.total_game_score(pins)).to eq(169)
        end
    end
end