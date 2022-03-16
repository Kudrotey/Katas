class Bowling
    def total_game_score(pins)

        # checks to see if the last frame contains a spare or strike
        frame_separator = pins.split(" ")
        pins_knocked = pins.delete(" ").split("")
        
        if frame_separator[-1].length == 3
            frame_length = pins_knocked.length - 3
        else
            frame_length = pins_knocked.length
        end

        pins_score = 0

        # loops through the number of pins knocked down and adds to the total score
        for roll in (0...frame_length) do
            strike_spare_calculator(pins_knocked, roll)
            pins_score += pins_knocked[roll].to_i
        end

        # last frame calculation with bonus roll(s) if last frame is a spare or strike
        if is_spare?(pins_knocked[-2])
            pins_score += strike_spare_calculator(pins_knocked, -2) + pins_knocked[-3].to_i
        elsif is_strike?(pins_knocked[-3])
            pins_score += strike_spare_calculator(pins_knocked, -3)
        end

        return pins_score
    end

    def is_spare?(spare_throw)
        spare_throw  == '/'
    end

    def is_strike?(strike_throw)
        strike_throw  == 'X'
    end

    def strike_spare_calculator(frame, throw)
        # calculates for 3 strikes consecutively
        if is_strike?(frame[throw]) && is_strike?(frame[throw + 1]) && is_strike?(frame[throw + 2])
            frame[throw] = 30
        # calculates to see for 2 strikes consecutively
        elsif is_strike?(frame[throw]) && is_strike?(frame[throw + 1])
            frame[throw] = 20 + frame[throw + 2].to_i
        # calculates to see for a strike and then a spare right after
        elsif is_strike?(frame[throw]) && is_spare?(frame[throw + 2])
            frame[throw] = 20
        # calculates to see for a spare and then a strike right after
        elsif is_spare?(frame[throw]) && is_strike?(frame[throw + 1])
            frame[throw] = 20 - frame[throw - 1].to_i
        # calculates to see for only 1 strike
        elsif is_strike?(frame[throw])
            frame[throw] = 10 + frame[throw + 1].to_i + frame[throw + 2].to_i
        # calculates to see for spares
        elsif is_spare?(frame[throw])
            frame[throw] = 10 - frame[throw - 1].to_i + frame[throw + 1].to_i
        end
    end
end
