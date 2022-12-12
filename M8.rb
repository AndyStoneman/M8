# Crackling background vinyl / Introduction
live_loop :hiss do
  sample :vinyl_hiss
  sleep sample_duration :vinyl_hiss
end

sleep 8

# Part One

in_thread(name: :main_chords) do
  use_synth :dark_ambience
  with_fx :pitch_shift do
    define :chord_player do |root , mM, inversion|
      play (chord_invert (chord root, mM), inversion), amp: 2, release: 9, attack: 1
    end
  end
  
  3.times do
    amount = 8
    chord_player :f, :major, 0
    sleep amount
    chord_player :f, :major7, 0
    sleep amount
    chord_player :d, :minor, 1
    sleep amount
    chord_player :d, :major, 1
    sleep amount
    chord_player :g, :minor, 1
    sleep amount
    chord_player :c, :major, 2
    sleep amount
    chord_player :f5, :major, 0
    sleep amount
  end
end

# Part Two

sleep 56
in_thread(name: :piano) do
  define :upeggio do |chord, mM, num_times, sleep_time|
    num_times.times do
      use_synth :piano
      with_fx :reverb, pre_mix: 0.5, mix: 1 do
        with_fx :echo, mix: 0.2 do
          with_fx :ping_pong, mix: 0.8 do
            play (chord chord, mM).tick
            sleep sleep_time
          end
        end
      end
    end
  end
  
  define :downeggio do |chord, mM, num_times, sleep_time|
    num_times.times do
      use_synth :piano
      with_fx :reverb, pre_mix: 0.5, mix: 1 do
        with_fx :echo, mix: 0.2 do
          with_fx :ping_pong, mix: 0.8 do
            play (chord chord, mM).reverse.tick
            sleep sleep_time
          end
        end
      end
    end
  end
  
  upeggio(:f5, :major7, 4, 2)
  downeggio(:f5, :major7, 4, 2)
  upeggio(:d5, :minor7, 4, 2)
  downeggio(:d5, :major7, 4, 2)
  upeggio(:g5, :minor7, 4, 2)
  downeggio(:c5, :major7, 4, 2)
  upeggio(:f5, :major, 3, 2)
  play :f6
end

sleep 56

# Part Three

in_thread(name: :bassline) do
  live_loop :bassline do
    use_synth :fm
    amount = 8
    play :f2, sustain: 2, release: 2, amp: 0.4
    sleep 3
    play :a2, sustain: 1, release: 1, amp: 0.4
    sleep 1
    play :c3, sustain: 2, release: 2, amp: 0.4
    sleep 4
    play :d2, sustain: 2, release: 2, amp: 0.4
    sleep 3
    play :e3, sustain: 1, release: 1, amp: 0.4
    sleep 1
    play :d3, sustain: 2, release: 2, amp: 0.4
    sleep 4
    play :d2, sustain: 2, release: 4, amp: 0.4
    sleep amount
    play :d2, sustain: 2, release: 4, amp: 0.4
    sleep 7
    play :f2, sustain: 1, release: 1, amp: 0.4
    sleep 1
    play :g2, sustain: 2, release: 4, amp: 0.4
    sleep 7
    play :b2, sustain: 1, release: 1, amp: 0.4
    sleep 1
    play :c3, sustain: 2, release: 4, amp: 0.4
    sleep amount
    play :f2, sustain: 2, release: 4, amp: 0.4
    sleep amount
  end
end

in_thread(name: :piano2) do
  use_synth = :piano
  upeggio(:f5, :major7, 4, 2)
  downeggio(:f5, :major7, 4, 2)
  upeggio(:d5, :minor7, 4, 2)
  downeggio(:d5, :major7, 4, 2)
  upeggio(:g5, :minor7, 4, 2)
  downeggio(:c5, :major7, 4, 2)
  upeggio(:f5, :major, 3, 2)
  play :f6
end

sleep 56

#Part Four / Bridge

in_thread(name: :bridge_guitar) do
  define :guitar do |pitch_level|
    with_fx :echo, mix: 0.5 do
      with_fx :reverb, mix: 0.8 do
        sample :guit_e_fifths, pitch: pitch_level, rate: 0.5
        sleep 4
      end
    end
  end
  
  guitar(1)
  guitar(-1)
  guitar(1)
  guitar(-1)
  guitar(1)
  guitar(-1)
  guitar(1)
  guitar(-1)
end

in_thread(name: :bridge_bassline) do
  
  live_loop :bassline do
    use_synth :fm
    amount = 8
    play :f2, sustain: 2, release: 2, amp: 0.4
    sleep 3
    play :a2, sustain: 1, release: 1, amp: 0.4
    sleep 1
    play :c3, sustain: 2, release: 2, amp: 0.4
    sleep 4
    play :d2, sustain: 2, release: 2, amp: 0.4
    sleep 3
    play :e3, sustain: 1, release: 1, amp: 0.4
    sleep 1
    play :d3, sustain: 2, release: 2, amp: 0.4
    sleep 4
    play :d2, sustain: 2, release: 4, amp: 0.4
    sleep amount
    play :d2, sustain: 2, release: 4, amp: 0.4
    sleep 7
    play :f2, sustain: 1, release: 1, amp: 0.4
    sleep 1
    play :g2, sustain: 2, release: 4, amp: 0.4
    sleep 7
    play :b2, sustain: 1, release: 1, amp: 0.4
    sleep 1
    play :c3, sustain: 2, release: 4, amp: 0.4
    sleep amount
    play :f2, sustain: 2, release: 4, amp: 0.4
    sleep amount
  end
end

sleep 56

# Part Five / Finale

in_thread(name: :finale_guitar) do
  define :guitar do |pitch_level|
    with_fx :echo, mix: 0.5 do
      with_fx :reverb, mix: 0.8 do
        sample :guit_e_fifths, pitch: pitch_level, rate: 0.5
        sleep 4
      end
    end
  end
  
  guitar(1)
  guitar(-1)
  guitar(1)
  guitar(-1)
  guitar(1)
  guitar(-1)
  guitar(1)
  guitar(-1)
end

in_thread(name: :finale_bassline) do
  
  live_loop :bassline do
    use_synth :fm
    amount = 8
    play :f2, sustain: 2, release: 2, amp: 0.4
    sleep 3
    play :a2, sustain: 1, release: 1, amp: 0.4
    sleep 1
    play :c3, sustain: 2, release: 2, amp: 0.4
    sleep 4
    play :d2, sustain: 2, release: 2, amp: 0.4
    sleep 3
    play :e3, sustain: 1, release: 1, amp: 0.4
    sleep 1
    play :d3, sustain: 2, release: 2, amp: 0.4
    sleep 4
    play :d2, sustain: 2, release: 4, amp: 0.4
    sleep amount
    play :d2, sustain: 2, release: 4, amp: 0.4
    sleep 7
    play :f2, sustain: 1, release: 1, amp: 0.4
    sleep 1
    play :g2, sustain: 2, release: 4, amp: 0.4
    sleep 7
    play :b2, sustain: 1, release: 1, amp: 0.4
    sleep 1
    play :c3, sustain: 2, release: 4, amp: 0.4
    sleep amount
    play :f2, sustain: 2, release: 4, amp: 0.4
    sleep amount
  end
end

in_thread(name: :finale_chords) do
  use_synth :dark_ambience
  with_fx :pitch_shift do
    define :chord_player do |root , mM, inversion|
      play (chord_invert (chord root, mM), inversion), amp: 2, release: 9, attack: 1
    end
  end
  
  3.times do
    use_synth = :dark_ambience
    amount = 8
    chord_player :f, :major, 0
    sleep amount
    chord_player :f, :major7, 0
    sleep amount
    chord_player :d, :minor, 1
    sleep amount
    chord_player :d, :major, 1
    sleep amount
    chord_player :g, :minor, 1
    sleep amount
    chord_player :c, :major, 2
    sleep amount
    chord_player :f5, :major, 0
    sleep amount
  end
end

in_thread(name: :finale_piano) do
  use_synth = :piano
  upeggio(:f5, :major7, 4, 2)
  downeggio(:f5, :major7, 4, 2)
  upeggio(:d5, :minor7, 4, 2)
  downeggio(:d5, :major7, 4, 2)
  upeggio(:g5, :minor7, 4, 2)
  downeggio(:c5, :major7, 4, 2)
  upeggio(:f5, :major, 3, 2)
  play :f6
end

in_thread(name: :finale_drums) do
  live_loop :drums do
    with_fx :reverb, mix: 0.9 do
      with_fx :ping_pong, mix: 0.7 do
        sample :elec_mid_snare
        sleep 2
        sample :elec_filt_snare, amp: 0.3
        sleep 2
      end
    end
  end
end


